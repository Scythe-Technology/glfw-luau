--!strict
local fs = require("@zcore/fs");
local ffi = require("@zcore/ffi");
local process = require("@zcore/process");

local GLFW_TRUE = 1;
local GLFW_FALSE = 0;

local LIBRARY_PATH = `./libs/glfw/build/src/{ffi.prefix}glfw.{ffi.suffix}`;
if (process.os == "windows") then
    LIBRARY_PATH = `./libs/glfw/build/src/{
        if (fs.isDir(`./libs/glfw/build/src/Release`)) then "Release" else "Debug"
    }/{ffi.prefix}glfw3.{ffi.suffix}`;
end

--void(* GLFWwindowsizefun) (GLFWwindow *window, int width, int height)
local GLFWwindowsizefun = {
    returns = ffi.types.void,
    args = {ffi.types.pointer, ffi.types.i32, ffi.types.i32},
};
--void(* GLFWwindowposfun) (GLFWwindow *window, int xpos, int ypos)
local GLFWwindowposfun = {
    returns = ffi.types.void,
    args = {ffi.types.pointer, ffi.types.i32, ffi.types.i32},
};
--void(* GLFWwindowclosefun) (GLFWwindow *window)
local GLFWwindowclosefun = {
    returns = ffi.types.void,
    args = {ffi.types.pointer},
};
--void(* GLFWwindowrefreshfun) (GLFWwindow *window)
local GLFWwindowrefreshfun = {
    returns = ffi.types.void,
    args = {ffi.types.pointer},
};
--void(* GLFWwindowfocusfun) (GLFWwindow *window, int focused)
local GLFWwindowfocusfun = {
    returns = ffi.types.void,
    args = {ffi.types.pointer, ffi.types.i32},
};
--void(* GLFWwindowiconifyfun) (GLFWwindow *window, int iconified)
local GLFWwindowiconifyfun = {
    returns = ffi.types.void,
    args = {ffi.types.pointer, ffi.types.i32},
};
--void(* GLFWwindowmaximizefun) (GLFWwindow *window, int maximized)
local GLFWwindowmaximizefun = {
    returns = ffi.types.void,
    args = {ffi.types.pointer, ffi.types.i32},
};
--void(* GLFWframebuffersizefun) (GLFWwindow *window, int width, int height)
local GLFWframebuffersizefun = {
    returns = ffi.types.void,
    args = {ffi.types.pointer, ffi.types.i32, ffi.types.i32},
};
--void(* GLFWwindowcontentscalefun) (GLFWwindow *window, float xscale, float yscale)
local GLFWwindowcontentscalefun = {
    returns = ffi.types.void,
    args = {ffi.types.pointer, ffi.types.float, ffi.types.float},
};

local glfw = ffi.dlopen(LIBRARY_PATH, {
    --int glfwInit (void)
    glfwInit = {
        returns = ffi.types.i32,
        args = {},
    },
    --void glfwTerminate (void)
    glfwTerminate = {
        returns = ffi.types.void,
        args = {},
    },
    --void glfwInitHint (int hint, int value)
    glfwInitHint = {
        returns = ffi.types.void,
        args = {ffi.types.i32, ffi.types.i32},
    },
    --const char *glfwGetVersionString (void)
    glfwGetVersionString = {
        returns = ffi.types.pointer,
        args = {},
    },
    --int glfwGetError (const char **description)
    glfwGetError = {
        returns = ffi.types.i32,
        args = {ffi.types.pointer},
    },
    --int glfwGetPlatform (void)
    glfwGetPlatform = {
        returns = ffi.types.i32,
        args = {},
    },
    --int glfwPlatformSupported (int platform)
    glfwPlatformSupported = {
        returns = ffi.types.i32,
        args = {ffi.types.i32},
    },

    --GLFWwindow *glfwCreateWindow (int width, int height, const char *title, GLFWmonitor *monitor, GLFWwindow *share)
    glfwCreateWindow = {
        returns = ffi.types.pointer,
        args = {ffi.types.i32, ffi.types.i32, ffi.types.pointer, ffi.types.pointer, ffi.types.pointer},
    },
    --void glfwDestroyWindow (GLFWwindow *window)
    glfwDestroyWindow = {
        returns = ffi.types.void,
        args = {ffi.types.pointer},
    },
    --int glfwWindowShouldClose (GLFWwindow *window)
    glfwWindowShouldClose = {
        returns = ffi.types.i32,
        args = {ffi.types.pointer},
    },
    --const char *glfwGetWindowTitle (GLFWwindow *window)
    glfwGetWindowTitle = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer},
    },
    --void glfwSetWindowTitle (GLFWwindow *window, const char *title)
    glfwSetWindowTitle = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --void glfwGetWindowPos (GLFWwindow *window, int *xpos, int *ypos)
    glfwGetWindowPos = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.pointer, ffi.types.pointer},
    },
    --void glfwSetWindowPos (GLFWwindow *window, int xpos, int ypos)
    glfwSetWindowPos = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.i32, ffi.types.i32},
    },
    --void glfwGetWindowSize (GLFWwindow *window, int *width, int *height)
    glfwGetWindowSize = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.pointer, ffi.types.pointer},
    },
    --void glfwSetWindowSizeLimits (GLFWwindow *window, int minwidth, int minheight, int maxwidth, int maxheight)
    glfwSetWindowSizeLimits = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.i32, ffi.types.i32, ffi.types.i32, ffi.types.i32},
    },
    --void glfwSetWindowAspectRatio (GLFWwindow *window, int numer, int denom)
    glfwSetWindowAspectRatio = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.i32, ffi.types.i32},
    },
    --void glfwSetWindowSize (GLFWwindow *window, int width, int height)
    glfwSetWindowSize = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.i32, ffi.types.i32},
    },
    --void glfwGetFramebufferSize (GLFWwindow *window, int *width, int *height)
    glfwGetFramebufferSize = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.pointer, ffi.types.pointer},
    },
    --void glfwGetWindowFrameSize (GLFWwindow *window, int *left, int *top, int *right, int *bottom)
    glfwGetWindowFrameSize = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.pointer, ffi.types.pointer, ffi.types.pointer, ffi.types.pointer},
    },
    --float glfwGetWindowOpacity (GLFWwindow *window)
    glfwGetWindowOpacity = {
        returns = ffi.types.float,
        args = {ffi.types.pointer},
    },
    --void glfwSetWindowOpacity (GLFWwindow *window, float opacity)
    glfwSetWindowOpacity = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.float},
    },
    --void glfwRestoreWindow (GLFWwindow *window)
    glfwRestoreWindow = {
        returns = ffi.types.void,
        args = {ffi.types.pointer},
    },
    --void glfwMaximizeWindow (GLFWwindow *window)
    glfwMaximizeWindow = {
        returns = ffi.types.void,
        args = {ffi.types.pointer},
    },
    --void glfwShowWindow (GLFWwindow *window)
    glfwShowWindow = {
        returns = ffi.types.void,
        args = {ffi.types.pointer},
    },
    --void glfwHideWindow (GLFWwindow *window)
    glfwHideWindow = {
        returns = ffi.types.void,
        args = {ffi.types.pointer},
    },
    --void glfwFocusWindow (GLFWwindow *window)
    glfwFocusWindow = {
        returns = ffi.types.void,
        args = {ffi.types.pointer},
    },
    --void glfwRequestWindowAttention (GLFWwindow *window)
    glfwRequestWindowAttention = {
        returns = ffi.types.void,
        args = {ffi.types.pointer},
    },
    --GLFWmonitor *glfwGetWindowMonitor (GLFWwindow *window)
    glfwGetWindowMonitor = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer},
    },
    --void glfwSetWindowMonitor (GLFWwindow *window, GLFWmonitor *monitor, int xpos, int ypos, int width, int height, int refreshRate)
    glfwSetWindowMonitor = {
        returns = ffi.types.void,
        args = {ffi.types.pointer, ffi.types.pointer, ffi.types.i32, ffi.types.i32, ffi.types.i32, ffi.types.i32, ffi.types.i32},
    },
    --GLFWwindowposfun glfwSetWindowPosCallback (GLFWwindow *window, GLFWwindowposfun callback)
    glfwSetWindowPosCallback = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --GLFWwindowsizefun glfwSetWindowSizeCallback (GLFWwindow *window, GLFWwindowsizefun callback)
    glfwSetWindowSizeCallback = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --GLFWwindowclosefun glfwSetWindowCloseCallback (GLFWwindow *window, GLFWwindowclosefun callback)
    glfwSetWindowCloseCallback = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --GLFWwindowrefreshfun glfwSetWindowRefreshCallback (GLFWwindow *window, GLFWwindowrefreshfun callback)
    glfwSetWindowRefreshCallback = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --GLFWwindowfocusfun glfwSetWindowFocusCallback (GLFWwindow *window, GLFWwindowfocusfun callback)
    glfwSetWindowFocusCallback = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --GLFWwindowiconifyfun glfwSetWindowIconifyCallback (GLFWwindow *window, GLFWwindowiconifyfun callback)
    glfwSetWindowIconifyCallback = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --GLFWwindowmaximizefun glfwSetWindowMaximizeCallback (GLFWwindow *window, GLFWwindowmaximizefun callback)
    glfwSetWindowMaximizeCallback = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --GLFWframebuffersizefun glfwSetFramebufferSizeCallback (GLFWwindow *window, GLFWframebuffersizefun callback)
    glfwSetFramebufferSizeCallback = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --GLFWwindowcontentscalefun glfwSetWindowContentScaleCallback (GLFWwindow *window, GLFWwindowcontentscalefun callback)
    glfwSetWindowContentScaleCallback = {
        returns = ffi.types.pointer,
        args = {ffi.types.pointer, ffi.types.pointer},
    },
    --void glfwPollEvents (void)
    glfwPollEvents = {
        returns = ffi.types.void,
        args = {},
    },
    --void glfwWaitEvents (void)
    glfwWaitEvents = {
        returns = ffi.types.void,
        args = {},
    },
    --void glfwWaitEventsTimeout (double timeout)
    glfwWaitEventsTimeout = {
        returns = ffi.types.void,
        args = {ffi.types.double},
    },
    --void glfwSwapBuffers (GLFWwindow *window)
    glfwSwapBuffers = {
        returns = ffi.types.void,
        args = {ffi.types.pointer},
    },
    
    --void glfwMakeContextCurrent (GLFWwindow *window)
    glfwMakeContextCurrent = {
        returns = ffi.types.void,
        args = {ffi.types.pointer},
    },
});

local Platforms = {
    [0x00060001] = "WIN32",
    [0x00060002] = "COCOA",
    [0x00060003] = "WAYLAND",
    [0x00060004] = "X11",
    [0x00060005] = "NULL",
}

local ErrorCodes = {
    --[[
        No error has occurred.
    ]]
    [0] = "NoError";
    --[[
        This occurs if a GLFW function was called that must not be called unless the library is initialized.

        Analysis
            Application programmer error. Initialize GLFW before calling any function that requires initialization.
    ]]
    [0x00010001] = "NotInitialized";
    --[[
        This occurs if a GLFW function was called that needs and operates on the current OpenGL or OpenGL ES context but no context is current on the calling thread. One such function is glfwSwapInterval.

        Analysis
            Application programmer error. Ensure a context is current before calling functions that require a current context.
    ]]
    [0x00010002] = "NoCurrentContext";
    --[[
        One of the arguments to the function was an invalid enum value, for example requesting GLFW_RED_BITS with glfwGetWindowAttrib.

        Analysis
            Application programmer error. Fix the offending call.
    ]]
    [0x00010003] = "InvalidEnum";
    --[[
        One of the arguments to the function was an invalid value, for example requesting a non-existent OpenGL or OpenGL ES version like 2.7.

        Requesting a valid but unavailable OpenGL or OpenGL ES version will instead result in a GLFW_VERSION_UNAVAILABLE error.

        Analysis
            Application programmer error. Fix the offending call.
    ]]
    [0x00010004] = "InvalidValue";
    --[[
        A memory allocation failed.

        Analysis
            A bug in GLFW or the underlying operating system. Report the bug to our issue tracker.
    ]]
    [0x00010005] = "OutOfMemory";
    --[[
        GLFW could not find support for the requested API on the system.

        Analysis
            The installed graphics driver does not support the requested API, or does not support it via the chosen context creation API. Below are a few examples.
            Some pre-installed Windows graphics drivers do not support OpenGL. AMD only supports OpenGL ES via EGL, while Nvidia and Intel only support it via a WGL or GLX extension. macOS does not provide OpenGL ES at all. The Mesa EGL, OpenGL and OpenGL ES libraries do not interface with the Nvidia binary driver. Older graphics drivers do not support Vulkan.
    ]]
    [0x00010006] = "APIUnavailable";
    --[[
        The requested OpenGL or OpenGL ES version (including any requested context or framebuffer hints) is not available on this machine.

        Analysis
            The machine does not support your requirements. If your application is sufficiently flexible, downgrade your requirements and try again. Otherwise, inform the user that their machine does not match your requirements.
            Future invalid OpenGL and OpenGL ES versions, for example OpenGL 4.8 if 5.0 comes out before the 4.x series gets that far, also fail with this error and not GLFW_INVALID_VALUE, because GLFW cannot know what future versions will exist.
    ]]
    [0x00010007] = "VersionUnavailable";
    --[[
        A platform-specific error occurred that does not match any of the more specific categories.

        Analysis
            A bug or configuration error in GLFW, the underlying operating system or its drivers, or a lack of required resources. Report the issue to our issue tracker. 
    ]]
    [0x00010008] = "PlatformError";
    --[[
        If emitted during window creation, the requested pixel format is not supported.
        If emitted when querying the clipboard, the contents of the clipboard could not be converted to the requested format.

        Analysis
            If emitted during window creation, one or more hard constraints did not match any of the available pixel formats. If your application is sufficiently flexible, downgrade your requirements and try again. Otherwise, inform the user that their machine does not match your requirements.
            If emitted when querying the clipboard, ignore the error or report it to the user, as appropriate.
    ]]
    [0x00010009] = "FormatUnavailable";
    --[[
        A window that does not have an OpenGL or OpenGL ES context was passed to a function that requires it to have one.

        Analysis
            Application programmer error. Fix the offending call.
    ]]
    [0x0001000A] = "NoWindowContext";
    --[[
        The specified standard cursor shape is not available, either because the current platform cursor theme does not provide it or because it is not available on the platform.

        Analysis
            Platform or system settings limitation. Pick another standard cursor shape or create a custom cursor.
    ]]
    [0x0001000B] = "CursorUnavailable";
    --[[
        The requested feature is not provided by the platform, so GLFW is unable to implement it. The documentation for each function notes if it could emit this error.

        Analysis
            Platform or platform version limitation. The error can be ignored unless the feature is critical to the application.
            A function call that emits this error has no effect other than the error and updating any existing out parameters.
    ]]
    [0x0001000C] = "FeatureUnavailable";
    --[[
        The requested feature has not yet been implemented in GLFW for this platform.

        Analysis
            An incomplete implementation of GLFW for this platform, hopefully fixed in a future release. The error can be ignored unless the feature is critical to the application.
            A function call that emits this error has no effect other than the error and updating any existing out parameters.
    ]]
    [0x0001000D] = "FeatureUnimplemented";
     --[[
        If emitted during initialization, no matching platform was found. If the GLFW_PLATFORM init hint was set to GLFW_ANY_PLATFORM, GLFW could not detect any of the platforms supported by this library binary, except for the Null platform. If the init hint was set to a specific platform, it is either not supported by this library binary or GLFW was not able to detect it.
        If emitted by a native access function, GLFW was initialized for a different platform than the function is for.

        Analysis
            Failure to detect any platform usually only happens on non-macOS Unix systems, either when no window system is running or the program was run from a terminal that does not have the necessary environment variables. Fall back to a different platform if possible or notify the user that no usable platform was detected.

        Failure to detect a specific platform may have the same cause as above or be because support for that platform was not compiled in. Call glfwPlatformSupported to check whether a specific platform is supported by a library binary.
    ]]
    [0x0001000E] = "PlatformUnavailable";
}

type pointer = buffer;

type glfw_c = {
    GLFW_TRUE : number,
    GLFW_FALSE : number,
    GLFWwindowsizefun : ffi.FunctionDefinition,
    GLFWwindowposfun : ffi.FunctionDefinition,
    GLFWwindowclosefun : ffi.FunctionDefinition,
    GLFWwindowrefreshfun : ffi.FunctionDefinition,
    GLFWwindowfocusfun : ffi.FunctionDefinition,
    GLFWwindowiconifyfun : ffi.FunctionDefinition,
    GLFWwindowmaximizefun : ffi.FunctionDefinition,
    GLFWframebuffersizefun : ffi.FunctionDefinition,
    GLFWwindowcontentscalefun : ffi.FunctionDefinition,
    glfwInit : () -> number,
    glfwTerminate : () -> (),
    glfwInitHint : (hint: number, value: number) -> (),
    glfwGetVersionString : () -> buffer,
    glfwGetError : (descPtr: pointer) -> number,
    glfwGetPlatform : () -> number,
    glfwPlatformSupported : (platform: number) -> number,
    glfwCreateWindow : (width: number, height: number, title: string, monitor: pointer?, share: pointer?) -> pointer,
    glfwDestroyWindow : (window: pointer) -> (),
    glfwWindowShouldClose : (window: pointer) -> number,
    glfwGetWindowTitle : (window: pointer) -> buffer,
    glfwSetWindowTitle : (window: pointer, title: string) -> (),
    glfwGetWindowPos : (window: pointer, xpos: pointer, ypos: pointer) -> (),
    glfwSetWindowPos : (window: pointer, xpos: number, ypos: number) -> (),
    glfwGetWindowSize : (window: pointer, width: pointer, height: pointer) -> (),
    glfwSetWindowSizeLimits : (window: pointer, minwidth: number, minheight: number, maxwidth: number, maxheight: number) -> (),
    glfwSetWindowAspectRatio : (window: pointer, numer: number, denom: number) -> (),
    glfwSetWindowSize : (window: pointer, width: number, height: number) -> (),
    glfwGetFramebufferSize : (window: pointer, width: pointer, height: pointer) -> (),
    glfwGetWindowFrameSize : (window: pointer, left: pointer, top: pointer, right: pointer, bottom: pointer) -> (),
    glfwGetWindowOpacity : (window: pointer) -> number,
    glfwSetWindowOpacity : (window: pointer, opacity: number) -> (),
    glfwRestoreWindow : (window: pointer) -> (),
    glfwMaximizeWindow : (window: pointer) -> (),
    glfwShowWindow : (window: pointer) -> (),
    glfwHideWindow : (window: pointer) -> (),
    glfwFocusWindow : (window: pointer) -> (),
    glfwRequestWindowAttention : (window: pointer) -> (),
    glfwGetWindowMonitor : (window: pointer) -> pointer,
    glfwSetWindowMonitor : (window: pointer, monitor: pointer, xpos: number, ypos: number, width: number, height: number, refreshRate: number) -> (),
    glfwSetWindowPosCallback : (window: pointer, callback: pointer?) -> pointer,
    glfwSetWindowSizeCallback : (window: pointer, callback: pointer?) -> pointer,
    glfwSetWindowCloseCallback : (window: pointer, callback: pointer?) -> pointer,
    glfwSetWindowRefreshCallback : (window: pointer, callback: pointer?) -> pointer,
    glfwSetWindowFocusCallback : (window: pointer, callback: pointer?) -> pointer,
    glfwSetWindowIconifyCallback : (window: pointer, callback: pointer?) -> pointer,
    glfwSetWindowMaximizeCallback : (window: pointer, callback: pointer?) -> pointer,
    glfwSetFramebufferSizeCallback : (window: pointer, callback: pointer?) -> pointer,
    glfwSetWindowContentScaleCallback : (window: pointer, callback: pointer?) -> pointer,
    glfwMakeContextCurrent : (window: pointer) -> (),
    glfwPollEvents : () -> (),
    glfwWaitEvents : () -> (),
    glfwWaitEventsTimeout : (timeout: number) -> (),
    glfwSwapBuffers : (window: pointer) -> (),
}

local export = {
    glfw = {
        GLFW_TRUE = GLFW_TRUE,
        GLFW_FALSE = GLFW_FALSE,
        GLFWwindowsizefun = GLFWwindowsizefun,
        GLFWwindowposfun = GLFWwindowposfun,
        GLFWwindowclosefun = GLFWwindowclosefun,
        GLFWwindowrefreshfun = GLFWwindowrefreshfun,
        GLFWwindowfocusfun = GLFWwindowfocusfun,
        GLFWwindowiconifyfun = GLFWwindowiconifyfun,
        GLFWwindowmaximizefun = GLFWwindowmaximizefun,
        GLFWframebuffersizefun = GLFWframebuffersizefun,
        GLFWwindowcontentscalefun = GLFWwindowcontentscalefun,
        glfwInit = glfw.glfwInit,
        glfwTerminate = glfw.glfwTerminate,
        glfwInitHint = glfw.glfwInitHint,
        glfwGetVersionString = glfw.glfwGetVersionString,
        glfwGetError = glfw.glfwGetError,
        glfwGetPlatform = glfw.glfwGetPlatform,
        glfwPlatformSupported = glfw.glfwPlatformSupported,
        glfwCreateWindow = glfw.glfwCreateWindow,
        glfwDestroyWindow = glfw.glfwDestroyWindow,
        glfwWindowShouldClose = glfw.glfwWindowShouldClose,
        glfwGetWindowTitle = glfw.glfwGetWindowTitle,
        glfwSetWindowTitle = glfw.glfwSetWindowTitle,
        glfwGetWindowPos = glfw.glfwGetWindowPos,
        glfwSetWindowPos = glfw.glfwSetWindowPos,
        glfwGetWindowSize = glfw.glfwGetWindowSize,
        glfwSetWindowSizeLimits = glfw.glfwSetWindowSizeLimits,
        glfwSetWindowAspectRatio = glfw.glfwSetWindowAspectRatio,
        glfwSetWindowSize = glfw.glfwSetWindowSize,
        glfwGetFramebufferSize = glfw.glfwGetFramebufferSize,
        glfwGetWindowFrameSize = glfw.glfwGetWindowFrameSize,
        glfwGetWindowOpacity = glfw.glfwGetWindowOpacity,
        glfwSetWindowOpacity = glfw.glfwSetWindowOpacity,
        glfwRestoreWindow = glfw.glfwRestoreWindow,
        glfwMaximizeWindow = glfw.glfwMaximizeWindow,
        glfwShowWindow = glfw.glfwShowWindow,
        glfwHideWindow = glfw.glfwHideWindow,
        glfwFocusWindow = glfw.glfwFocusWindow,
        glfwRequestWindowAttention = glfw.glfwRequestWindowAttention,
        glfwGetWindowMonitor = glfw.glfwGetWindowMonitor,
        glfwSetWindowMonitor = glfw.glfwSetWindowMonitor,
        glfwSetWindowPosCallback = glfw.glfwSetWindowPosCallback,
        glfwSetWindowSizeCallback = glfw.glfwSetWindowSizeCallback,
        glfwSetWindowCloseCallback = glfw.glfwSetWindowCloseCallback,
        glfwSetWindowRefreshCallback = glfw.glfwSetWindowRefreshCallback,
        glfwSetWindowFocusCallback = glfw.glfwSetWindowFocusCallback,
        glfwSetWindowIconifyCallback = glfw.glfwSetWindowIconifyCallback,
        glfwSetWindowMaximizeCallback = glfw.glfwSetWindowMaximizeCallback,
        glfwSetFramebufferSizeCallback = glfw.glfwSetFramebufferSizeCallback,
        glfwSetWindowContentScaleCallback = glfw.glfwSetWindowContentScaleCallback,
        glfwMakeContextCurrent = glfw.glfwMakeContextCurrent,
        glfwPollEvents = glfw.glfwPollEvents,
        glfwWaitEvents = glfw.glfwWaitEvents,
        glfwWaitEventsTimeout = glfw.glfwWaitEventsTimeout,
        glfwSwapBuffers = glfw.glfwSwapBuffers,
    }::glfw_c,
    Platforms = Platforms,
    ErrorCodes = ErrorCodes,
}

return export;