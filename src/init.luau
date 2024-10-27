--!strict
local ffi = require("@zcore/ffi");

local c = require("c");

local glfw = c.glfw;

local window = require("window");

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
    local description = ffi.alloc(ffi.sizeOf(ffi.types.pointer)):release();
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

do
    local testing = require("@zcore/testing");

    testing.test("Run", function()
        print(module.getVersionString())
    
        module.init();
        
        local w = module.createWindow("Zune - GLFW", 640, 480);
        print(w:getSize());
        w:setSize(800, 600);
        
        w:setCloseCallback(function(window)
            print("Window closed");
        end);
        
        while w:shouldClose() == false do
            
            module.PollEvents();

            w:swapBuffers();
            -- print(w:getPosition());
        end

        w:destroy();

        module.terminate();
    end)
end

return module;