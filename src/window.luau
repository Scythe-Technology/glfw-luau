--!strict
local ffi = zune.ffi;

local c = require("./c");

local glfw = c.glfw;

local window = {};
window.__index = window;

function window.init(ptr: FFIPointer)
    return setmetatable({
        handle = ptr::FFIPointer?,
        callbacks = {}::{[string]: FFIPointer?},
    }, window);
end

--[=[
    Returns the title of the specified window.
]=]
function window.getTitle(self: Window): string
    if (not self.handle) then
        error("Window handle is invalid");
    end
    return buffer.tostring(glfw.glfwGetWindowTitle(self.handle):span());
end

--[=[
    Sets the title of the specified window.
]=]
function window.setTitle(self: Window, title: string): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwSetWindowTitle(self.handle, title);
end

--[=[
    Retrieves the position of the content area of the specified window. 
]=]
function window.getPosition(self: Window): (number, number)
    if (not self.handle) then
        error("Window handle is invalid");
    end
    local x = ffi.alloc(ffi.types.i32:size()):release();
    local y = ffi.alloc(ffi.types.i32:size()):release();
    glfw.glfwGetWindowPos(
        self.handle,
        x,
        y
    );
    return x:readi32(), y:readi32();
end

--[=[
    Sets the position of the content area of the specified window.
]=]
function window.setPosition(self: Window, x: number, y: number): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwSetWindowPos(self.handle, x, y);
end

--[=[
    Retrieves the size of the content area of the specified window.
]=]
function window.getSize(self: Window): (number, number)
    if (not self.handle) then
        error("Window handle is invalid");
    end
    local width = ffi.alloc(ffi.types.i32:size()):release();
    local height = ffi.alloc(ffi.types.i32:size()):release();
    glfw.glfwGetWindowSize(
        self.handle,
        width,
        height
    );
    return width:readi32(), height:readi32();
end

--[=[
    Retrieves the size of the framebuffer of the specified window.
]=]
function window.getFramebufferSize(self: Window): (number, number)
    if (not self.handle) then
        error("Window handle is invalid");
    end
    local width = ffi.alloc(ffi.types.i32:size()):release();
    local height = ffi.alloc(ffi.types.i32:size()):release();
    glfw.glfwGetFramebufferSize(
        self.handle,
        width,
        height
    );
    return width:readi32(), height:readi32();
end

--[=[
    Sets the size of the content area of the specified window.
]=]
function window.setSize(self: Window, width: number, height: number): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwSetWindowSize(self.handle, width, height);
end

--[=[
    Sets the size limits of the specified window.
]=]
function window.setSizeLimits(self: Window, minwidth: number, minheight: number, maxwidth: number, maxheight: number): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwSetWindowSizeLimits(self.handle, minwidth, minheight, maxwidth, maxheight);
end

--[=[
    Sets the aspect ratio of the specified window.
]=]
function window.setAspectRatio(self: Window, numer: number, denom: number): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwSetWindowAspectRatio(self.handle, numer, denom);
end

--[=[
    Returns the opacity of the whole window.
]=]
function window.getOpacity(self: Window): number
    if (not self.handle) then
        error("Window handle is invalid");
    end
    return glfw.glfwGetWindowOpacity(self.handle);
end

--[=[
    Sets the opacity of the whole window.
]=]
function window.setOpacity(self: Window, opacity: number): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwSetWindowOpacity(self.handle, opacity);
end

--[=[
    Restores the specified window.
]=]
function window.restore(self: Window): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwRestoreWindow(self.handle);
end

--[=[
    Maximizes the specified window.
]=]
function window.maximize(self: Window): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwMaximizeWindow(self.handle);
end

--[=[
    Shows the specified window.
]=]
function window.show(self: Window): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwShowWindow(self.handle);
end

--[=[
    Hides the specified window.
]=]
function window.hide(self: Window): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwHideWindow(self.handle);
end

--[=[
    Brings the specified window to front and sets input focus.
]=]
function window.focus(self: Window): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwFocusWindow(self.handle);
end

--[=[
    Requests user attention to the specified window.
]=]
function window.requestAttention(self: Window): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwRequestWindowAttention(self.handle);
end

--TODO: Implement `Monitor`
--[=[
    Retrieves the monitor that the window is in fullscreen on.
]=]
function window.getMonitor(self: Window): FFIPointer
    if (not self.handle) then
        error("Window handle is invalid");
    end
    return glfw.glfwGetWindowMonitor(self.handle);
end

--TODO: Implement `Monitor`
--[=[
    Sets the mode, monitor, video mode and placement of a window.
]=]
function window.setMonitor(self: Window, monitor: FFIPointer, xpos: number, ypos: number, width: number, height: number, refreshRate: number): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwSetWindowMonitor(self.handle, monitor, xpos, ypos, width, height, refreshRate);
end

--[=[
    Makes the context of the specified window current for the calling thread.
]=]
function window.makeContextCurrent(self: Window): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwMakeContextCurrent(self.handle);
end

--[=[
    Sets the position callback for the specified window.
]=]
function window.setPositionCallback(self: Window, callback: (window: Window, xpos: number, ypos: number) -> ()): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    local closure = ffi.closure(glfw.GLFWwindowposfun, callback);
    self.callbacks.pos = closure;
    glfw.glfwSetWindowPosCallback(self.handle, closure);
end

--[=[
    Sets the size callback for the specified window.
]=]
function window.setSizeCallback(self: Window, callback: (window: Window, width: number, height: number) -> ()): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    local closure = ffi.closure(glfw.GLFWwindowsizefun, callback);
    self.callbacks.size = closure;
    glfw.glfwSetWindowSizeCallback(self.handle, closure);
end

local function setOptionalCallback(name: string, ffiFn : (...any) -> FFIPointer, window: Window, fnDef: FFIFunctionDef, callback: ((...any) -> any)?): ()
    local previousCallback = window.callbacks[name];
    if (previousCallback) then
        previousCallback:release();
    end
    if (not callback) then
        ffiFn(window.handle, nil);
        window.callbacks[name] = nil;
        return;
    end
    local closure = ffi.closure(glfw.GLFWwindowclosefun, function(...)
        local args = {...};
        if (args[1] == window.handle) then
            return callback(window, select(2, ...));
        end
        return callback(...);
    end);
    ffiFn(window.handle, closure);
    window.callbacks[name] = closure;
end

--[=[
    Sets the close callback for the specified window.
]=]
function window.setCloseCallback(self: Window, callback: ((window: Window) -> ())?): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    setOptionalCallback(
        "close",
        glfw.glfwSetWindowCloseCallback,
        self,
        glfw.GLFWwindowclosefun,
        callback
    );
end

--[=[
    Sets the refresh callback for the specified window.
]=]
function window.setRefreshCallback(self: Window, callback: (window: Window) -> ()): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    setOptionalCallback(
        "refresh",
        glfw.glfwSetWindowRefreshCallback,
        self,
        glfw.GLFWwindowrefreshfun,
        callback
    );
end

--[=[
    Sets the focus callback for the specified window.
]=]
function window.setFocusCallback(self: Window, callback: (window: Window, focused: number) -> ()): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    setOptionalCallback(
        "focus",
        glfw.glfwSetWindowFocusCallback,
        self,
        glfw.GLFWwindowfocusfun,
        callback
    );
end

--[=[
    Sets the iconify callback for the specified window.
]=]
function window.setIconifyCallback(self: Window, callback: (window: Window, iconified: number) -> ()): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    setOptionalCallback(
        "iconify",
        glfw.glfwSetWindowIconifyCallback,
        self,
        glfw.GLFWwindowiconifyfun,
        callback
    );
end

--[=[
    Sets the maximize callback for the specified window.
]=]
function window.setMaximizeCallback(self: Window, callback: (window: Window, maximized: number) -> ()): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    setOptionalCallback(
        "maximize",
        glfw.glfwSetWindowMaximizeCallback,
        self,
        glfw.GLFWwindowmaximizefun,
        callback
    );
end

--[=[
    Sets the framebuffer size callback for the specified window.
]=]
function window.setFramebufferSizeCallback(self: Window, callback: (window: Window, width: number, height: number) -> ()): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    setOptionalCallback(
        "framebufferSize",
        glfw.glfwSetFramebufferSizeCallback,
        self,
        glfw.GLFWframebuffersizefun,
        callback
    );
end

--[=[
    Sets the window content scale callback for the specified window.
]=]
function window.setContentScaleCallback(self: Window, callback: (window: Window, xScale: number, yScale: number) -> ()): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    setOptionalCallback(
        "contentScale",
        glfw.glfwSetWindowContentScaleCallback,
        self,
        glfw.GLFWwindowcontentscalefun,
        callback
    );
end

--[=[
    Swaps the front and back buffers of the window.
]=]
function window.swapBuffers(self: Window): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    glfw.glfwSwapBuffers(self.handle);
end

--[=[
    Returns whether the window should close.
]=]
function window.shouldClose(self: Window): boolean
    if (not self.handle) then
        return true;
    end
    return glfw.glfwWindowShouldClose(self.handle) == glfw.GLFW_TRUE;
end

--[=[
    Destroys the specified window and its context.
]=]
function window.destroy(self: Window): ()
    if (not self.handle) then
        return;
    end
    glfw.glfwDestroyWindow(self.handle);
    self.handle = nil::any;
end

export type Window = typeof(window.init(ffi.alloc(0)));

return window;