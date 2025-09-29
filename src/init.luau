--!strict
local ffi = zune.ffi

local c = require("@self/c");

local glfw = c.glfw;

local window = require("@self/window");

local module = {};

module.gl = require("@self/gl");

module.D = c.defined;

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
    return error_name, buffer.tostring(description:readptr():span());
end

function module.getPlatform(): number
    return glfw.glfwGetPlatform();
end
function module.getProcAddress(name: string): FFIPointer
    return glfw.glfwGetProcAddress(name);
end
function module.extensionSupported(extension: string): boolean
    return glfw.glfwExtensionSupported(extension) == glfw.GLFW_TRUE;
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
    if (ptr == ffi.null) then
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

return module;