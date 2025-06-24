--!strict
local fs = zune.fs;
local ffi = zune.ffi;
local process = zune.process;

local GLFW_TRUE = 1;
local GLFW_FALSE = 0;

local LIBRARY_PATH = `./libs/glfw/build/src/{ffi.prefix}glfw.{ffi.suffix}`;
if (process.os == "windows") then
    LIBRARY_PATH = `./libs/glfw/build/src/{
        if (fs.isDir(`./libs/glfw/build/src/Release`)) then "Release" else "Debug"
    }/{ffi.prefix}glfw3.{ffi.suffix}`;
end

local GLFWwindow = ffi.types.pointer:newTag("GLFWwindow");
local GLFWmonitor = ffi.types.pointer:newTag("GLFWmonitor");

--void(* GLFWwindowsizefun) (GLFWwindow *window, int width, int height)
local GLFWwindowsizefun = {
    returns = ffi.types.void,
    args = {GLFWwindow, ffi.types.i32, ffi.types.i32} :: {FFIDataType},
};
--void(* GLFWwindowposfun) (GLFWwindow *window, int xpos, int ypos)
local GLFWwindowposfun = {
    returns = ffi.types.void,
    args = {GLFWwindow, ffi.types.i32, ffi.types.i32} :: {FFIDataType},
};
--void(* GLFWwindowclosefun) (GLFWwindow *window)
local GLFWwindowclosefun = {
    returns = ffi.types.void,
    args = {GLFWwindow},
};
--void(* GLFWwindowrefreshfun) (GLFWwindow *window)
local GLFWwindowrefreshfun = {
    returns = ffi.types.void,
    args = {GLFWwindow},
};
--void(* GLFWwindowfocusfun) (GLFWwindow *window, int focused)
local GLFWwindowfocusfun = {
    returns = ffi.types.void,
    args = {GLFWwindow, ffi.types.i32} :: {FFIDataType},
};
--void(* GLFWwindowiconifyfun) (GLFWwindow *window, int iconified)
local GLFWwindowiconifyfun = {
    returns = ffi.types.void,
    args = {GLFWwindow, ffi.types.i32} :: {FFIDataType},
};
--void(* GLFWwindowmaximizefun) (GLFWwindow *window, int maximized)
local GLFWwindowmaximizefun = {
    returns = ffi.types.void,
    args = {GLFWwindow, ffi.types.i32} :: {FFIDataType},
};
--void(* GLFWframebuffersizefun) (GLFWwindow *window, int width, int height)
local GLFWframebuffersizefun = {
    returns = ffi.types.void,
    args = {GLFWwindow, ffi.types.i32, ffi.types.i32} :: {FFIDataType},
};
--void(* GLFWwindowcontentscalefun) (GLFWwindow *window, float xscale, float yscale)
local GLFWwindowcontentscalefun = {
    returns = ffi.types.void,
    args = {GLFWwindow, ffi.types.float, ffi.types.float} :: {FFIDataType},
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

    --void glfwDefaultWindowHints (void)
    glfwDefaultWindowHints = {
        returns = ffi.types.void,
        args = {},
    },
    --void glfwWindowHint (int hint, int value)
    glfwWindowHint = {
        returns = ffi.types.void,
        args = {ffi.types.i32, ffi.types.i32},
    },
    --void glfwWindowHintString (int hint, const char *value)
    glfwWindowHintString = {
        returns = ffi.types.void,
        args = {ffi.types.i32, ffi.types.pointer},
    },
    --GLFWwindow *glfwCreateWindow (int width, int height, const char *title, GLFWmonitor *monitor, GLFWwindow *share)
    glfwCreateWindow = {
        returns = GLFWwindow,
        args = {ffi.types.i32, ffi.types.i32, ffi.types.pointer, GLFWmonitor, GLFWwindow},
    },
    --void glfwDestroyWindow (GLFWwindow *window)
    glfwDestroyWindow = {
        returns = ffi.types.void,
        args = {GLFWwindow},
    },
    --int glfwWindowShouldClose (GLFWwindow *window)
    glfwWindowShouldClose = {
        returns = ffi.types.i32,
        args = {GLFWwindow},
    },
    --const char *glfwGetWindowTitle (GLFWwindow *window)
    glfwGetWindowTitle = {
        returns = ffi.types.pointer,
        args = {GLFWwindow},
    },
    --void glfwSetWindowTitle (GLFWwindow *window, const char *title)
    glfwSetWindowTitle = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.pointer},
    },
    --void glfwGetWindowPos (GLFWwindow *window, int *xpos, int *ypos)
    glfwGetWindowPos = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.pointer, ffi.types.pointer},
    },
    --void glfwSetWindowPos (GLFWwindow *window, int xpos, int ypos)
    glfwSetWindowPos = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.i32, ffi.types.i32},
    },
    --void glfwGetWindowSize (GLFWwindow *window, int *width, int *height)
    glfwGetWindowSize = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.pointer, ffi.types.pointer},
    },
    --void glfwSetWindowSizeLimits (GLFWwindow *window, int minwidth, int minheight, int maxwidth, int maxheight)
    glfwSetWindowSizeLimits = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.i32, ffi.types.i32, ffi.types.i32, ffi.types.i32},
    },
    --void glfwSetWindowAspectRatio (GLFWwindow *window, int numer, int denom)
    glfwSetWindowAspectRatio = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.i32, ffi.types.i32},
    },
    --void glfwSetWindowSize (GLFWwindow *window, int width, int height)
    glfwSetWindowSize = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.i32, ffi.types.i32},
    },
    --void glfwGetFramebufferSize (GLFWwindow *window, int *width, int *height)
    glfwGetFramebufferSize = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.pointer, ffi.types.pointer},
    },
    --void glfwGetWindowFrameSize (GLFWwindow *window, int *left, int *top, int *right, int *bottom)
    glfwGetWindowFrameSize = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.pointer, ffi.types.pointer, ffi.types.pointer, ffi.types.pointer},
    },
    --float glfwGetWindowOpacity (GLFWwindow *window)
    glfwGetWindowOpacity = {
        returns = ffi.types.float,
        args = {GLFWwindow},
    },
    --void glfwSetWindowOpacity (GLFWwindow *window, float opacity)
    glfwSetWindowOpacity = {
        returns = ffi.types.void,
        args = {GLFWwindow, ffi.types.float},
    },
    --void glfwRestoreWindow (GLFWwindow *window)
    glfwRestoreWindow = {
        returns = ffi.types.void,
        args = {GLFWwindow},
    },
    --void glfwMaximizeWindow (GLFWwindow *window)
    glfwMaximizeWindow = {
        returns = ffi.types.void,
        args = {GLFWwindow},
    },
    --void glfwShowWindow (GLFWwindow *window)
    glfwShowWindow = {
        returns = ffi.types.void,
        args = {GLFWwindow},
    },
    --void glfwHideWindow (GLFWwindow *window)
    glfwHideWindow = {
        returns = ffi.types.void,
        args = {GLFWwindow},
    },
    --void glfwFocusWindow (GLFWwindow *window)
    glfwFocusWindow = {
        returns = ffi.types.void,
        args = {GLFWwindow},
    },
    --void glfwRequestWindowAttention (GLFWwindow *window)
    glfwRequestWindowAttention = {
        returns = ffi.types.void,
        args = {GLFWwindow},
    },
    --GLFWmonitor *glfwGetWindowMonitor (GLFWwindow *window)
    glfwGetWindowMonitor = {
        returns = ffi.types.pointer,
        args = {GLFWwindow},
    },
    --void glfwSetWindowMonitor (GLFWwindow *window, GLFWmonitor *monitor, int xpos, int ypos, int width, int height, int refreshRate)
    glfwSetWindowMonitor = {
        returns = ffi.types.void,
        args = {GLFWwindow, GLFWmonitor, ffi.types.i32, ffi.types.i32, ffi.types.i32, ffi.types.i32, ffi.types.i32},
    },
    --GLFWwindowposfun glfwSetWindowPosCallback (GLFWwindow *window, GLFWwindowposfun callback)
    glfwSetWindowPosCallback = {
        returns = ffi.types.pointer,
        args = {GLFWwindow, ffi.types.pointer},
    },
    --GLFWwindowsizefun glfwSetWindowSizeCallback (GLFWwindow *window, GLFWwindowsizefun callback)
    glfwSetWindowSizeCallback = {
        returns = ffi.types.pointer,
        args = {GLFWwindow, ffi.types.pointer},
    },
    --GLFWwindowclosefun glfwSetWindowCloseCallback (GLFWwindow *window, GLFWwindowclosefun callback)
    glfwSetWindowCloseCallback = {
        returns = ffi.types.pointer,
        args = {GLFWwindow, ffi.types.pointer},
    },
    --GLFWwindowrefreshfun glfwSetWindowRefreshCallback (GLFWwindow *window, GLFWwindowrefreshfun callback)
    glfwSetWindowRefreshCallback = {
        returns = ffi.types.pointer,
        args = {GLFWwindow, ffi.types.pointer},
    },
    --GLFWwindowfocusfun glfwSetWindowFocusCallback (GLFWwindow *window, GLFWwindowfocusfun callback)
    glfwSetWindowFocusCallback = {
        returns = ffi.types.pointer,
        args = {GLFWwindow, ffi.types.pointer},
    },
    --GLFWwindowiconifyfun glfwSetWindowIconifyCallback (GLFWwindow *window, GLFWwindowiconifyfun callback)
    glfwSetWindowIconifyCallback = {
        returns = ffi.types.pointer,
        args = {GLFWwindow, ffi.types.pointer},
    },
    --GLFWwindowmaximizefun glfwSetWindowMaximizeCallback (GLFWwindow *window, GLFWwindowmaximizefun callback)
    glfwSetWindowMaximizeCallback = {
        returns = ffi.types.pointer,
        args = {GLFWwindow, ffi.types.pointer},
    },
    --GLFWframebuffersizefun glfwSetFramebufferSizeCallback (GLFWwindow *window, GLFWframebuffersizefun callback)
    glfwSetFramebufferSizeCallback = {
        returns = ffi.types.pointer,
        args = {GLFWwindow, ffi.types.pointer},
    },
    --GLFWwindowcontentscalefun glfwSetWindowContentScaleCallback (GLFWwindow *window, GLFWwindowcontentscalefun callback)
    glfwSetWindowContentScaleCallback = {
        returns = ffi.types.pointer,
        args = {GLFWwindow, ffi.types.pointer},
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
        args = {GLFWwindow},
    },
    
    --void glfwMakeContextCurrent (GLFWwindow *window)
    glfwMakeContextCurrent = {
        returns = ffi.types.void,
        args = {GLFWwindow},
    },
    --GLFWwindow * glfwGetCurrentContext (void)
    glfwGetCurrentContext = {
        returns = GLFWwindow,
        args = {},
    },
    --void glfwSwapInterval (int interval)
    glfwSwapInterval = {
        returns = ffi.types.void,
        args = {ffi.types.i32},
    },
    --int glfwExtensionSupported (const char *extension)
    glfwExtensionSupported = {
        returns = ffi.types.i32,
        args = {ffi.types.pointer},
    },
    --GLFWglproc glfwGetProcAddress (const char *procname)
    glfwGetProcAddress = {
        returns = ffi.types.pointer,
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

local Macros = {
    --[[
        Input focus window hint and attribute.
    ]]
    GLFW_FOCUSED = 0x00020001;
    --[[
        Window iconification window attribute.
    ]]
    GLFW_ICONIFIED = 0x00020002;
    --[[
        Window resize-ability window hint and attribute.
    ]]
    GLFW_RESIZABLE = 0x00020003;
    --[[
        Window visibility window hint and attribute.
    ]]
    GLFW_VISIBLE = 0x00020004;
    --[[
        Window decoration window hint and attribute.
    ]]
    GLFW_DECORATED = 0x00020005;
    --[[
        Window auto-iconification window hint and attribute.
    ]]
    GLFW_AUTO_ICONIFY = 0x00020006;
    --[[
        Window decoration window hint and attribute.
    ]]
    GLFW_FLOATING = 0x00020007;
    --[[
        Window maximization window hint and attribute.
    ]]
    GLFW_MAXIMIZED = 0x00020008;
    --[[
        Cursor centering window hint.
    ]]
    GLFW_CENTER_CURSOR = 0x00020009;
    --[[
        Window framebuffer transparency hint and attribute.
    ]]
    GLFW_TRANSPARENT_FRAMEBUFFER = 0x0002000A;
    --[[
        Mouse cursor hover window attribute.
    ]]
    GLFW_HOVERED = 0x0002000B;
    --[[
        Input focus on calling show window hint and attribute.
    ]]
    GLFW_FOCUS_ON_SHOW = 0x0002000C;
    --[[
        Mouse input transparency window hint and attribute.
    ]]
    GLFW_MOUSE_PASSTHROUGH = 0x0002000D;
    --[[
        Initial position x-coordinate window hint.
    ]]
    GLFW_POSITION_X = 0x0002000E;
    --[[
        Initial position y-coordinate window hint.
    ]]
    GLFW_POSITION_Y = 0x0002000F;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_RED_BITS = 0x00021001;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_GREEN_BITS = 0x00021002;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_BLUE_BITS = 0x00021003;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_ALPHA_BITS = 0x00021004;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_DEPTH_BITS = 0x00021005;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_STENCIL_BITS = 0x00021006;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_ACCUM_RED_BITS = 0x00021007;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_ACCUM_GREEN_BITS = 0x00021008;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_ACCUM_BLUE_BITS = 0x00021009;
    --[[
        Framebuffer bit depth hint.
    ]]
    GLFW_ACCUM_ALPHA_BITS = 0x0002100A;
    --[[
        Framebuffer auxiliary buffer hint.
    ]]
    GLFW_AUX_BUFFERS = 0x0002100B;
    --[[
        OpenGL stereoscopic rendering hint.
    ]]
    GLFW_STEREO = 0x0002100C;
    --[[
        Framebuffer MSAA samples hint.
    ]]
    GLFW_SAMPLES = 0x0002100D;
    --[[
        Framebuffer sRGB hint.
    ]]
    GLFW_SRGB_CAPABLE = 0x0002100E;
    --[[
        Monitor refresh rate hint.
    ]]
    GLFW_REFRESH_RATE = 0x0002100F;
    --[[
        Framebuffer double buffering hint and attribute.
    ]]
    GLFW_DOUBLEBUFFER = 0x00021010;
    --[[
        Context client API hint and attribute.
    ]]
    GLFW_CLIENT_API = 0x00022001;
    --[[
        Context client API major version hint and attribute.
    ]]
    GLFW_CONTEXT_VERSION_MAJOR = 0x00022002;
    --[[
        Context client API minor version hint and attribute.
    ]]
    GLFW_CONTEXT_VERSION_MINOR = 0x00022003;
    --[[
        Context client API revision number attribute.
    ]]
    GLFW_CONTEXT_REVISION = 0x00022004;
    --[[
        Context robustness hint and attribute.
    ]]
    GLFW_CONTEXT_ROBUSTNESS = 0x00022005;
    --[[
        OpenGL forward-compatibility hint and attribute.
    ]]
    GLFW_OPENGL_FORWARD_COMPAT = 0x00022006;
    --[[
        Debug mode context hint and attribute.
    ]]
    GLFW_CONTEXT_DEBUG = 0x00022007;
    --[[
        Legacy name for compatibility.
    ]]
    GLFW_OPENGL_DEBUG_CONTEXT = 0x00022007; -- GLFW_CONTEXT_DEBUG
    --[[
        OpenGL profile hint and attribute.
    ]]
    GLFW_OPENGL_PROFILE = 0x00022008;
    --[[
        Context flush-on-release hint and attribute.
    ]]
    GLFW_CONTEXT_RELEASE_BEHAVIOR = 0x00022009;
    --[[
        Context error suppression hint and attribute.
    ]]
    GLFW_CONTEXT_NO_ERROR = 0x0002200A;
    --[[
        Context creation API hint and attribute.
    ]]
    GLFW_CONTEXT_CREATION_API = 0x0002200B;
    --[[
        Window content area scaling window <a class="el" href="window_guide.html#GLFW_SCALE_TO_MONITOR">window hint</a>.
    ]]
    GLFW_SCALE_TO_MONITOR = 0x0002200C;
    --[[
        Window framebuffer scaling <a class="el" href="window_guide.html#GLFW_SCALE_FRAMEBUFFER_hint">window hint</a>.
    ]]
    GLFW_SCALE_FRAMEBUFFER = 0x0002200D;
    --[[
        Legacy name for compatibility.
    ]]
    GLFW_COCOA_RETINA_FRAMEBUFFER = 0x00023001;
    --[[
        macOS specific <a class="el" href="window_guide.html#GLFW_COCOA_FRAME_NAME_hint">window hint</a>.
    ]]
    GLFW_COCOA_FRAME_NAME = 0x00023002;
    --[[
        macOS specific <a class="el" href="window_guide.html#GLFW_COCOA_GRAPHICS_SWITCHING_hint">window hint</a>.
    ]]
    GLFW_COCOA_GRAPHICS_SWITCHING = 0x00023003;
    --[[
        X11 specific <a class="el" href="window_guide.html#GLFW_X11_CLASS_NAME_hint">window hint</a>.
    ]]
    GLFW_X11_CLASS_NAME = 0x00024001;
    --[[
        X11 specific <a class="el" href="window_guide.html#GLFW_X11_CLASS_NAME_hint">window hint</a>.
    ]]
    GLFW_X11_INSTANCE_NAME = 0x00024002;
    GLFW_WIN32_KEYBOARD_MENU = 0x00025001;
}

type pointer = FFIPointer;

type glfw_c = {
    GLFW_TRUE : number,
    GLFW_FALSE : number,
    GLFWwindowsizefun : FFIFunctionDef,
    GLFWwindowposfun : FFIFunctionDef,
    GLFWwindowclosefun : FFIFunctionDef,
    GLFWwindowrefreshfun : FFIFunctionDef,
    GLFWwindowfocusfun : FFIFunctionDef,
    GLFWwindowiconifyfun : FFIFunctionDef,
    GLFWwindowmaximizefun : FFIFunctionDef,
    GLFWframebuffersizefun : FFIFunctionDef,
    GLFWwindowcontentscalefun : FFIFunctionDef,

    glfwInit : () -> number,
    glfwTerminate : () -> (),
    glfwInitHint : (hint: number, value: number) -> (),
    glfwGetVersionString : () -> pointer,
    glfwGetError : (descPtr: pointer) -> number,
    glfwGetPlatform : () -> number,
    glfwPlatformSupported : (platform: number) -> number,

    glfwDefaultWindowHints : () -> (),
    glfwWindowHint : (hint: number, value: number) -> (),
    glfwWindowHintString : (hint: number, value: string) -> (),
    glfwCreateWindow : (width: number, height: number, title: string, monitor: pointer?, share: pointer?) -> pointer,
    glfwDestroyWindow : (window: pointer) -> (),
    glfwWindowShouldClose : (window: pointer) -> number,
    glfwGetWindowTitle : (window: pointer) -> pointer,
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
    glfwPollEvents : () -> (),
    glfwWaitEvents : () -> (),
    glfwWaitEventsTimeout : (timeout: number) -> (),
    glfwSwapBuffers : (window: pointer) -> (),
    
    glfwMakeContextCurrent : (window: pointer) -> (),
    glfwGetCurrentContext : () -> pointer,
    glfwSwapInterval : (interval: number) -> (),
    glfwExtensionSupported : (extension: string) -> number,
    glfwGetProcAddress : (procname: string) -> pointer,
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

        glfwDefaultWindowHints = glfw.glfwDefaultWindowHints,
        glfwWindowHint = glfw.glfwWindowHint,
        glfwWindowHintString = glfw.glfwWindowHintString,
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
        glfwPollEvents = glfw.glfwPollEvents,
        glfwWaitEvents = glfw.glfwWaitEvents,
        glfwWaitEventsTimeout = glfw.glfwWaitEventsTimeout,
        glfwSwapBuffers = glfw.glfwSwapBuffers,

        glfwMakeContextCurrent = glfw.glfwMakeContextCurrent,
        glfwGetCurrentContext = glfw.glfwGetCurrentContext,
        glfwSwapInterval = glfw.glfwSwapInterval,
        glfwExtensionSupported = glfw.glfwExtensionSupported,
        glfwGetProcAddress = glfw.glfwGetProcAddress,
    }::glfw_c,
    Platforms = Platforms,
    ErrorCodes = ErrorCodes,
    defined = Macros,
}

return export;