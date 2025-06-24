--!strict
local ffi = zune.ffi

local c = require("@self/c");

local glfw = c.glfw;

local window = require("@self/window");

local module = {};

function module.init(): ()
    if (glfw.glfwInit() == glfw.GLFW_FALSE) then
        module.emitError();
    end
end

function module.terminate(): ()
    glfw.glfwTerminate();
end

function module.getVersionString(): string
    return buffer.tostring(glfw.glfwGetVersionString():span());
end

function module.emitError() : never
    local errname, errdesc = module.getError();
    assert(errname and errdesc, "Failed to read error information");
    error(`{errname} - {errdesc}`)
end

function module.getError() : (string?, string?)
    local description = ffi.alloc(ffi.types.pointer:size()):release();
    local code = glfw.glfwGetError(description);
    if (code == 0) then
        return nil;
    end
    local error_name = c.ErrorCodes[code];
    return error_name, buffer.tostring(description:readPtr():span());
end

function module.getPlatform(): number
    return glfw.glfwGetPlatform();
end
function module.getPlatformName(platform: number): string
    return c.Platforms[platform];
end

function module.platformSupported(platform: number): boolean
    return glfw.glfwPlatformSupported(platform) == glfw.GLFW_TRUE;
end

function module.WindowHint(hint: number, value: number): ()
    glfw.glfwWindowHint(hint, value);
end

function module.WindowHintString(hint: number, value: string): ()
    glfw.glfwWindowHintString(hint, value);
end

function module.createWindow(title: string, width: number, height: number): window.Window
    local ptr = glfw.glfwCreateWindow(width, height, title, nil, nil);
    if (ptr:isNull()) then
        module.emitError();
    end
    return window.init(ptr);
end

function module.PollEvents(): ()
    glfw.glfwPollEvents();
end

function module.swapInterval(interval: number): ()
    glfw.glfwSwapInterval(interval);
end

do
    local testing = zune.testing

    local gl = require("@self/build/gl");

    testing.test("Run", function()
        local function createShader(type: number, src: string): number
            local shader: number = gl.CreateShader(type);
            if (shader == 0) then
                error(`Failed to create shader of type: {type}`);
            end

            print(shader);

            local src_buf = ffi.dupe(buffer.fromstring(src)):release();
            local lengthPtr = ffi.alloc(ffi.types.i32:size()):release();
            lengthPtr:writei32(0, #src);
            
            gl.ShaderSource(shader, 1, ffi.getRef(src_buf):release(), lengthPtr);
            gl.CompileShader(shader);

            local success = ffi.alloc(ffi.types.i32:size()):release();
            
            gl.GetShaderiv(shader, gl.COMPILE_STATUS, success);
            
            if (success:readi32() == 0) then
                local len = ffi.alloc(ffi.types.i32:size()):release();
                
                gl.GetShaderiv(shader, gl.INFO_LOG_LENGTH, len);

                local str_buf = ffi.alloc(ffi.types.u8:size() * (len:readi32() + 1), ffi.types.u8:alignment()):release();
                
                gl.GetShaderInfoLog(shader, len:readi32(), nil, str_buf);
                
                error(`shader compile error: {buffer.tostring(str_buf:span())}`);
            end

            return shader;
        end

        module.init();
        
        local OPENGL_CORE_PROFILE = 0x00032001;
        module.WindowHint(c.defined.GLFW_CONTEXT_VERSION_MAJOR, 3)
        module.WindowHint(c.defined.GLFW_CONTEXT_VERSION_MINOR, 3)
        module.WindowHint(c.defined.GLFW_OPENGL_PROFILE, OPENGL_CORE_PROFILE);

        local w = module.createWindow("Zune - GLFW", 640, 480);
        print(w:getSize());
        w:makeContextCurrent();
        glfw.glfwSwapInterval(1);

        gl.LoadGL(c.glfw.glfwGetProcAddress);

        local vertexShader = createShader(gl.VERTEX_SHADER, [[
            #version 330 core
            layout (location = 0) in vec3 aPos;
            void main()
            {
                gl_PointSize = 100.0;
                gl_Position = vec4(aPos, 1);
            }
        ]]);
        local fragmentShader = createShader(gl.FRAGMENT_SHADER, [[
            #version 330 core
            out vec4 FragColor;

            uniform vec2 u_resolution;
            uniform vec2 u_time;

            void main()
            {
                vec2 st = gl_FragCoord.xy / u_resolution;
                float mixValue = distance(st, vec2(1, 1));

                vec3 color1 = vec3(0,1,u_time.x);
                vec3 color2 = vec3(1,u_time.y,0);

                vec3 color = mix(color1, color2, mixValue);

                FragColor = vec4(color, 1);
            }
        ]]);

        local program = gl.CreateProgram();
        if (program == 0) then
            error("Failed to create shader program");
        end

        gl.AttachShader(program, vertexShader);
        gl.AttachShader(program, fragmentShader);
        gl.LinkProgram(program);

        do
            local success = ffi.alloc(ffi.types.i32:size()):release();

            gl.GetProgramiv(program, gl.LINK_STATUS, success);
            
            if (success:readi32() == 0) then
                local len = ffi.alloc(ffi.types.i32:size()):release();

                gl.GetProgramiv(program, gl.INFO_LOG_LENGTH, len);

                local str_buf = ffi.alloc(ffi.types.u8:size() * (len:readi32() + 1), ffi.types.u8:alignment()):release();
                
                gl.GetProgramInfoLog(program, len:readi32(), nil, str_buf);
                
                error(`program compile error: {buffer.tostring(str_buf:span())}`)
            end
        end

        gl.DeleteShader(vertexShader);
        gl.DeleteShader(fragmentShader);

        print(module.getVersionString())

        gl.ClearColor(0.0, 0.0, 0.0, 1.0);
        
        w:setCloseCallback(function(window)
            print("Window closed");
        end);

        local VAO, VBO = ffi.alloc(ffi.types.i32:size()):release(), ffi.alloc(ffi.types.i32:size()):release();
        gl.GenVertexArrays(1, VAO);
        gl.GenBuffers(1, VBO);

        local vertices = {
            0.0,  0.5, 0.0,
            -0.5, -0.5, 0.0,
            0.5, -0.5, 0.0
        }

        local vertexData = ffi.alloc(ffi.types.float:size() * #vertices, ffi.types.float:alignment()):release();
        for i, v in ipairs(vertices) do
            vertexData:writef32((i - 1) * ffi.types.float:size(), v);
        end
        
        gl.BindVertexArray(VAO:readi32());
        gl.BindBuffer(gl.ARRAY_BUFFER, VBO:readi32());
        gl.BufferData(gl.ARRAY_BUFFER, ffi.types.float:size() * #vertices, vertexData, gl.DYNAMIC_DRAW);
        gl.VertexAttribPointer(0, 3, gl.FLOAT, false, 3 * ffi.types.float:size(), nil);
        gl.EnableVertexAttribArray(0);

        while w:shouldClose() == false do
            gl.Clear(gl.COLOR_BUFFER_BIT);

            gl.UseProgram(program);
            local scale = math.sin(os.clock())/8 + 1;
            for i, v in ipairs(vertices) do
                vertexData:writef32((i - 1) * ffi.types.float:size(), scale * v);
            end
            gl.BufferData(gl.ARRAY_BUFFER, ffi.types.float:size() * #vertices, vertexData, gl.DYNAMIC_DRAW);
            gl.Uniform2f(gl.GetUniformLocation(program, "u_resolution"), 640, 480);
            gl.Uniform2f(gl.GetUniformLocation(program, "u_time"), math.abs(math.sin(os.clock())), math.abs(math.sin(os.clock())));
            gl.DrawArrays(gl.TRIANGLES, 0, 3);

            local x, y = w:getFramebufferSize();
            gl.Viewport(0, 0, x, y)

            w:swapBuffers();
            module.PollEvents();
        end

        w:destroy();

        module.terminate();
    end)
end

return module;