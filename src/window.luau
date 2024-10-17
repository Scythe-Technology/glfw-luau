--!strict
local ffi = require("@zcore/ffi");

local c = require("c");

local glfw = c.glfw;

local window = {};
window.__index = window;

function window.init(ptr: buffer)
    return setmetatable({
        handle = ptr::buffer?,
        callbacks = {}::{[string]: any?},
    }, window);
end

--[=[
    Returns the title of the specified window.
]=]
function window.getTitle(self: Window): string
    if (not self.handle) then
        error("Window handle is invalid");
    end
    return buffer.tostring(ffi.spanFromPtr(glfw.glfwGetWindowTitle(self.handle), 0));
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
    local x = buffer.create(ffi.sizeOf(ffi.types.i32));
    local y = buffer.create(ffi.sizeOf(ffi.types.i32));
    glfw.glfwGetWindowPos(
        self.handle,
        ffi.bufferToPtr(x),
        ffi.bufferToPtr(y)
    );
    return buffer.readi32(x, 0), buffer.readi32(y, 0);
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
    local width = buffer.create(ffi.sizeOf(ffi.types.i32));
    local height = buffer.create(ffi.sizeOf(ffi.types.i32));
    glfw.glfwGetWindowSize(
        self.handle,
        ffi.bufferToPtr(width),
        ffi.bufferToPtr(height)
    );
    return buffer.readi32(width, 0), buffer.readi32(height, 0);
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
function window.getMonitor(self: Window): buffer
    if (not self.handle) then
        error("Window handle is invalid");
    end
    return glfw.glfwGetWindowMonitor(self.handle);
end

--TODO: Implement `Monitor`
--[=[
    Sets the mode, monitor, video mode and placement of a window.
]=]
function window.setMonitor(self: Window, monitor: buffer, xpos: number, ypos: number, width: number, height: number, refreshRate: number): ()
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
    glfw.glfwSetWindowPosCallback(self.handle, closure.ptr);
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
    glfw.glfwSetWindowSizeCallback(self.handle, closure.ptr);
end

local function setOptionalCallback(ffiFn : (...any) -> any, window: Window, fnDef: ffi.FunctionDefinition, callback: ((...any) -> any)?): ffi.Closure?
    if (not callback) then
        ffiFn(window.handle, nil);
        return nil;
    end
    local closure = ffi.closure(glfw.GLFWwindowclosefun, function(...)
        local args = {...};
        if (ffi.eqlPtr(args[1], window.handle)) then
            return callback(window, select(2, ...));
        end
        return callback(...);
    end);
    ffiFn(window.handle, closure.ptr);
    return closure;
end

--[=[
    Sets the close callback for the specified window.
]=]
function window.setCloseCallback(self: Window, callback: ((window: Window) -> ())?): ()
    if (not self.handle) then
        error("Window handle is invalid");
    end
    self.callbacks.close = setOptionalCallback(
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
    self.callbacks.refresh = setOptionalCallback(
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
    self.callbacks.focus = setOptionalCallback(
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
    self.callbacks.iconify = setOptionalCallback(
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
    self.callbacks.maximize = setOptionalCallback(
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
    self.callbacks.framebufferSize = setOptionalCallback(
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
    self.callbacks.contentScale = setOptionalCallback(
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

export type Window = typeof(window.init(buffer.create(0)));

return window;