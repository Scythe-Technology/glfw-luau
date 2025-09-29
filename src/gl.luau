--!strict

local constants = {
    DEPTH_BUFFER_BIT = 0x00000100,
    STENCIL_BUFFER_BIT = 0x00000400,
    COLOR_BUFFER_BIT = 0x00004000,
    FALSE = 0,
    TRUE = 1,
    POINTS = 0x0000,
    LINES = 0x0001,
    LINE_LOOP = 0x0002,
    LINE_STRIP = 0x0003,
    TRIANGLES = 0x0004,
    TRIANGLE_STRIP = 0x0005,
    TRIANGLE_FAN = 0x0006,
    NEVER = 0x0200,
    LESS = 0x0201,
    EQUAL = 0x0202,
    LEQUAL = 0x0203,
    GREATER = 0x0204,
    NOTEQUAL = 0x0205,
    GEQUAL = 0x0206,
    ALWAYS = 0x0207,
    ZERO = 0,
    ONE = 1,
    SRC_COLOR = 0x0300,
    ONE_MINUS_SRC_COLOR = 0x0301,
    SRC_ALPHA = 0x0302,
    ONE_MINUS_SRC_ALPHA = 0x0303,
    DST_ALPHA = 0x0304,
    ONE_MINUS_DST_ALPHA = 0x0305,
    DST_COLOR = 0x0306,
    ONE_MINUS_DST_COLOR = 0x0307,
    SRC_ALPHA_SATURATE = 0x0308,
    NONE = 0,
    FRONT_LEFT = 0x0400,
    FRONT_RIGHT = 0x0401,
    BACK_LEFT = 0x0402,
    BACK_RIGHT = 0x0403,
    FRONT = 0x0404,
    BACK = 0x0405,
    LEFT = 0x0406,
    RIGHT = 0x0407,
    FRONT_AND_BACK = 0x0408,
    NO_ERROR = 0,
    INVALID_ENUM = 0x0500,
    INVALID_VALUE = 0x0501,
    INVALID_OPERATION = 0x0502,
    OUT_OF_MEMORY = 0x0505,
    CW = 0x0900,
    CCW = 0x0901,
    POINT_SIZE = 0x0B11,
    POINT_SIZE_RANGE = 0x0B12,
    POINT_SIZE_GRANULARITY = 0x0B13,
    LINE_SMOOTH = 0x0B20,
    LINE_WIDTH = 0x0B21,
    LINE_WIDTH_RANGE = 0x0B22,
    LINE_WIDTH_GRANULARITY = 0x0B23,
    POLYGON_MODE = 0x0B40,
    POLYGON_SMOOTH = 0x0B41,
    CULL_FACE = 0x0B44,
    CULL_FACE_MODE = 0x0B45,
    FRONT_FACE = 0x0B46,
    DEPTH_RANGE = 0x0B70,
    DEPTH_TEST = 0x0B71,
    DEPTH_WRITEMASK = 0x0B72,
    DEPTH_CLEAR_VALUE = 0x0B73,
    DEPTH_FUNC = 0x0B74,
    STENCIL_TEST = 0x0B90,
    STENCIL_CLEAR_VALUE = 0x0B91,
    STENCIL_FUNC = 0x0B92,
    STENCIL_VALUE_MASK = 0x0B93,
    STENCIL_FAIL = 0x0B94,
    STENCIL_PASS_DEPTH_FAIL = 0x0B95,
    STENCIL_PASS_DEPTH_PASS = 0x0B96,
    STENCIL_REF = 0x0B97,
    STENCIL_WRITEMASK = 0x0B98,
    VIEWPORT = 0x0BA2,
    DITHER = 0x0BD0,
    BLEND_DST = 0x0BE0,
    BLEND_SRC = 0x0BE1,
    BLEND = 0x0BE2,
    LOGIC_OP_MODE = 0x0BF0,
    COLOR_LOGIC_OP = 0x0BF2,
    DRAW_BUFFER = 0x0C01,
    READ_BUFFER = 0x0C02,
    SCISSOR_BOX = 0x0C10,
    SCISSOR_TEST = 0x0C11,
    COLOR_CLEAR_VALUE = 0x0C22,
    COLOR_WRITEMASK = 0x0C23,
    DOUBLEBUFFER = 0x0C32,
    STEREO = 0x0C33,
    LINE_SMOOTH_HINT = 0x0C52,
    POLYGON_SMOOTH_HINT = 0x0C53,
    UNPACK_SWAP_BYTES = 0x0CF0,
    UNPACK_LSB_FIRST = 0x0CF1,
    UNPACK_ROW_LENGTH = 0x0CF2,
    UNPACK_SKIP_ROWS = 0x0CF3,
    UNPACK_SKIP_PIXELS = 0x0CF4,
    UNPACK_ALIGNMENT = 0x0CF5,
    PACK_SWAP_BYTES = 0x0D00,
    PACK_LSB_FIRST = 0x0D01,
    PACK_ROW_LENGTH = 0x0D02,
    PACK_SKIP_ROWS = 0x0D03,
    PACK_SKIP_PIXELS = 0x0D04,
    PACK_ALIGNMENT = 0x0D05,
    MAX_TEXTURE_SIZE = 0x0D33,
    MAX_VIEWPORT_DIMS = 0x0D3A,
    SUBPIXEL_BITS = 0x0D50,
    TEXTURE_1D = 0x0DE0,
    TEXTURE_2D = 0x0DE1,
	POLYGON_OFFSET_UNITS = 0x2A00,
    POLYGON_OFFSET_POINT = 0x2A01,
    POLYGON_OFFSET_LINE = 0x2A02,
    POLYGON_OFFSET_FILL = 0x8037,
    POLYGON_OFFSET_FACTOR = 0x8038,
    TEXTURE_BINDING_1D = 0x8068,
    TEXTURE_BINDING_2D = 0x8069,
    TEXTURE_WIDTH = 0x1000,
    TEXTURE_HEIGHT = 0x1001,
    TEXTURE_INTERNAL_FORMAT = 0x1003,
    TEXTURE_BORDER_COLOR = 0x1004,
    TEXTURE_RED_SIZE = 0x805C,
    TEXTURE_GREEN_SIZE = 0x805D,
    TEXTURE_BLUE_SIZE = 0x805E,
    TEXTURE_ALPHA_SIZE = 0x805F,
    DONT_CARE = 0x1100,
    FASTEST = 0x1101,
    NICEST = 0x1102,
    BYTE = 0x1400,
    UNSIGNED_BYTE = 0x1401,
    SHORT = 0x1402,
    UNSIGNED_SHORT = 0x1403,
    INT = 0x1404,
    UNSIGNED_INT = 0x1405,
    FLOAT = 0x1406,
    DOUBLE = 0x140A,
    CLEAR = 0x1500,
    AND = 0x1501,
    AND_REVERSE = 0x1502,
    COPY = 0x1503,
    AND_INVERTED = 0x1504,
    NOOP = 0x1505,
    XOR = 0x1506,
    OR = 0x1507,
    NOR = 0x1508,
    EQUIV = 0x1509,
    INVERT = 0x150A,
    OR_REVERSE = 0x150B,
    COPY_INVERTED = 0x150C,
    OR_INVERTED = 0x150D,
    NAND = 0x150E,
    SET = 0x150F,
    TEXTURE = 0x1702,
    COLOR = 0x1800,
    DEPTH = 0x1801,
    STENCIL = 0x1802,
    STENCIL_INDEX = 0x1901,
    DEPTH_COMPONENT = 0x1902,
    RED = 0x1903,
    GREEN = 0x1904,
    BLUE = 0x1905,
    ALPHA = 0x1906,
    RGB = 0x1907,
    RGBA = 0x1908,
    POINT = 0x1B00,
    LINE = 0x1B01,
    FILL = 0x1B02,
    KEEP = 0x1E00,
    REPLACE = 0x1E01,
    INCR = 0x1E02,
    DECR = 0x1E03,
    VENDOR = 0x1F00,
    RENDERER = 0x1F01,
    VERSION = 0x1F02,
    EXTENSIONS = 0x1F03,
    NEAREST = 0x2600,
    LINEAR = 0x2601,
    NEAREST_MIPMAP_NEAREST = 0x2700,
    LINEAR_MIPMAP_NEAREST = 0x2701,
    NEAREST_MIPMAP_LINEAR = 0x2702,
    LINEAR_MIPMAP_LINEAR = 0x2703,
    TEXTURE_MAG_FILTER = 0x2800,
    TEXTURE_MIN_FILTER = 0x2801,
    TEXTURE_WRAP_S = 0x2802,
    TEXTURE_WRAP_T = 0x2803,
    PROXY_TEXTURE_1D = 0x8063,
    PROXY_TEXTURE_2D = 0x8064,
    REPEAT = 0x2901,
    R3_G3_B2 = 0x2A10,
    RGB4 = 0x804F,
    RGB5 = 0x8050,
    RGB8 = 0x8051,
    RGB10 = 0x8052,
    RGB12 = 0x8053,
    RGB16 = 0x8054,
    RGBA2 = 0x8055,
    RGBA4 = 0x8056,
    RGB5_A1 = 0x8057,
    RGBA8 = 0x8058,
    RGB10_A2 = 0x8059,
    RGBA12 = 0x805A,
    RGBA16 = 0x805B,
    UNSIGNED_BYTE_3_3_2 = 0x8032,
    UNSIGNED_SHORT_4_4_4_4 = 0x8033,
    UNSIGNED_SHORT_5_5_5_1 = 0x8034,
    UNSIGNED_INT_8_8_8_8 = 0x8035,
    UNSIGNED_INT_10_10_10_2 = 0x8036,
    TEXTURE_BINDING_3D = 0x806A,
    PACK_SKIP_IMAGES = 0x806B,
    PACK_IMAGE_HEIGHT = 0x806C,
    UNPACK_SKIP_IMAGES = 0x806D,
    UNPACK_IMAGE_HEIGHT = 0x806E,
    TEXTURE_3D = 0x806F,
    PROXY_TEXTURE_3D = 0x8070,
    TEXTURE_DEPTH = 0x8071,
    TEXTURE_WRAP_R = 0x8072,
    MAX_3D_TEXTURE_SIZE = 0x8073,
    UNSIGNED_BYTE_2_3_3_REV = 0x8362,
    UNSIGNED_SHORT_5_6_5 = 0x8363,
    UNSIGNED_SHORT_5_6_5_REV = 0x8364,
    UNSIGNED_SHORT_4_4_4_4_REV = 0x8365,
    UNSIGNED_SHORT_1_5_5_5_REV = 0x8366,
    UNSIGNED_INT_8_8_8_8_REV = 0x8367,
    UNSIGNED_INT_2_10_10_10_REV = 0x8368,
    BGR = 0x80E0,
    BGRA = 0x80E1,
    MAX_ELEMENTS_VERTICES = 0x80E8,
    MAX_ELEMENTS_INDICES = 0x80E9,
    CLAMP_TO_EDGE = 0x812F,
    TEXTURE_MIN_LOD = 0x813A,
    TEXTURE_MAX_LOD = 0x813B,
    TEXTURE_BASE_LEVEL = 0x813C,
    TEXTURE_MAX_LEVEL = 0x813D,
    SMOOTH_POINT_SIZE_RANGE = 0x0B12,
    SMOOTH_POINT_SIZE_GRANULARITY = 0x0B13,
    SMOOTH_LINE_WIDTH_RANGE = 0x0B22,
    SMOOTH_LINE_WIDTH_GRANULARITY = 0x0B23,
    ALIASED_LINE_WIDTH_RANGE = 0x846E,
    TEXTURE0 = 0x84C0,
    TEXTURE1 = 0x84C1,
    TEXTURE2 = 0x84C2,
    TEXTURE3 = 0x84C3,
    TEXTURE4 = 0x84C4,
    TEXTURE5 = 0x84C5,
    TEXTURE6 = 0x84C6,
    TEXTURE7 = 0x84C7,
    TEXTURE8 = 0x84C8,
    TEXTURE9 = 0x84C9,
    TEXTURE10 = 0x84CA,
    TEXTURE11 = 0x84CB,
    TEXTURE12 = 0x84CC,
    TEXTURE13 = 0x84CD,
    TEXTURE14 = 0x84CE,
    TEXTURE15 = 0x84CF,
    TEXTURE16 = 0x84D0,
    TEXTURE17 = 0x84D1,
    TEXTURE18 = 0x84D2,
    TEXTURE19 = 0x84D3,
    TEXTURE20 = 0x84D4,
    TEXTURE21 = 0x84D5,
    TEXTURE22 = 0x84D6,
    TEXTURE23 = 0x84D7,
    TEXTURE24 = 0x84D8,
    TEXTURE25 = 0x84D9,
    TEXTURE26 = 0x84DA,
    TEXTURE27 = 0x84DB,
    TEXTURE28 = 0x84DC,
    TEXTURE29 = 0x84DD,
    TEXTURE30 = 0x84DE,
    TEXTURE31 = 0x84DF,
    ACTIVE_TEXTURE = 0x84E0,
	MULTISAMPLE = 0x809D,
    SAMPLE_ALPHA_TO_COVERAGE = 0x809E,
    SAMPLE_ALPHA_TO_ONE = 0x809F,
    SAMPLE_COVERAGE = 0x80A0,
    SAMPLE_BUFFERS = 0x80A8,
    SAMPLES = 0x80A9,
    SAMPLE_COVERAGE_VALUE = 0x80AA,
    SAMPLE_COVERAGE_INVERT = 0x80AB,
    TEXTURE_CUBE_MAP = 0x8513,
    TEXTURE_BINDING_CUBE_MAP = 0x8514,
    TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515,
    TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516,
    TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517,
    TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518,
    TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519,
    TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A,
    PROXY_TEXTURE_CUBE_MAP = 0x851B,
    MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C,
    COMPRESSED_RGB = 0x84ED,
    COMPRESSED_RGBA = 0x84EE,
    TEXTURE_COMPRESSION_HINT = 0x84EF,
    TEXTURE_COMPRESSED_IMAGE_SIZE = 0x86A0,
    TEXTURE_COMPRESSED = 0x86A1,
    NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2,
    COMPRESSED_TEXTURE_FORMATS = 0x86A3,
    CLAMP_TO_BORDER = 0x812D,
    BLEND_DST_RGB = 0x80C8,
    BLEND_SRC_RGB = 0x80C9,
    BLEND_DST_ALPHA = 0x80CA,
    BLEND_SRC_ALPHA = 0x80CB,
    POINT_FADE_THRESHOLD_SIZE = 0x8128,
    DEPTH_COMPONENT16 = 0x81A5,
    DEPTH_COMPONENT24 = 0x81A6,
    DEPTH_COMPONENT32 = 0x81A7,
    MIRRORED_REPEAT = 0x8370,
    MAX_TEXTURE_LOD_BIAS = 0x84FD,
    TEXTURE_LOD_BIAS = 0x8501,
    INCR_WRAP = 0x8507,
    DECR_WRAP = 0x8508,
    TEXTURE_DEPTH_SIZE = 0x884A,
    TEXTURE_COMPARE_MODE = 0x884C,
    TEXTURE_COMPARE_FUNC = 0x884D,
    FUNC_ADD = 0x8006,
    FUNC_SUBTRACT = 0x800A,
    FUNC_REVERSE_SUBTRACT = 0x800B,
    MIN = 0x8007,
    MAX = 0x8008,
    CONSTANT_COLOR = 0x8001,
    ONE_MINUS_CONSTANT_COLOR = 0x8002,
    CONSTANT_ALPHA = 0x8003,
    ONE_MINUS_CONSTANT_ALPHA = 0x8004,
    BUFFER_SIZE = 0x8764,
    BUFFER_USAGE = 0x8765,
    QUERY_COUNTER_BITS = 0x8864,
    CURRENT_QUERY = 0x8865,
    QUERY_RESULT = 0x8866,
    QUERY_RESULT_AVAILABLE = 0x8867,
    ARRAY_BUFFER = 0x8892,
    ELEMENT_ARRAY_BUFFER = 0x8893,
    ARRAY_BUFFER_BINDING = 0x8894,
    ELEMENT_ARRAY_BUFFER_BINDING = 0x8895,
    VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F,
    READ_ONLY = 0x88B8,
    WRITE_ONLY = 0x88B9,
    READ_WRITE = 0x88BA,
    BUFFER_ACCESS = 0x88BB,
    BUFFER_MAPPED = 0x88BC,
    BUFFER_MAP_POINTER = 0x88BD,
    STREAM_DRAW = 0x88E0,
    STREAM_READ = 0x88E1,
    STREAM_COPY = 0x88E2,
    STATIC_DRAW = 0x88E4,
    STATIC_READ = 0x88E5,
    STATIC_COPY = 0x88E6,
    DYNAMIC_DRAW = 0x88E8,
    DYNAMIC_READ = 0x88E9,
    DYNAMIC_COPY = 0x88EA,
    SAMPLES_PASSED = 0x8914,
    SRC1_ALPHA = 0x8589,
    BLEND_EQUATION_RGB = 0x8009,
    VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622,
    VERTEX_ATTRIB_ARRAY_SIZE = 0x8623,
    VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624,
    VERTEX_ATTRIB_ARRAY_TYPE = 0x8625,
    CURRENT_VERTEX_ATTRIB = 0x8626,
    VERTEX_PROGRAM_POINT_SIZE = 0x8642,
    VERTEX_ATTRIB_ARRAY_POINTER = 0x8645,
    STENCIL_BACK_FUNC = 0x8800,
    STENCIL_BACK_FAIL = 0x8801,
    STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802,
    STENCIL_BACK_PASS_DEPTH_PASS = 0x8803,
    MAX_DRAW_BUFFERS = 0x8824,
    DRAW_BUFFER0 = 0x8825,
    DRAW_BUFFER1 = 0x8826,
    DRAW_BUFFER2 = 0x8827,
    DRAW_BUFFER3 = 0x8828,
    DRAW_BUFFER4 = 0x8829,
    DRAW_BUFFER5 = 0x882A,
    DRAW_BUFFER6 = 0x882B,
    DRAW_BUFFER7 = 0x882C,
    DRAW_BUFFER8 = 0x882D,
    DRAW_BUFFER9 = 0x882E,
    DRAW_BUFFER10 = 0x882F,
    DRAW_BUFFER11 = 0x8830,
    DRAW_BUFFER12 = 0x8831,
    DRAW_BUFFER13 = 0x8832,
    DRAW_BUFFER14 = 0x8833,
    DRAW_BUFFER15 = 0x8834,
    BLEND_EQUATION_ALPHA = 0x883D,
    MAX_VERTEX_ATTRIBS = 0x8869,
    VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A,
    MAX_TEXTURE_IMAGE_UNITS = 0x8872,
    FRAGMENT_SHADER = 0x8B30,
    VERTEX_SHADER = 0x8B31,
    MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49,
    MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A,
    MAX_VARYING_FLOATS = 0x8B4B,
    MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C,
    MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D,
    SHADER_TYPE = 0x8B4F,
    FLOAT_VEC2 = 0x8B50,
    FLOAT_VEC3 = 0x8B51,
    FLOAT_VEC4 = 0x8B52,
    INT_VEC2 = 0x8B53,
    INT_VEC3 = 0x8B54,
    INT_VEC4 = 0x8B55,
    BOOL = 0x8B56,
    BOOL_VEC2 = 0x8B57,
    BOOL_VEC3 = 0x8B58,
    BOOL_VEC4 = 0x8B59,
    FLOAT_MAT2 = 0x8B5A,
    FLOAT_MAT3 = 0x8B5B,
    FLOAT_MAT4 = 0x8B5C,
    SAMPLER_1D = 0x8B5D,
    SAMPLER_2D = 0x8B5E,
    SAMPLER_3D = 0x8B5F,
    SAMPLER_CUBE = 0x8B60,
    SAMPLER_1D_SHADOW = 0x8B61,
    SAMPLER_2D_SHADOW = 0x8B62,
    DELETE_STATUS = 0x8B80,
    COMPILE_STATUS = 0x8B81,
    LINK_STATUS = 0x8B82,
    VALIDATE_STATUS = 0x8B83,
    INFO_LOG_LENGTH = 0x8B84,
    ATTACHED_SHADERS = 0x8B85,
    ACTIVE_UNIFORMS = 0x8B86,
    ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87,
    SHADER_SOURCE_LENGTH = 0x8B88,
    ACTIVE_ATTRIBUTES = 0x8B89,
    ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A,
    FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B,
    SHADING_LANGUAGE_VERSION = 0x8B8C,
    CURRENT_PROGRAM = 0x8B8D,
    POINT_SPRITE_COORD_ORIGIN = 0x8CA0,
    LOWER_LEFT = 0x8CA1,
    UPPER_LEFT = 0x8CA2,
    STENCIL_BACK_REF = 0x8CA3,
    STENCIL_BACK_VALUE_MASK = 0x8CA4,
    STENCIL_BACK_WRITEMASK = 0x8CA5,
    PIXEL_PACK_BUFFER = 0x88EB,
    PIXEL_UNPACK_BUFFER = 0x88EC,
    PIXEL_PACK_BUFFER_BINDING = 0x88ED,
    PIXEL_UNPACK_BUFFER_BINDING = 0x88EF,
    FLOAT_MAT2x3 = 0x8B65,
    FLOAT_MAT2x4 = 0x8B66,
    FLOAT_MAT3x2 = 0x8B67,
    FLOAT_MAT3x4 = 0x8B68,
    FLOAT_MAT4x2 = 0x8B69,
    FLOAT_MAT4x3 = 0x8B6A,
	SRGB = 0x8C40,
    SRGB8 = 0x8C41,
    SRGB_ALPHA = 0x8C42,
    SRGB8_ALPHA8 = 0x8C43,
    COMPRESSED_SRGB = 0x8C48,
    COMPRESSED_SRGB_ALPHA = 0x8C49,
    COMPARE_REF_TO_TEXTURE = 0x884E,
    CLIP_DISTANCE0 = 0x3000,
    CLIP_DISTANCE1 = 0x3001,
    CLIP_DISTANCE2 = 0x3002,
    CLIP_DISTANCE3 = 0x3003,
    CLIP_DISTANCE4 = 0x3004,
    CLIP_DISTANCE5 = 0x3005,
    CLIP_DISTANCE6 = 0x3006,
    CLIP_DISTANCE7 = 0x3007,
    MAX_CLIP_DISTANCES = 0x0D32,
    MAJOR_VERSION = 0x821B,
    MINOR_VERSION = 0x821C,
    NUM_EXTENSIONS = 0x821D,
    CONTEXT_FLAGS = 0x821E,
    COMPRESSED_RED = 0x8225,
    COMPRESSED_RG = 0x8226,
    CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = 0x00000001,
    RGBA32F = 0x8814,
    RGB32F = 0x8815,
    RGBA16F = 0x881A,
    RGB16F = 0x881B,
    VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD,
    MAX_ARRAY_TEXTURE_LAYERS = 0x88FF,
    MIN_PROGRAM_TEXEL_OFFSET = 0x8904,
    MAX_PROGRAM_TEXEL_OFFSET = 0x8905,
    CLAMP_READ_COLOR = 0x891C,
    FIXED_ONLY = 0x891D,
    MAX_VARYING_COMPONENTS = 0x8B4B,
    TEXTURE_1D_ARRAY = 0x8C18,
    PROXY_TEXTURE_1D_ARRAY = 0x8C19,
    TEXTURE_2D_ARRAY = 0x8C1A,
    PROXY_TEXTURE_2D_ARRAY = 0x8C1B,
    TEXTURE_BINDING_1D_ARRAY = 0x8C1C,
    TEXTURE_BINDING_2D_ARRAY = 0x8C1D,
    R11F_G11F_B10F = 0x8C3A,
    UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B,
    RGB9_E5 = 0x8C3D,
    UNSIGNED_INT_5_9_9_9_REV = 0x8C3E,
    TEXTURE_SHARED_SIZE = 0x8C3F,
    TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76,
    TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F,
    MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80,
    TRANSFORM_FEEDBACK_VARYINGS = 0x8C83,
    TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84,
    TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85,
    PRIMITIVES_GENERATED = 0x8C87,
    TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88,
    RASTERIZER_DISCARD = 0x8C89,
    MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A,
    MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B,
    INTERLEAVED_ATTRIBS = 0x8C8C,
    SEPARATE_ATTRIBS = 0x8C8D,
    TRANSFORM_FEEDBACK_BUFFER = 0x8C8E,
    TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F,
    RGBA32UI = 0x8D70,
    RGB32UI = 0x8D71,
    RGBA16UI = 0x8D76,
    RGB16UI = 0x8D77,
    RGBA8UI = 0x8D7C,
    RGB8UI = 0x8D7D,
    RGBA32I = 0x8D82,
    RGB32I = 0x8D83,
    RGBA16I = 0x8D88,
    RGB16I = 0x8D89,
    RGBA8I = 0x8D8E,
    RGB8I = 0x8D8F,
    RED_INTEGER = 0x8D94,
    GREEN_INTEGER = 0x8D95,
    BLUE_INTEGER = 0x8D96,
    RGB_INTEGER = 0x8D98,
    RGBA_INTEGER = 0x8D99,
    BGR_INTEGER = 0x8D9A,
    BGRA_INTEGER = 0x8D9B,
    SAMPLER_1D_ARRAY = 0x8DC0,
    SAMPLER_2D_ARRAY = 0x8DC1,
    SAMPLER_1D_ARRAY_SHADOW = 0x8DC3,
    SAMPLER_2D_ARRAY_SHADOW = 0x8DC4,
    SAMPLER_CUBE_SHADOW = 0x8DC5,
    UNSIGNED_INT_VEC2 = 0x8DC6,
    UNSIGNED_INT_VEC3 = 0x8DC7,
    UNSIGNED_INT_VEC4 = 0x8DC8,
    INT_SAMPLER_1D = 0x8DC9,
    INT_SAMPLER_2D = 0x8DCA,
    INT_SAMPLER_3D = 0x8DCB,
    INT_SAMPLER_CUBE = 0x8DCC,
    INT_SAMPLER_1D_ARRAY = 0x8DCE,
    INT_SAMPLER_2D_ARRAY = 0x8DCF,
    UNSIGNED_INT_SAMPLER_1D = 0x8DD1,
    UNSIGNED_INT_SAMPLER_2D = 0x8DD2,
    UNSIGNED_INT_SAMPLER_3D = 0x8DD3,
    UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4,
    UNSIGNED_INT_SAMPLER_1D_ARRAY = 0x8DD6,
    UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7,
    QUERY_WAIT = 0x8E13,
    QUERY_NO_WAIT = 0x8E14,
    QUERY_BY_REGION_WAIT = 0x8E15,
    QUERY_BY_REGION_NO_WAIT = 0x8E16,
    BUFFER_ACCESS_FLAGS = 0x911F,
    BUFFER_MAP_LENGTH = 0x9120,
    BUFFER_MAP_OFFSET = 0x9121,
    DEPTH_COMPONENT32F = 0x8CAC,
    DEPTH32F_STENCIL8 = 0x8CAD,
    FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD,
    INVALID_FRAMEBUFFER_OPERATION = 0x0506,
    FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210,
    FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211,
    FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212,
    FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213,
    FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214,
    FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215,
    FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216,
    FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217,
    FRAMEBUFFER_DEFAULT = 0x8218,
    FRAMEBUFFER_UNDEFINED = 0x8219,
    DEPTH_STENCIL_ATTACHMENT = 0x821A,
    MAX_RENDERBUFFER_SIZE = 0x84E8,
    DEPTH_STENCIL = 0x84F9,
    UNSIGNED_INT_24_8 = 0x84FA,
    DEPTH24_STENCIL8 = 0x88F0,
    TEXTURE_STENCIL_SIZE = 0x88F1,
    TEXTURE_RED_TYPE = 0x8C10,
    TEXTURE_GREEN_TYPE = 0x8C11,
    TEXTURE_BLUE_TYPE = 0x8C12,
    TEXTURE_ALPHA_TYPE = 0x8C13,
    TEXTURE_DEPTH_TYPE = 0x8C16,
    UNSIGNED_NORMALIZED = 0x8C17,
    FRAMEBUFFER_BINDING = 0x8CA6,
    DRAW_FRAMEBUFFER_BINDING = 0x8CA6,
    RENDERBUFFER_BINDING = 0x8CA7,
    READ_FRAMEBUFFER = 0x8CA8,
    DRAW_FRAMEBUFFER = 0x8CA9,
    READ_FRAMEBUFFER_BINDING = 0x8CAA,
    RENDERBUFFER_SAMPLES = 0x8CAB,
    FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0,
    FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1,
    FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2,
    FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3,
    FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4,
    FRAMEBUFFER_COMPLETE = 0x8CD5,
    FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6,
    FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7,
    FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = 0x8CDB,
    FRAMEBUFFER_INCOMPLETE_READ_BUFFER = 0x8CDC,
    FRAMEBUFFER_UNSUPPORTED = 0x8CDD,
    MAX_COLOR_ATTACHMENTS = 0x8CDF,
    COLOR_ATTACHMENT0 = 0x8CE0,
    COLOR_ATTACHMENT1 = 0x8CE1,
    COLOR_ATTACHMENT2 = 0x8CE2,
    COLOR_ATTACHMENT3 = 0x8CE3,
    COLOR_ATTACHMENT4 = 0x8CE4,
    COLOR_ATTACHMENT5 = 0x8CE5,
    COLOR_ATTACHMENT6 = 0x8CE6,
    COLOR_ATTACHMENT7 = 0x8CE7,
    COLOR_ATTACHMENT8 = 0x8CE8,
    COLOR_ATTACHMENT9 = 0x8CE9,
    COLOR_ATTACHMENT10 = 0x8CEA,
    COLOR_ATTACHMENT11 = 0x8CEB,
    COLOR_ATTACHMENT12 = 0x8CEC,
    COLOR_ATTACHMENT13 = 0x8CED,
    COLOR_ATTACHMENT14 = 0x8CEE,
    COLOR_ATTACHMENT15 = 0x8CEF,
    DEPTH_ATTACHMENT = 0x8D00,
    STENCIL_ATTACHMENT = 0x8D20,
    FRAMEBUFFER = 0x8D40,
    RENDERBUFFER = 0x8D41,
    RENDERBUFFER_WIDTH = 0x8D42,
    RENDERBUFFER_HEIGHT = 0x8D43,
    RENDERBUFFER_INTERNAL_FORMAT = 0x8D44,
    STENCIL_INDEX1 = 0x8D46,
    STENCIL_INDEX4 = 0x8D47,
    STENCIL_INDEX8 = 0x8D48,
    STENCIL_INDEX16 = 0x8D49,
    RENDERBUFFER_RED_SIZE = 0x8D50,
    RENDERBUFFER_GREEN_SIZE = 0x8D51,
    RENDERBUFFER_BLUE_SIZE = 0x8D52,
    RENDERBUFFER_ALPHA_SIZE = 0x8D53,
    RENDERBUFFER_DEPTH_SIZE = 0x8D54,
    RENDERBUFFER_STENCIL_SIZE = 0x8D55,
    FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56,
    MAX_SAMPLES = 0x8D57,
    INDEX = 0x8222,
    FRAMEBUFFER_SRGB = 0x8DB9,
    HALF_FLOAT = 0x140B,
    MAP_READ_BIT = 0x0001,
    MAP_WRITE_BIT = 0x0002,
    MAP_INVALIDATE_RANGE_BIT = 0x0004,
    MAP_INVALIDATE_BUFFER_BIT = 0x0008,
    MAP_FLUSH_EXPLICIT_BIT = 0x0010,
    MAP_UNSYNCHRONIZED_BIT = 0x0020,
    COMPRESSED_RED_RGTC1 = 0x8DBB,
    COMPRESSED_SIGNED_RED_RGTC1 = 0x8DBC,
    COMPRESSED_RG_RGTC2 = 0x8DBD,
    COMPRESSED_SIGNED_RG_RGTC2 = 0x8DBE,
	RG = 0x8227,
    RG_INTEGER = 0x8228,
    R8 = 0x8229,
    R16 = 0x822A,
    RG8 = 0x822B,
    RG16 = 0x822C,
    R16F = 0x822D,
    R32F = 0x822E,
    RG16F = 0x822F,
    RG32F = 0x8230,
    R8I = 0x8231,
    R8UI = 0x8232,
    R16I = 0x8233,
    R16UI = 0x8234,
    R32I = 0x8235,
    R32UI = 0x8236,
    RG8I = 0x8237,
    RG8UI = 0x8238,
    RG16I = 0x8239,
    RG16UI = 0x823A,
    RG32I = 0x823B,
    RG32UI = 0x823C,
    VERTEX_ARRAY_BINDING = 0x85B5,
    SAMPLER_2D_RECT = 0x8B63,
    SAMPLER_2D_RECT_SHADOW = 0x8B64,
    SAMPLER_BUFFER = 0x8DC2,
    INT_SAMPLER_2D_RECT = 0x8DCD,
    INT_SAMPLER_BUFFER = 0x8DD0,
    UNSIGNED_INT_SAMPLER_2D_RECT = 0x8DD5,
    UNSIGNED_INT_SAMPLER_BUFFER = 0x8DD8,
    TEXTURE_BUFFER = 0x8C2A,
    MAX_TEXTURE_BUFFER_SIZE = 0x8C2B,
    TEXTURE_BINDING_BUFFER = 0x8C2C,
    TEXTURE_BUFFER_DATA_STORE_BINDING = 0x8C2D,
    TEXTURE_RECTANGLE = 0x84F5,
    TEXTURE_BINDING_RECTANGLE = 0x84F6,
    PROXY_TEXTURE_RECTANGLE = 0x84F7,
    MAX_RECTANGLE_TEXTURE_SIZE = 0x84F8,
    R8_SNORM = 0x8F94,
    RG8_SNORM = 0x8F95,
    RGB8_SNORM = 0x8F96,
    RGBA8_SNORM = 0x8F97,
    R16_SNORM = 0x8F98,
    RG16_SNORM = 0x8F99,
    RGB16_SNORM = 0x8F9A,
    RGBA16_SNORM = 0x8F9B,
    SIGNED_NORMALIZED = 0x8F9C,
    PRIMITIVE_RESTART = 0x8F9D,
    PRIMITIVE_RESTART_INDEX = 0x8F9E,
    COPY_READ_BUFFER = 0x8F36,
    COPY_WRITE_BUFFER = 0x8F37,
    UNIFORM_BUFFER = 0x8A11,
    UNIFORM_BUFFER_BINDING = 0x8A28,
    UNIFORM_BUFFER_START = 0x8A29,
    UNIFORM_BUFFER_SIZE = 0x8A2A,
    MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B,
    MAX_GEOMETRY_UNIFORM_BLOCKS = 0x8A2C,
    MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D,
    MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E,
    MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F,
    MAX_UNIFORM_BLOCK_SIZE = 0x8A30,
    MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31,
    MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 0x8A32,
    MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33,
    UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34,
    ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35,
    ACTIVE_UNIFORM_BLOCKS = 0x8A36,
    UNIFORM_TYPE = 0x8A37,
    UNIFORM_SIZE = 0x8A38,
    UNIFORM_NAME_LENGTH = 0x8A39,
    UNIFORM_BLOCK_INDEX = 0x8A3A,
    UNIFORM_OFFSET = 0x8A3B,
    UNIFORM_ARRAY_STRIDE = 0x8A3C,
    UNIFORM_MATRIX_STRIDE = 0x8A3D,
    UNIFORM_IS_ROW_MAJOR = 0x8A3E,
    UNIFORM_BLOCK_BINDING = 0x8A3F,
    UNIFORM_BLOCK_DATA_SIZE = 0x8A40,
    UNIFORM_BLOCK_NAME_LENGTH = 0x8A41,
    UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42,
    UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43,
    UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44,
    UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = 0x8A45,
    UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46,
    INVALID_INDEX = 0xFFFFFFFF,
    CONTEXT_CORE_PROFILE_BIT = 0x00000001,
    CONTEXT_COMPATIBILITY_PROFILE_BIT = 0x00000002,
    LINES_ADJACENCY = 0x000A,
    LINE_STRIP_ADJACENCY = 0x000B,
    TRIANGLES_ADJACENCY = 0x000C,
    TRIANGLE_STRIP_ADJACENCY = 0x000D,
    PROGRAM_POINT_SIZE = 0x8642,
    MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 0x8C29,
    FRAMEBUFFER_ATTACHMENT_LAYERED = 0x8DA7,
    FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 0x8DA8,
    GEOMETRY_SHADER = 0x8DD9,
    GEOMETRY_VERTICES_OUT = 0x8916,
    GEOMETRY_INPUT_TYPE = 0x8917,
    GEOMETRY_OUTPUT_TYPE = 0x8918,
    MAX_GEOMETRY_UNIFORM_COMPONENTS = 0x8DDF,
    MAX_GEOMETRY_OUTPUT_VERTICES = 0x8DE0,
    MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 0x8DE1,
    MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122,
    MAX_GEOMETRY_INPUT_COMPONENTS = 0x9123,
    MAX_GEOMETRY_OUTPUT_COMPONENTS = 0x9124,
    MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125,
    CONTEXT_PROFILE_MASK = 0x9126,
    DEPTH_CLAMP = 0x864F,
    QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = 0x8E4C,
    FIRST_VERTEX_CONVENTION = 0x8E4D,
    LAST_VERTEX_CONVENTION = 0x8E4E,
    PROVOKING_VERTEX = 0x8E4F,
    TEXTURE_CUBE_MAP_SEAMLESS = 0x884F,
    MAX_SERVER_WAIT_TIMEOUT = 0x9111,
    OBJECT_TYPE = 0x9112,
    SYNC_CONDITION = 0x9113,
    SYNC_STATUS = 0x9114,
    SYNC_FLAGS = 0x9115,
    SYNC_FENCE = 0x9116,
    SYNC_GPU_COMMANDS_COMPLETE = 0x9117,
    UNSIGNALED = 0x9118,
    SIGNALED = 0x9119,
    ALREADY_SIGNALED = 0x911A,
    TIMEOUT_EXPIRED = 0x911B,
    CONDITION_SATISFIED = 0x911C,
    WAIT_FAILED = 0x911D,
    TIMEOUT_IGNORED = -1, -- 0xFFFFFFFFFFFFFFFF
    SYNC_FLUSH_COMMANDS_BIT = 0x00000001,
    SAMPLE_POSITION = 0x8E50,
    SAMPLE_MASK = 0x8E51,
    SAMPLE_MASK_VALUE = 0x8E52,
    MAX_SAMPLE_MASK_WORDS = 0x8E59,
    TEXTURE_2D_MULTISAMPLE = 0x9100,
    PROXY_TEXTURE_2D_MULTISAMPLE = 0x9101,
    TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9102,
    PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9103,
    TEXTURE_BINDING_2D_MULTISAMPLE = 0x9104,
    TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 0x9105,
    TEXTURE_SAMPLES = 0x9106,
    TEXTURE_FIXED_SAMPLE_LOCATIONS = 0x9107,
    SAMPLER_2D_MULTISAMPLE = 0x9108,
    INT_SAMPLER_2D_MULTISAMPLE = 0x9109,
    UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 0x910A,
    SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910B,
    INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C,
    UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D,
    MAX_COLOR_TEXTURE_SAMPLES = 0x910E,
    MAX_DEPTH_TEXTURE_SAMPLES = 0x910F,
    MAX_INTEGER_SAMPLES = 0x9110
}

local ffi = zune.ffi;

type getProcAddress = (name: string) -> FFIPointer
type getProcFunction = (name: string, definition: {returns: any, args: {any}}) -> ((...any) -> any)

local loaders: {[string]: (getProcFunction) -> ()} = {}

local gl = {}

function gl.LoadGL(getProcAddress: getProcAddress)
    local function load(name: string, definition: {returns: FFIDataType, args: {FFIDataType}})
        local address = getProcAddress(name)
        if (address == ffi.null) then
            error("Failed to load OpenGL function: " .. (name or ""))
        end
        local c_fn = ffi.fn(definition, address)
        return function(...)
            return c_fn(...);
        end
    end

    for k,v in constants do
        gl[k] = v
    end

    for _, loader in loaders do
        loader(load)
    end
end

type gl = typeof(gl) & typeof(constants)

local t_void = ffi.types.void
local t_schar = ffi.types.i8
local t_uchar = ffi.types.u8
local t_short = ffi.types.i16
local t_ushort = ffi.types.u16
local t_int = ffi.types.i32
local t_uint = ffi.types.u32
local t_long = ffi.types.i64
local t_ulong = ffi.types.u64
local t_float = ffi.types.float
local t_double = ffi.types.double
local t_voidptr = ffi.types.pointer

function loaders.loadGL_1_0(load: getProcFunction)
    gl.CullFace = load("glCullFace", {returns = t_void, args = {t_uint}})
    gl.FrontFace = load("glFrontFace", {returns = t_void, args = {t_uint}})
    gl.Hint = load("glHint", {returns = t_void, args = {t_uint, t_uint}})
    gl.LineWidth = load("glLineWidth", {returns = t_void, args = {t_float}})
    gl.PointSize = load("glPointSize", {returns = t_void, args = {t_float}})
    gl.PolygonMode = load("glPolygonMode", {returns = t_void, args = {t_uint, t_uint}})
    gl.Scissor = load("glScissor", {returns = t_void, args = {t_int, t_int, t_int, t_int}})
    gl.TexParameterf = load("glTexParameterf", {returns = t_void, args = {t_uint, t_uint, t_float}})
    gl.TexParameterfv = load("glTexParameterfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.TexParameteri = load("glTexParameteri", {returns = t_void, args = {t_uint, t_uint, t_int}})
    gl.TexParameteriv = load("glTexParameteriv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.TexImage1D = load("glTexImage1D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.TexImage2D = load("glTexImage2D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.DrawBuffer = load("glDrawBuffer", {returns = t_void, args = {t_uint}})
    gl.Clear = load("glClear", {returns = t_void, args = {t_uint}})
    gl.ClearColor = load("glClearColor", {returns = t_void, args = {t_float, t_float, t_float, t_float}})
    gl.ClearStencil = load("glClearStencil", {returns = t_void, args = {t_int}})
    gl.ClearDepth = load("glClearDepth", {returns = t_void, args = {t_double}})
    gl.StencilMask = load("glStencilMask", {returns = t_void, args = {t_uint}})
    gl.ColorMask = load("glColorMask", {returns = t_void, args = {t_uchar, t_uchar, t_uchar, t_uchar}})
    gl.DepthMask = load("glDepthMask", {returns = t_void, args = {t_uchar}})
    gl.Disable = load("glDisable", {returns = t_void, args = {t_uint}})
    gl.Enable = load("glEnable", {returns = t_void, args = {t_uint}})
    gl.Finish = load("glFinish", {returns = t_void, args = {}})
    gl.Flush = load("glFlush", {returns = t_void, args = {}})
    gl.BlendFunc = load("glBlendFunc", {returns = t_void, args = {t_uint, t_uint}})
    gl.LogicOp = load("glLogicOp", {returns = t_void, args = {t_uint}})
    gl.StencilFunc = load("glStencilFunc", {returns = t_void, args = {t_uint, t_int, t_uint}})
    gl.StencilOp = load("glStencilOp", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.DepthFunc = load("glDepthFunc", {returns = t_void, args = {t_uint}})
    gl.PixelStoref = load("glPixelStoref", {returns = t_void, args = {t_uint, t_float}})
    gl.PixelStorei = load("glPixelStorei", {returns = t_void, args = {t_uint, t_int}})
    gl.ReadBuffer = load("glReadBuffer", {returns = t_void, args = {t_uint}})
    gl.ReadPixels = load("glReadPixels", {returns = t_void, args = {t_int, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.GetBooleanv = load("glGetBooleanv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetDoublev = load("glGetDoublev", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetError = load("glGetError", {returns = t_uint, args = {}})
    gl.GetFloatv = load("glGetFloatv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetIntegerv = load("glGetIntegerv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetString = load("glGetString", {returns = t_voidptr, args = {t_uint}})
    gl.GetTexImage = load("glGetTexImage", {returns = t_void, args = {t_uint, t_int, t_uint, t_uint, t_voidptr}})
    gl.GetTexParameterfv = load("glGetTexParameterfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetTexParameteriv = load("glGetTexParameteriv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetTexLevelParameterfv = load("glGetTexLevelParameterfv", {returns = t_void, args = {t_uint, t_int, t_uint, t_voidptr}})
    gl.GetTexLevelParameteriv = load("glGetTexLevelParameteriv", {returns = t_void, args = {t_uint, t_int, t_uint, t_voidptr}})
    gl.IsEnabled = load("glIsEnabled", {returns = t_uchar, args = {t_uint}})
    gl.DepthRange = load("glDepthRange", {returns = t_void, args = {t_double, t_double}})
    gl.Viewport = load("glViewport", {returns = t_void, args = {t_int, t_int, t_int, t_int}})
    gl.NewList = load("glNewList", {returns = t_void, args = {t_uint, t_uint}})
    gl.EndList = load("glEndList", {returns = t_void, args = {}})
    gl.CallList = load("glCallList", {returns = t_void, args = {t_uint}})
    gl.CallLists = load("glCallLists", {returns = t_void, args = {t_int, t_uint, t_voidptr}})
    gl.DeleteLists = load("glDeleteLists", {returns = t_void, args = {t_uint, t_int}})
    gl.GenLists = load("glGenLists", {returns = t_uint, args = {t_int}})
    gl.ListBase = load("glListBase", {returns = t_void, args = {t_uint}})
    gl.Begin = load("glBegin", {returns = t_void, args = {t_uint}})
    gl.Bitmap = load("glBitmap", {returns = t_void, args = {t_int, t_int, t_float, t_float, t_float, t_float, t_voidptr}})
    gl.Color3b = load("glColor3b", {returns = t_void, args = {t_schar, t_schar, t_schar}})
    gl.Color3bv = load("glColor3bv", {returns = t_void, args = {t_voidptr}})
    gl.Color3d = load("glColor3d", {returns = t_void, args = {t_double, t_double, t_double}})
    gl.Color3dv = load("glColor3dv", {returns = t_void, args = {t_voidptr}})
    gl.Color3f = load("glColor3f", {returns = t_void, args = {t_float, t_float, t_float}})
    gl.Color3fv = load("glColor3fv", {returns = t_void, args = {t_voidptr}})
    gl.Color3i = load("glColor3i", {returns = t_void, args = {t_int, t_int, t_int}})
    gl.Color3iv = load("glColor3iv", {returns = t_void, args = {t_voidptr}})
    gl.Color3s = load("glColor3s", {returns = t_void, args = {t_short, t_short, t_short}})
    gl.Color3sv = load("glColor3sv", {returns = t_void, args = {t_voidptr}})
    gl.Color3ub = load("glColor3ub", {returns = t_void, args = {t_uchar, t_uchar, t_uchar}})
    gl.Color3ubv = load("glColor3ubv", {returns = t_void, args = {t_voidptr}})
    gl.Color3ui = load("glColor3ui", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.Color3uiv = load("glColor3uiv", {returns = t_void, args = {t_voidptr}})
    gl.Color3us = load("glColor3us", {returns = t_void, args = {t_ushort, t_ushort, t_ushort}})
    gl.Color3usv = load("glColor3usv", {returns = t_void, args = {t_voidptr}})
    gl.Color4b = load("glColor4b", {returns = t_void, args = {t_schar, t_schar, t_schar, t_schar}})
    gl.Color4bv = load("glColor4bv", {returns = t_void, args = {t_voidptr}})
    gl.Color4d = load("glColor4d", {returns = t_void, args = {t_double, t_double, t_double, t_double}})
    gl.Color4dv = load("glColor4dv", {returns = t_void, args = {t_voidptr}})
    gl.Color4f = load("glColor4f", {returns = t_void, args = {t_float, t_float, t_float, t_float}})
    gl.Color4fv = load("glColor4fv", {returns = t_void, args = {t_voidptr}})
    gl.Color4i = load("glColor4i", {returns = t_void, args = {t_int, t_int, t_int, t_int}})
    gl.Color4iv = load("glColor4iv", {returns = t_void, args = {t_voidptr}})
    gl.Color4s = load("glColor4s", {returns = t_void, args = {t_short, t_short, t_short, t_short}})
    gl.Color4sv = load("glColor4sv", {returns = t_void, args = {t_voidptr}})
    gl.Color4ub = load("glColor4ub", {returns = t_void, args = {t_uchar, t_uchar, t_uchar, t_uchar}})
    gl.Color4ubv = load("glColor4ubv", {returns = t_void, args = {t_voidptr}})
    gl.Color4ui = load("glColor4ui", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint}})
    gl.Color4uiv = load("glColor4uiv", {returns = t_void, args = {t_voidptr}})
    gl.Color4us = load("glColor4us", {returns = t_void, args = {t_ushort, t_ushort, t_ushort, t_ushort}})
    gl.Color4usv = load("glColor4usv", {returns = t_void, args = {t_voidptr}})
    gl.EdgeFlag = load("glEdgeFlag", {returns = t_void, args = {t_uchar}})
    gl.EdgeFlagv = load("glEdgeFlagv", {returns = t_void, args = {t_voidptr}})
    gl.End = load("glEnd", {returns = t_void, args = {}})
    gl.Indexd = load("glIndexd", {returns = t_void, args = {t_double}})
    gl.Indexdv = load("glIndexdv", {returns = t_void, args = {t_voidptr}})
    gl.Indexf = load("glIndexf", {returns = t_void, args = {t_float}})
    gl.Indexfv = load("glIndexfv", {returns = t_void, args = {t_voidptr}})
    gl.Indexi = load("glIndexi", {returns = t_void, args = {t_int}})
    gl.Indexiv = load("glIndexiv", {returns = t_void, args = {t_voidptr}})
    gl.Indexs = load("glIndexs", {returns = t_void, args = {t_short}})
    gl.Indexsv = load("glIndexsv", {returns = t_void, args = {t_voidptr}})
    gl.Normal3b = load("glNormal3b", {returns = t_void, args = {t_schar, t_schar, t_schar}})
    gl.Normal3bv = load("glNormal3bv", {returns = t_void, args = {t_voidptr}})
    gl.Normal3d = load("glNormal3d", {returns = t_void, args = {t_double, t_double, t_double}})
    gl.Normal3dv = load("glNormal3dv", {returns = t_void, args = {t_voidptr}})
    gl.Normal3f = load("glNormal3f", {returns = t_void, args = {t_float, t_float, t_float}})
    gl.Normal3fv = load("glNormal3fv", {returns = t_void, args = {t_voidptr}})
    gl.Normal3i = load("glNormal3i", {returns = t_void, args = {t_int, t_int, t_int}})
    gl.Normal3iv = load("glNormal3iv", {returns = t_void, args = {t_voidptr}})
    gl.Normal3s = load("glNormal3s", {returns = t_void, args = {t_short, t_short, t_short}})
    gl.Normal3sv = load("glNormal3sv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos2d = load("glRasterPos2d", {returns = t_void, args = {t_double, t_double}})
    gl.RasterPos2dv = load("glRasterPos2dv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos2f = load("glRasterPos2f", {returns = t_void, args = {t_float, t_float}})
    gl.RasterPos2fv = load("glRasterPos2fv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos2i = load("glRasterPos2i", {returns = t_void, args = {t_int, t_int}})
    gl.RasterPos2iv = load("glRasterPos2iv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos2s = load("glRasterPos2s", {returns = t_void, args = {t_short, t_short}})
    gl.RasterPos2sv = load("glRasterPos2sv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos3d = load("glRasterPos3d", {returns = t_void, args = {t_double, t_double, t_double}})
    gl.RasterPos3dv = load("glRasterPos3dv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos3f = load("glRasterPos3f", {returns = t_void, args = {t_float, t_float, t_float}})
    gl.RasterPos3fv = load("glRasterPos3fv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos3i = load("glRasterPos3i", {returns = t_void, args = {t_int, t_int, t_int}})
    gl.RasterPos3iv = load("glRasterPos3iv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos3s = load("glRasterPos3s", {returns = t_void, args = {t_short, t_short, t_short}})
    gl.RasterPos3sv = load("glRasterPos3sv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos4d = load("glRasterPos4d", {returns = t_void, args = {t_double, t_double, t_double, t_double}})
    gl.RasterPos4dv = load("glRasterPos4dv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos4f = load("glRasterPos4f", {returns = t_void, args = {t_float, t_float, t_float, t_float}})
    gl.RasterPos4fv = load("glRasterPos4fv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos4i = load("glRasterPos4i", {returns = t_void, args = {t_int, t_int, t_int, t_int}})
    gl.RasterPos4iv = load("glRasterPos4iv", {returns = t_void, args = {t_voidptr}})
    gl.RasterPos4s = load("glRasterPos4s", {returns = t_void, args = {t_short, t_short, t_short, t_short}})
    gl.RasterPos4sv = load("glRasterPos4sv", {returns = t_void, args = {t_voidptr}})
    gl.Rectd = load("glRectd", {returns = t_void, args = {t_double, t_double, t_double, t_double}})
    gl.Rectdv = load("glRectdv", {returns = t_void, args = {t_voidptr, t_voidptr}})
    gl.Rectf = load("glRectf", {returns = t_void, args = {t_float, t_float, t_float, t_float}})
    gl.Rectfv = load("glRectfv", {returns = t_void, args = {t_voidptr, t_voidptr}})
    gl.Recti = load("glRecti", {returns = t_void, args = {t_int, t_int, t_int, t_int}})
    gl.Rectiv = load("glRectiv", {returns = t_void, args = {t_voidptr, t_voidptr}})
    gl.Rects = load("glRects", {returns = t_void, args = {t_short, t_short, t_short, t_short}})
    gl.Rectsv = load("glRectsv", {returns = t_void, args = {t_voidptr, t_voidptr}})
    gl.TexCoord1d = load("glTexCoord1d", {returns = t_void, args = {t_double}})
    gl.TexCoord1dv = load("glTexCoord1dv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord1f = load("glTexCoord1f", {returns = t_void, args = {t_float}})
    gl.TexCoord1fv = load("glTexCoord1fv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord1i = load("glTexCoord1i", {returns = t_void, args = {t_int}})
    gl.TexCoord1iv = load("glTexCoord1iv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord1s = load("glTexCoord1s", {returns = t_void, args = {t_short}})
    gl.TexCoord1sv = load("glTexCoord1sv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord2d = load("glTexCoord2d", {returns = t_void, args = {t_double, t_double}})
    gl.TexCoord2dv = load("glTexCoord2dv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord2f = load("glTexCoord2f", {returns = t_void, args = {t_float, t_float}})
    gl.TexCoord2fv = load("glTexCoord2fv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord2i = load("glTexCoord2i", {returns = t_void, args = {t_int, t_int}})
    gl.TexCoord2iv = load("glTexCoord2iv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord2s = load("glTexCoord2s", {returns = t_void, args = {t_short, t_short}})
    gl.TexCoord2sv = load("glTexCoord2sv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord3d = load("glTexCoord3d", {returns = t_void, args = {t_double, t_double, t_double}})
    gl.TexCoord3dv = load("glTexCoord3dv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord3f = load("glTexCoord3f", {returns = t_void, args = {t_float, t_float, t_float}})
    gl.TexCoord3fv = load("glTexCoord3fv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord3i = load("glTexCoord3i", {returns = t_void, args = {t_int, t_int, t_int}})
    gl.TexCoord3iv = load("glTexCoord3iv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord3s = load("glTexCoord3s", {returns = t_void, args = {t_short, t_short, t_short}})
    gl.TexCoord3sv = load("glTexCoord3sv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord4d = load("glTexCoord4d", {returns = t_void, args = {t_double, t_double, t_double, t_double}})
    gl.TexCoord4dv = load("glTexCoord4dv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord4f = load("glTexCoord4f", {returns = t_void, args = {t_float, t_float, t_float, t_float}})
    gl.TexCoord4fv = load("glTexCoord4fv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord4i = load("glTexCoord4i", {returns = t_void, args = {t_int, t_int, t_int, t_int}})
    gl.TexCoord4iv = load("glTexCoord4iv", {returns = t_void, args = {t_voidptr}})
    gl.TexCoord4s = load("glTexCoord4s", {returns = t_void, args = {t_short, t_short, t_short, t_short}})
    gl.TexCoord4sv = load("glTexCoord4sv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex2d = load("glVertex2d", {returns = t_void, args = {t_double, t_double}})
    gl.Vertex2dv = load("glVertex2dv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex2f = load("glVertex2f", {returns = t_void, args = {t_float, t_float}})
    gl.Vertex2fv = load("glVertex2fv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex2i = load("glVertex2i", {returns = t_void, args = {t_int, t_int}})
    gl.Vertex2iv = load("glVertex2iv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex2s = load("glVertex2s", {returns = t_void, args = {t_short, t_short}})
    gl.Vertex2sv = load("glVertex2sv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex3d = load("glVertex3d", {returns = t_void, args = {t_double, t_double, t_double}})
    gl.Vertex3dv = load("glVertex3dv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex3f = load("glVertex3f", {returns = t_void, args = {t_float, t_float, t_float}})
    gl.Vertex3fv = load("glVertex3fv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex3i = load("glVertex3i", {returns = t_void, args = {t_int, t_int, t_int}})
    gl.Vertex3iv = load("glVertex3iv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex3s = load("glVertex3s", {returns = t_void, args = {t_short, t_short, t_short}})
    gl.Vertex3sv = load("glVertex3sv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex4d = load("glVertex4d", {returns = t_void, args = {t_double, t_double, t_double, t_double}})
    gl.Vertex4dv = load("glVertex4dv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex4f = load("glVertex4f", {returns = t_void, args = {t_float, t_float, t_float, t_float}})
    gl.Vertex4fv = load("glVertex4fv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex4i = load("glVertex4i", {returns = t_void, args = {t_int, t_int, t_int, t_int}})
    gl.Vertex4iv = load("glVertex4iv", {returns = t_void, args = {t_voidptr}})
    gl.Vertex4s = load("glVertex4s", {returns = t_void, args = {t_short, t_short, t_short, t_short}})
    gl.Vertex4sv = load("glVertex4sv", {returns = t_void, args = {t_voidptr}})
    gl.ClipPlane = load("glClipPlane", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.ColorMaterial = load("glColorMaterial", {returns = t_void, args = {t_uint, t_uint}})
    gl.Fogf = load("glFogf", {returns = t_void, args = {t_uint, t_float}})
    gl.Fogfv = load("glFogfv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.Fogi = load("glFogi", {returns = t_void, args = {t_uint, t_int}})
    gl.Fogiv = load("glFogiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.Lightf = load("glLightf", {returns = t_void, args = {t_uint, t_uint, t_float}})
    gl.Lightfv = load("glLightfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.Lighti = load("glLighti", {returns = t_void, args = {t_uint, t_uint, t_int}})
    gl.Lightiv = load("glLightiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.LightModelf = load("glLightModelf", {returns = t_void, args = {t_uint, t_float}})
    gl.LightModelfv = load("glLightModelfv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.LightModeli = load("glLightModeli", {returns = t_void, args = {t_uint, t_int}})
    gl.LightModeliv = load("glLightModeliv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.LineStipple = load("glLineStipple", {returns = t_void, args = {t_int, t_ushort}})
    gl.Materialf = load("glMaterialf", {returns = t_void, args = {t_uint, t_uint, t_float}})
    gl.Materialfv = load("glMaterialfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.Materiali = load("glMateriali", {returns = t_void, args = {t_uint, t_uint, t_int}})
    gl.Materialiv = load("glMaterialiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.PolygonStipple = load("glPolygonStipple", {returns = t_void, args = {t_voidptr}})
    gl.ShadeModel = load("glShadeModel", {returns = t_void, args = {t_uint}})
    gl.TexEnvf = load("glTexEnvf", {returns = t_void, args = {t_uint, t_uint, t_float}})
    gl.TexEnvfv = load("glTexEnvfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.TexEnvi = load("glTexEnvi", {returns = t_void, args = {t_uint, t_uint, t_int}})
    gl.TexEnviv = load("glTexEnviv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.TexGend = load("glTexGend", {returns = t_void, args = {t_uint, t_uint, t_double}})
    gl.TexGendv = load("glTexGendv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.TexGenf = load("glTexGenf", {returns = t_void, args = {t_uint, t_uint, t_float}})
    gl.TexGenfv = load("glTexGenfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.TexGeni = load("glTexGeni", {returns = t_void, args = {t_uint, t_uint, t_int}})
    gl.TexGeniv = load("glTexGeniv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.FeedbackBuffer = load("glFeedbackBuffer", {returns = t_void, args = {t_int, t_uint, t_voidptr}})
    gl.SelectBuffer = load("glSelectBuffer", {returns = t_void, args = {t_int, t_voidptr}})
    gl.RenderMode = load("glRenderMode", {returns = t_int, args = {t_int}})
    gl.InitNames = load("glInitNames", {returns = t_void, args = {}})
    gl.LoadName = load("glLoadName", {returns = t_void, args = {t_uint}})
    gl.PassThrough = load("glPassThrough", {returns = t_void, args = {t_float}})
    gl.PopName = load("glPopName", {returns = t_void, args = {}})
    gl.PushName = load("glPushName", {returns = t_void, args = {t_uint}})
    gl.ClearAccum = load("glClearAccum", {returns = t_void, args = {t_float, t_float, t_float, t_float}})
    gl.ClearIndex = load("glClearIndex", {returns = t_void, args = {t_float}})
    gl.IndexMask = load("glIndexMask", {returns = t_void, args = {t_uint}})
    gl.Accum = load("glAccum", {returns = t_void, args = {t_uint, t_float}})
    gl.PopAttrib = load("glPopAttrib", {returns = t_void, args = {}})
    gl.PushAttrib = load("glPushAttrib", {returns = t_void, args = {t_uint}})
    gl.Map1d = load("glMap1d", {returns = t_void, args = {t_uint, t_double, t_double, t_int, t_int, t_voidptr}})
    gl.Map1f = load("glMap1f", {returns = t_void, args = {t_uint, t_float, t_float, t_int, t_int, t_voidptr}})
    gl.Map2d = load("glMap2d", {returns = t_void, args = {t_uint, t_double, t_double, t_int, t_int, t_double, t_double, t_int, t_int, t_voidptr}})
    gl.Map2f = load("glMap2f", {returns = t_void, args = {t_uint, t_float, t_float, t_int, t_int, t_float, t_float, t_int, t_int, t_voidptr}})
    gl.MapGrid1d = load("glMapGrid1d", {returns = t_void, args = {t_int, t_double, t_double}})
    gl.MapGrid1f = load("glMapGrid1f", {returns = t_void, args = {t_int, t_float, t_float}})
    gl.MapGrid2d = load("glMapGrid2d", {returns = t_void, args = {t_int, t_double, t_double, t_int, t_double, t_double}})
    gl.MapGrid2f = load("glMapGrid2f", {returns = t_void, args = {t_int, t_float, t_float, t_int, t_float, t_float}})
    gl.EvalCoord1d = load("glEvalCoord1d", {returns = t_void, args = {t_double}})
    gl.EvalCoord1dv = load("glEvalCoord1dv", {returns = t_void, args = {t_voidptr}})
    gl.EvalCoord1f = load("glEvalCoord1f", {returns = t_void, args = {t_float}})
    gl.EvalCoord1fv = load("glEvalCoord1fv", {returns = t_void, args = {t_voidptr}})
    gl.EvalCoord2d = load("glEvalCoord2d", {returns = t_void, args = {t_double, t_double}})
    gl.EvalCoord2dv = load("glEvalCoord2dv", {returns = t_void, args = {t_voidptr}})
    gl.EvalCoord2f = load("glEvalCoord2f", {returns = t_void, args = {t_float, t_float}})
    gl.EvalCoord2fv = load("glEvalCoord2fv", {returns = t_void, args = {t_voidptr}})
    gl.EvalMesh1 = load("glEvalMesh1", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.EvalPoint1 = load("glEvalPoint1", {returns = t_void, args = {t_int}})
    gl.EvalMesh2 = load("glEvalMesh2", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.EvalPoint2 = load("glEvalPoint2", {returns = t_void, args = {t_int, t_int}})
    gl.AlphaFunc = load("glAlphaFunc", {returns = t_void, args = {t_uint, t_float}})
    gl.PixelZoom = load("glPixelZoom", {returns = t_void, args = {t_float, t_float}})
    gl.PixelTransferf = load("glPixelTransferf", {returns = t_void, args = {t_uint, t_float}})
    gl.PixelTransferi = load("glPixelTransferi", {returns = t_void, args = {t_uint, t_int}})
    gl.PixelMapfv = load("glPixelMapfv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.PixelMapuiv = load("glPixelMapuiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.PixelMapusv = load("glPixelMapusv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.CopyPixels = load("glCopyPixels", {returns = t_void, args = {t_int, t_int, t_int, t_int, t_uint}})
    gl.DrawPixels = load("glDrawPixels", {returns = t_void, args = {t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.GetClipPlane = load("glGetClipPlane", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetLightfv = load("glGetLightfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetLightiv = load("glGetLightiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetMapdv = load("glGetMapdv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetMapfv = load("glGetMapfv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetMapiv = load("glGetMapiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetMaterialfv = load("glGetMaterialfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetMaterialiv = load("glGetMaterialiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetPixelMapfv = load("glGetPixelMapfv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetPixelMapuiv = load("glGetPixelMapuiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetPixelMapusv = load("glGetPixelMapusv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetPolygonStipple = load("glGetPolygonStipple", {returns = t_void, args = {t_voidptr}})
    gl.GetTexEnvfv = load("glGetTexEnvfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetTexEnviv = load("glGetTexEnviv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetTexGendv = load("glGetTexGendv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetTexGenfv = load("glGetTexGenfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetTexGeniv = load("glGetTexGeniv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.IsList = load("glIsList", {returns = t_uchar, args = {t_uint}})
    gl.Frustum = load("glFrustum", {returns = t_void, args = {t_double, t_double, t_double, t_double, t_double, t_double}})
    gl.LoadIdentity = load("glLoadIdentity", {returns = t_void, args = {}})
    gl.LoadMatrixf = load("glLoadMatrixf", {returns = t_void, args = {t_voidptr}})
    gl.LoadMatrixd = load("glLoadMatrixd", {returns = t_void, args = {t_voidptr}})
    gl.MatrixMode = load("glMatrixMode", {returns = t_void, args = {t_uint}})
    gl.MultMatrixf = load("glMultMatrixf", {returns = t_void, args = {t_voidptr}})
    gl.MultMatrixd = load("glMultMatrixd", {returns = t_void, args = {t_voidptr}})
    gl.Ortho = load("glOrtho", {returns = t_void, args = {t_double, t_double, t_double, t_double, t_double, t_double}})
    gl.PopMatrix = load("glPopMatrix", {returns = t_void, args = {}})
    gl.PushMatrix = load("glPushMatrix", {returns = t_void, args = {}})
    gl.Rotated = load("glRotated", {returns = t_void, args = {t_double, t_double, t_double, t_double}})
    gl.Rotatef = load("glRotatef", {returns = t_void, args = {t_float, t_float, t_float, t_float}})
    gl.Scaled = load("glScaled", {returns = t_void, args = {t_double, t_double, t_double}})
    gl.Scalef = load("glScalef", {returns = t_void, args = {t_float, t_float, t_float}})
    gl.Translated = load("glTranslated", {returns = t_void, args = {t_double, t_double, t_double}})
    gl.Translatef = load("glTranslatef", {returns = t_void, args = {t_float, t_float, t_float}})
end

function loaders.loadGL_1_1(load: getProcFunction)
    gl.DrawArrays = load("glDrawArrays", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.DrawElements = load("glDrawElements", {returns = t_void, args = {t_uint, t_int, t_uint, t_voidptr}})
    gl.GetPointerv = load("glGetPointerv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.PolygonOffset = load("glPolygonOffset", {returns = t_void, args = {t_float, t_float}})
    gl.CopyTexImage1D = load("glCopyTexImage1D", {returns = t_void, args = {t_uint, t_int, t_uint, t_int, t_int, t_int}})
    gl.CopyTexImage2D = load("glCopyTexImage2D", {returns = t_void, args = {t_uint, t_int, t_uint, t_int, t_int, t_int, t_int}})
    gl.CopyTexSubImage1D = load("glCopyTexSubImage1D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.CopyTexSubImage2D = load("glCopyTexSubImage2D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_int}})
    gl.TexSubImage1D = load("glTexSubImage1D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.TexSubImage2D = load("glTexSubImage2D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.BindTexture = load("glBindTexture", {returns = t_void, args = {t_uint, t_uint}})
    gl.DeleteTextures = load("glDeleteTextures", {returns = t_void, args = {t_int, t_voidptr}})
    gl.GenTextures = load("glGenTextures", {returns = t_void, args = {t_int, t_voidptr}})
    gl.IsTexture = load("glIsTexture", {returns = t_uchar, args = {t_uint}})
    gl.ArrayElement = load("glArrayElement", {returns = t_void, args = {t_int}})
    gl.ColorPointer = load("glColorPointer", {returns = t_void, args = {t_int, t_uint, t_int, t_voidptr}})
    gl.DisableClientState = load("glDisableClientState", {returns = t_void, args = {t_uint}})
    gl.EdgeFlagPointer = load("glEdgeFlagPointer", {returns = t_void, args = {t_int, t_voidptr}})
    gl.EnableClientState = load("glEnableClientState", {returns = t_void, args = {t_uint}})
    gl.IndexPointer = load("glIndexPointer", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.InterleavedArrays = load("glInterleavedArrays", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.NormalPointer = load("glNormalPointer", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.TexCoordPointer = load("glTexCoordPointer", {returns = t_void, args = {t_int, t_uint, t_int, t_voidptr}})
    gl.VertexPointer = load("glVertexPointer", {returns = t_void, args = {t_int, t_uint, t_int, t_voidptr}})
    gl.AreTexturesResident = load("glAreTexturesResident", {returns = t_uchar, args = {t_int, t_voidptr, t_voidptr}})
    gl.PrioritizeTextures = load("glPrioritizeTextures", {returns = t_void, args = {t_int, t_voidptr, t_voidptr}})
    gl.Indexub = load("glIndexub", {returns = t_void, args = {t_uchar}})
    gl.Indexubv = load("glIndexubv", {returns = t_void, args = {t_voidptr}})
    gl.PopClientAttrib = load("glPopClientAttrib", {returns = t_void, args = {}})
    gl.PushClientAttrib = load("glPushClientAttrib", {returns = t_void, args = {t_uint}})
end

function loaders.loadGL_1_2(load: getProcFunction)
    gl.DrawRangeElements = load("glDrawRangeElements", {returns = t_void, args = {t_uint, t_uint, t_uint, t_int, t_uint, t_voidptr}})
    gl.TexImage3D = load("glTexImage3D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.TexSubImage3D = load("glTexSubImage3D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.CopyTexSubImage3D = load("glCopyTexSubImage3D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_int, t_int}})
end

function loaders.loadGL_1_3(load: getProcFunction)
    gl.ActiveTexture = load("glActiveTexture", {returns = t_void, args = {t_uint}})
    gl.SampleCoverage = load("glSampleCoverage", {returns = t_void, args = {t_float, t_uchar}})
    gl.CompressedTexImage3D = load("glCompressedTexImage3D", {returns = t_void, args = {t_uint, t_int, t_uint, t_int, t_int, t_int, t_int, t_voidptr}})
    gl.CompressedTexImage2D = load("glCompressedTexImage2D", {returns = t_void, args = {t_uint, t_int, t_uint, t_int, t_int, t_int, t_voidptr}})
    gl.CompressedTexImage1D = load("glCompressedTexImage1D", {returns = t_void, args = {t_uint, t_int, t_uint, t_int, t_int, t_voidptr}})
    gl.CompressedTexSubImage3D = load("glCompressedTexSubImage3D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.CompressedTexSubImage2D = load("glCompressedTexSubImage2D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.CompressedTexSubImage1D = load("glCompressedTexSubImage1D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_uint, t_uint, t_voidptr}})
    gl.GetCompressedTexImage = load("glGetCompressedTexImage", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.ClientActiveTexture = load("glClientActiveTexture", {returns = t_void, args = {t_uint}})
    gl.MultiTexCoord1d = load("glMultiTexCoord1d", {returns = t_void, args = {t_uint, t_double}})
    gl.MultiTexCoord1dv = load("glMultiTexCoord1dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord1f = load("glMultiTexCoord1f", {returns = t_void, args = {t_uint, t_float}})
    gl.MultiTexCoord1fv = load("glMultiTexCoord1fv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord1i = load("glMultiTexCoord1i", {returns = t_void, args = {t_uint, t_int}})
    gl.MultiTexCoord1iv = load("glMultiTexCoord1iv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord1s = load("glMultiTexCoord1s", {returns = t_void, args = {t_uint, t_short}})
    gl.MultiTexCoord1sv = load("glMultiTexCoord1sv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord2d = load("glMultiTexCoord2d", {returns = t_void, args = {t_uint, t_double, t_double}})
    gl.MultiTexCoord2dv = load("glMultiTexCoord2dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord2f = load("glMultiTexCoord2f", {returns = t_void, args = {t_uint, t_float, t_float}})
    gl.MultiTexCoord2fv = load("glMultiTexCoord2fv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord2i = load("glMultiTexCoord2i", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.MultiTexCoord2iv = load("glMultiTexCoord2iv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord2s = load("glMultiTexCoord2s", {returns = t_void, args = {t_uint, t_short, t_short}})
    gl.MultiTexCoord2sv = load("glMultiTexCoord2sv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord3d = load("glMultiTexCoord3d", {returns = t_void, args = {t_uint, t_double, t_double, t_double}})
    gl.MultiTexCoord3dv = load("glMultiTexCoord3dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord3f = load("glMultiTexCoord3f", {returns = t_void, args = {t_uint, t_float, t_float, t_float}})
    gl.MultiTexCoord3fv = load("glMultiTexCoord3fv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord3i = load("glMultiTexCoord3i", {returns = t_void, args = {t_uint, t_int, t_int, t_int}})
    gl.MultiTexCoord3iv = load("glMultiTexCoord3iv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord3s = load("glMultiTexCoord3s", {returns = t_void, args = {t_uint, t_short, t_short, t_short}})
    gl.MultiTexCoord3sv = load("glMultiTexCoord3sv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord4d = load("glMultiTexCoord4d", {returns = t_void, args = {t_uint, t_double, t_double, t_double, t_double}})
    gl.MultiTexCoord4dv = load("glMultiTexCoord4dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord4f = load("glMultiTexCoord4f", {returns = t_void, args = {t_uint, t_float, t_float, t_float, t_float}})
    gl.MultiTexCoord4fv = load("glMultiTexCoord4fv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord4i = load("glMultiTexCoord4i", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.MultiTexCoord4iv = load("glMultiTexCoord4iv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoord4s = load("glMultiTexCoord4s", {returns = t_void, args = {t_uint, t_short, t_short, t_short, t_short}})
    gl.MultiTexCoord4sv = load("glMultiTexCoord4sv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.LoadTransposeMatrixf = load("glLoadTransposeMatrixf", {returns = t_void, args = {t_voidptr}})
    gl.LoadTransposeMatrixd = load("glLoadTransposeMatrixd", {returns = t_void, args = {t_voidptr}})
    gl.MultTransposeMatrixf = load("glMultTransposeMatrixf", {returns = t_void, args = {t_voidptr}})
    gl.MultTransposeMatrixd = load("glMultTransposeMatrixd", {returns = t_void, args = {t_voidptr}})
end

function loaders.loadGL_1_4(load: getProcFunction)
    gl.BlendFuncSeparate = load("glBlendFuncSeparate", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint}})
    gl.MultiDrawArrays = load("glMultiDrawArrays", {returns = t_void, args = {t_uint, t_voidptr, t_voidptr, t_int}})
    gl.MultiDrawElements = load("glMultiDrawElements", {returns = t_void, args = {t_uint, t_voidptr, t_uint, t_voidptr, t_int}})
    gl.PointParameterf = load("glPointParameterf", {returns = t_void, args = {t_uint, t_float}})
    gl.PointParameterfv = load("glPointParameterfv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.PointParameteri = load("glPointParameteri", {returns = t_void, args = {t_uint, t_int}})
    gl.PointParameteriv = load("glPointParameteriv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.FogCoordf = load("glFogCoordf", {returns = t_void, args = {t_float}})
    gl.FogCoordfv = load("glFogCoordfv", {returns = t_void, args = {t_voidptr}})
    gl.FogCoordd = load("glFogCoordd", {returns = t_void, args = {t_double}})
    gl.FogCoorddv = load("glFogCoorddv", {returns = t_void, args = {t_voidptr}})
    gl.FogCoordPointer = load("glFogCoordPointer", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.SecondaryColor3b = load("glSecondaryColor3b", {returns = t_void, args = {t_schar, t_schar, t_schar}})
    gl.SecondaryColor3bv = load("glSecondaryColor3bv", {returns = t_void, args = {t_voidptr}})
    gl.SecondaryColor3d = load("glSecondaryColor3d", {returns = t_void, args = {t_double, t_double, t_double}})
    gl.SecondaryColor3dv = load("glSecondaryColor3dv", {returns = t_void, args = {t_voidptr}})
    gl.SecondaryColor3f = load("glSecondaryColor3f", {returns = t_void, args = {t_float, t_float, t_float}})
    gl.SecondaryColor3fv = load("glSecondaryColor3fv", {returns = t_void, args = {t_voidptr}})
    gl.SecondaryColor3i = load("glSecondaryColor3i", {returns = t_void, args = {t_int, t_int, t_int}})
    gl.SecondaryColor3iv = load("glSecondaryColor3iv", {returns = t_void, args = {t_voidptr}})
    gl.SecondaryColor3s = load("glSecondaryColor3s", {returns = t_void, args = {t_short, t_short, t_short}})
    gl.SecondaryColor3sv = load("glSecondaryColor3sv", {returns = t_void, args = {t_voidptr}})
    gl.SecondaryColor3ub = load("glSecondaryColor3ub", {returns = t_void, args = {t_uchar, t_uchar, t_uchar}})
    gl.SecondaryColor3ubv = load("glSecondaryColor3ubv", {returns = t_void, args = {t_voidptr}})
    gl.SecondaryColor3ui = load("glSecondaryColor3ui", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.SecondaryColor3uiv = load("glSecondaryColor3uiv", {returns = t_void, args = {t_voidptr}})
    gl.SecondaryColor3us = load("glSecondaryColor3us", {returns = t_void, args = {t_ushort, t_ushort, t_ushort}})
    gl.SecondaryColor3usv = load("glSecondaryColor3usv", {returns = t_void, args = {t_voidptr}})
    gl.SecondaryColorPointer = load("glSecondaryColorPointer", {returns = t_void, args = {t_int, t_uint, t_int, t_voidptr}})
    gl.WindowPos2d = load("glWindowPos2d", {returns = t_void, args = {t_double, t_double}})
    gl.WindowPos2dv = load("glWindowPos2dv", {returns = t_void, args = {t_voidptr}})
    gl.WindowPos2f = load("glWindowPos2f", {returns = t_void, args = {t_float, t_float}})
    gl.WindowPos2fv = load("glWindowPos2fv", {returns = t_void, args = {t_voidptr}})
    gl.WindowPos2i = load("glWindowPos2i", {returns = t_void, args = {t_int, t_int}})
    gl.WindowPos2iv = load("glWindowPos2iv", {returns = t_void, args = {t_voidptr}})
    gl.WindowPos2s = load("glWindowPos2s", {returns = t_void, args = {t_short, t_short}})
    gl.WindowPos2sv = load("glWindowPos2sv", {returns = t_void, args = {t_voidptr}})
    gl.WindowPos3d = load("glWindowPos3d", {returns = t_void, args = {t_double, t_double, t_double}})
    gl.WindowPos3dv = load("glWindowPos3dv", {returns = t_void, args = {t_voidptr}})
    gl.WindowPos3f = load("glWindowPos3f", {returns = t_void, args = {t_float, t_float, t_float}})
    gl.WindowPos3fv = load("glWindowPos3fv", {returns = t_void, args = {t_voidptr}})
    gl.WindowPos3i = load("glWindowPos3i", {returns = t_void, args = {t_int, t_int, t_int}})
    gl.WindowPos3iv = load("glWindowPos3iv", {returns = t_void, args = {t_voidptr}})
    gl.WindowPos3s = load("glWindowPos3s", {returns = t_void, args = {t_short, t_short, t_short}})
    gl.WindowPos3sv = load("glWindowPos3sv", {returns = t_void, args = {t_voidptr}})
    gl.BlendColor = load("glBlendColor", {returns = t_void, args = {t_float, t_float, t_float, t_float}})
    gl.BlendEquation = load("glBlendEquation", {returns = t_void, args = {t_uint}})
end

function loaders.loadGL_1_5(load: getProcFunction)
    gl.GenQueries = load("glGenQueries", {returns = t_void, args = {t_int, t_voidptr}})
    gl.DeleteQueries = load("glDeleteQueries", {returns = t_void, args = {t_int, t_voidptr}})
    gl.IsQuery = load("glIsQuery", {returns = t_uchar, args = {t_uint}})
    gl.BeginQuery = load("glBeginQuery", {returns = t_void, args = {t_uint, t_uint}})
    gl.EndQuery = load("glEndQuery", {returns = t_void, args = {t_uint}})
    gl.GetQueryiv = load("glGetQueryiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetQueryObjectiv = load("glGetQueryObjectiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetQueryObjectuiv = load("glGetQueryObjectuiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.BindBuffer = load("glBindBuffer", {returns = t_void, args = {t_uint, t_uint}})
    gl.DeleteBuffers = load("glDeleteBuffers", {returns = t_void, args = {t_int, t_voidptr}})
    gl.GenBuffers = load("glGenBuffers", {returns = t_void, args = {t_int, t_voidptr}})
    gl.IsBuffer = load("glIsBuffer", {returns = t_uchar, args = {t_uint}})
    gl.BufferData = load("glBufferData", {returns = t_void, args = {t_uint, t_int, t_voidptr, t_uint}})
    gl.BufferSubData = load("glBufferSubData", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.GetBufferSubData = load("glGetBufferSubData", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.MapBuffer = load("glMapBuffer", {returns = t_voidptr, args = {t_uint, t_uint}})
    gl.UnmapBuffer = load("glUnmapBuffer", {returns = t_uchar, args = {t_uint}})
    gl.GetBufferParameteriv = load("glGetBufferParameteriv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetBufferPointerv = load("glGetBufferPointerv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
end

function loaders.loadGL_2_0(load: getProcFunction)
    gl.BlendEquationSeparate = load("glBlendEquationSeparate", {returns = t_void, args = {t_uint, t_uint}})
    gl.DrawBuffers = load("glDrawBuffers", {returns = t_void, args = {t_int, t_voidptr}})
    gl.StencilOpSeparate = load("glStencilOpSeparate", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint}})
    gl.StencilFuncSeparate = load("glStencilFuncSeparate", {returns = t_void, args = {t_uint, t_uint, t_int, t_uint}})
    gl.StencilMaskSeparate = load("glStencilMaskSeparate", {returns = t_void, args = {t_uint}})
    gl.AttachShader = load("glAttachShader", {returns = t_void, args = {t_uint, t_uint}})
    gl.BindAttribLocation = load("glBindAttribLocation", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.CompileShader = load("glCompileShader", {returns = t_void, args = {t_uint}})
    gl.CreateProgram = load("glCreateProgram", {returns = t_uint, args = {}})
    gl.CreateShader = load("glCreateShader", {returns = t_uint, args = {t_uint}})
    gl.DeleteProgram = load("glDeleteProgram", {returns = t_void, args = {t_uint}})
    gl.DeleteShader = load("glDeleteShader", {returns = t_void, args = {t_uint}})
    gl.DetachShader = load("glDetachShader", {returns = t_void, args = {t_uint, t_uint}})
    gl.DisableVertexAttribArray = load("glDisableVertexAttribArray", {returns = t_void, args = {t_uint}})
    gl.EnableVertexAttribArray = load("glEnableVertexAttribArray", {returns = t_void, args = {t_uint}})
    gl.GetActiveAttrib = load("glGetActiveAttrib", {returns = t_void, args = {t_uint, t_voidptr, t_int, t_voidptr, t_voidptr, t_voidptr, t_voidptr}})
    gl.GetActiveUniform = load("glGetActiveUniform", {returns = t_void, args = {t_uint, t_voidptr, t_int, t_voidptr, t_voidptr, t_voidptr, t_voidptr}})
    gl.GetAttachedShaders = load("glGetAttachedShaders", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetAttribLocation = load("glGetAttribLocation", {returns = t_int, args = {t_uint, t_voidptr}})
    gl.GetProgramiv = load("glGetProgramiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetProgramInfoLog = load("glGetProgramInfoLog", {returns = t_void, args = {t_uint, t_int, t_voidptr, t_voidptr}})
    gl.GetShaderiv = load("glGetShaderiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetShaderInfoLog = load("glGetShaderInfoLog", {returns = t_void, args = {t_uint, t_int, t_voidptr, t_voidptr}})
    gl.GetShaderSource = load("glGetShaderSource", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetUniformLocation = load("glGetUniformLocation", {returns = t_int, args = {t_uint, t_voidptr}})
    gl.GetUniformfv = load("glGetUniformfv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetUniformiv = load("glGetUniformiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetVertexAttribdv = load("glGetVertexAttribdv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetVertexAttribfv = load("glGetVertexAttribfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetVertexAttribiv = load("glGetVertexAttribiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetVertexAttribPointerv = load("glGetVertexAttribPointerv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.IsProgram = load("glIsProgram", {returns = t_uchar, args = {t_uint}})
    gl.IsShader = load("glIsShader", {returns = t_uchar, args = {t_uint}})
    gl.LinkProgram = load("glLinkProgram", {returns = t_void, args = {t_uint}})
    gl.ShaderSource = load("glShaderSource", {returns = t_void, args = {t_uint, t_int, t_voidptr, t_voidptr}})
    gl.UseProgram = load("glUseProgram", {returns = t_void, args = {t_uint}})
    gl.Uniform1f = load("glUniform1f", {returns = t_void, args = {t_int, t_float}})
    gl.Uniform2f = load("glUniform2f", {returns = t_void, args = {t_int, t_float, t_float}})
    gl.Uniform3f = load("glUniform3f", {returns = t_void, args = {t_int, t_float, t_float, t_float}})
    gl.Uniform4f = load("glUniform4f", {returns = t_void, args = {t_int, t_float, t_float, t_float, t_float}})
    gl.Uniform1i = load("glUniform1i", {returns = t_void, args = {t_int, t_int}})
    gl.Uniform2i = load("glUniform2i", {returns = t_void, args = {t_int, t_int, t_int}})
    gl.Uniform3i = load("glUniform3i", {returns = t_void, args = {t_int, t_int, t_int, t_int}})
    gl.Uniform4i = load("glUniform4i", {returns = t_void, args = {t_int, t_int, t_int, t_int, t_int}})
    gl.Uniform1fv = load("glUniform1fv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform2fv = load("glUniform2fv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform3fv = load("glUniform3fv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform4fv = load("glUniform4fv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform1iv = load("glUniform1iv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform2iv = load("glUniform2iv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform3iv = load("glUniform3iv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform4iv = load("glUniform4iv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.UniformMatrix2fv = load("glUniformMatrix2fv", {returns = t_void, args = {t_int, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix3fv = load("glUniformMatrix3fv", {returns = t_void, args = {t_int, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix4fv = load("glUniformMatrix4fv", {returns = t_void, args = {t_int, t_int, t_uchar, t_voidptr}})
    gl.ValidateProgram = load("glValidateProgram", {returns = t_void, args = {t_uint}})
    gl.VertexAttrib1d = load("glVertexAttrib1d", {returns = t_void, args = {t_uint, t_double}})
    gl.VertexAttrib1dv = load("glVertexAttrib1dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib1f = load("glVertexAttrib1f", {returns = t_void, args = {t_uint, t_float}})
    gl.VertexAttrib1fv = load("glVertexAttrib1fv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib1s = load("glVertexAttrib1s", {returns = t_void, args = {t_uint, t_short}})
    gl.VertexAttrib1sv = load("glVertexAttrib1sv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib2d = load("glVertexAttrib2d", {returns = t_void, args = {t_uint, t_double, t_double}})
    gl.VertexAttrib2dv = load("glVertexAttrib2dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib2f = load("glVertexAttrib2f", {returns = t_void, args = {t_uint, t_float, t_float}})
    gl.VertexAttrib2fv = load("glVertexAttrib2fv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib2s = load("glVertexAttrib2s", {returns = t_void, args = {t_uint, t_short, t_short}})
    gl.VertexAttrib2sv = load("glVertexAttrib2sv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib3d = load("glVertexAttrib3d", {returns = t_void, args = {t_uint, t_double, t_double, t_double}})
    gl.VertexAttrib3dv = load("glVertexAttrib3dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib3f = load("glVertexAttrib3f", {returns = t_void, args = {t_uint, t_float, t_float, t_float}})
    gl.VertexAttrib3fv = load("glVertexAttrib3fv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib3s = load("glVertexAttrib3s", {returns = t_void, args = {t_uint, t_short, t_short, t_short}})
    gl.VertexAttrib3sv = load("glVertexAttrib3sv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4Nbv = load("glVertexAttrib4Nbv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4Niv = load("glVertexAttrib4Niv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4Nsv = load("glVertexAttrib4Nsv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4Nub = load("glVertexAttrib4Nub", {returns = t_void, args = {t_uint, t_uchar, t_uchar, t_uchar, t_uchar}})
    gl.VertexAttrib4Nubv = load("glVertexAttrib4Nubv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4Nuiv = load("glVertexAttrib4Nuiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4Nusv = load("glVertexAttrib4Nusv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4bv = load("glVertexAttrib4bv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4d = load("glVertexAttrib4d", {returns = t_void, args = {t_uint, t_double, t_double, t_double, t_double}})
    gl.VertexAttrib4dv = load("glVertexAttrib4dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4f = load("glVertexAttrib4f", {returns = t_void, args = {t_uint, t_float, t_float, t_float, t_float}})
    gl.VertexAttrib4fv = load("glVertexAttrib4fv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4s = load("glVertexAttrib4s", {returns = t_void, args = {t_uint, t_short, t_short, t_short, t_short}})
    gl.VertexAttrib4sv = load("glVertexAttrib4sv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4ubv = load("glVertexAttrib4ubv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4uiv = load("glVertexAttrib4uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttrib4usv = load("glVertexAttrib4usv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribPointer = load("glVertexAttribPointer", {returns = t_void, args = {t_uint, t_int, t_uint, t_uchar, t_int, t_voidptr}})
end

function loaders.loadGL_2_1(load: getProcFunction)
    gl.UniformMatrix2x3fv = load("glUniformMatrix2x3fv", {returns = t_void, args = {t_int, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix3x2fv = load("glUniformMatrix3x2fv", {returns = t_void, args = {t_int, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix2x4fv = load("glUniformMatrix2x4fv", {returns = t_void, args = {t_int, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix4x2fv = load("glUniformMatrix4x2fv", {returns = t_void, args = {t_int, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix3x4fv = load("glUniformMatrix3x4fv", {returns = t_void, args = {t_int, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix4x3fv = load("glUniformMatrix4x3fv", {returns = t_void, args = {t_int, t_int, t_uchar, t_voidptr}})
end

function loaders.loadGL_3_0(load: getProcFunction)
    gl.ColorMaski = load("glColorMaski", {returns = t_void, args = {t_uint, t_uchar, t_uchar, t_uchar, t_uchar}})
    gl.GetBooleani_v = load("glGetBooleani_v", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetIntegeri_v = load("glGetIntegeri_v", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.Enablei = load("glEnablei", {returns = t_void, args = {t_uint, t_uint}})
    gl.Disablei = load("glDisablei", {returns = t_void, args = {t_uint, t_uint}})
    gl.IsEnabledi = load("glIsEnabledi", {returns = t_uchar, args = {t_uint, t_uint}})
    gl.BeginTransformFeedback = load("glBeginTransformFeedback", {returns = t_void, args = {t_uint}})
    gl.EndTransformFeedback = load("glEndTransformFeedback", {returns = t_void, args = {}})
    gl.BindBufferRange = load("glBindBufferRange", {returns = t_void, args = {t_uint, t_uint, t_uint, t_int, t_int}})
    gl.BindBufferBase = load("glBindBufferBase", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.TransformFeedbackVaryings = load("glTransformFeedbackVaryings", {returns = t_void, args = {t_uint, t_int, t_voidptr, t_uint}})
    gl.GetTransformFeedbackVarying = load("glGetTransformFeedbackVarying", {returns = t_void, args = {t_uint, t_uint, t_int, t_voidptr, t_voidptr, t_voidptr, t_voidptr}})
    gl.ClampColor = load("glClampColor", {returns = t_void, args = {t_uint, t_uint}})
    gl.BeginConditionalRender = load("glBeginConditionalRender", {returns = t_void, args = {t_uint, t_uint}})
    gl.EndConditionalRender = load("glEndConditionalRender", {returns = t_void, args = {}})
    gl.VertexAttribIPointer = load("glVertexAttribIPointer", {returns = t_void, args = {t_uint, t_int, t_uint, t_int, t_voidptr}})
    gl.GetVertexAttribIiv = load("glGetVertexAttribIiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetVertexAttribIuiv = load("glGetVertexAttribIuiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.VertexAttribI1i = load("glVertexAttribI1i", {returns = t_void, args = {t_uint, t_int}})
    gl.VertexAttribI2i = load("glVertexAttribI2i", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.VertexAttribI3i = load("glVertexAttribI3i", {returns = t_void, args = {t_uint, t_int, t_int, t_int}})
    gl.VertexAttribI4i = load("glVertexAttribI4i", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.VertexAttribI1ui = load("glVertexAttribI1ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.VertexAttribI2ui = load("glVertexAttribI2ui", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.VertexAttribI3ui = load("glVertexAttribI3ui", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint}})
    gl.VertexAttribI4ui = load("glVertexAttribI4ui", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint, t_uint}})
    gl.VertexAttribI1iv = load("glVertexAttribI1iv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI2iv = load("glVertexAttribI2iv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI3iv = load("glVertexAttribI3iv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI4iv = load("glVertexAttribI4iv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI1uiv = load("glVertexAttribI1uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI2uiv = load("glVertexAttribI2uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI3uiv = load("glVertexAttribI3uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI4uiv = load("glVertexAttribI4uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI4bv = load("glVertexAttribI4bv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI4sv = load("glVertexAttribI4sv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI4ubv = load("glVertexAttribI4ubv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribI4usv = load("glVertexAttribI4usv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetUniformuiv = load("glGetUniformuiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.BindFragDataLocation = load("glBindFragDataLocation", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetFragDataLocation = load("glGetFragDataLocation", {returns = t_int, args = {t_uint, t_voidptr}})
    gl.Uniform1ui = load("glUniform1ui", {returns = t_void, args = {t_int, t_uint}})
    gl.Uniform2ui = load("glUniform2ui", {returns = t_void, args = {t_int, t_uint, t_uint}})
    gl.Uniform3ui = load("glUniform3ui", {returns = t_void, args = {t_int, t_uint, t_uint, t_uint}})
    gl.Uniform4ui = load("glUniform4ui", {returns = t_void, args = {t_int, t_uint, t_uint, t_uint, t_uint}})
    gl.Uniform1uiv = load("glUniform1uiv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform2uiv = load("glUniform2uiv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform3uiv = load("glUniform3uiv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.Uniform4uiv = load("glUniform4uiv", {returns = t_void, args = {t_int, t_int, t_voidptr}})
    gl.TexParameterIiv = load("glTexParameterIiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.TexParameterIuiv = load("glTexParameterIuiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetTexParameterIiv = load("glGetTexParameterIiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetTexParameterIuiv = load("glGetTexParameterIuiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.ClearBufferiv = load("glClearBufferiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.ClearBufferuiv = load("glClearBufferuiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.ClearBufferfv = load("glClearBufferfv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.ClearBufferfi = load("glClearBufferfi", {returns = t_void, args = {t_uint, t_int, t_float, t_int}})
    gl.GetStringi = load("glGetStringi", {returns = t_voidptr, args = {t_uint, t_uint}})
    gl.IsRenderbuffer = load("glIsRenderbuffer", {returns = t_uchar, args = {t_uint}})
    gl.BindRenderbuffer = load("glBindRenderbuffer", {returns = t_void, args = {t_uint, t_uint}})
    gl.DeleteRenderbuffers = load("glDeleteRenderbuffers", {returns = t_void, args = {t_int, t_voidptr}})
    gl.GenRenderbuffers = load("glGenRenderbuffers", {returns = t_void, args = {t_int, t_voidptr}})
    gl.RenderbufferStorage = load("glRenderbufferStorage", {returns = t_void, args = {t_uint, t_uint, t_int, t_int}})
    gl.GetRenderbufferParameteriv = load("glGetRenderbufferParameteriv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.IsFramebuffer = load("glIsFramebuffer", {returns = t_uchar, args = {t_uint}})
    gl.BindFramebuffer = load("glBindFramebuffer", {returns = t_void, args = {t_uint, t_uint}})
    gl.DeleteFramebuffers = load("glDeleteFramebuffers", {returns = t_void, args = {t_int, t_voidptr}})
    gl.GenFramebuffers = load("glGenFramebuffers", {returns = t_void, args = {t_int, t_voidptr}})
    gl.CheckFramebufferStatus = load("glCheckFramebufferStatus", {returns = t_uint, args = {t_uint}})
    gl.FramebufferTexture1D = load("glFramebufferTexture1D", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint, t_int}})
    gl.FramebufferTexture2D = load("glFramebufferTexture2D", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint, t_int}})
    gl.FramebufferTexture3D = load("glFramebufferTexture3D", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint, t_int, t_int}})
    gl.FramebufferRenderbuffer = load("glFramebufferRenderbuffer", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint}})
    gl.GetFramebufferAttachmentParameteriv = load("glGetFramebufferAttachmentParameteriv", {returns = t_void, args = {t_uint, t_uint, t_uint, t_voidptr}})
    gl.GenerateMipmap = load("glGenerateMipmap", {returns = t_void, args = {t_uint}})
    gl.BlitFramebuffer = load("glBlitFramebuffer", {returns = t_void, args = {t_int, t_int, t_int, t_int, t_int, t_int, t_int, t_int, t_uint, t_uint}})
    gl.RenderbufferStorageMultisample = load("glRenderbufferStorageMultisample", {returns = t_void, args = {t_uint, t_int, t_uint, t_int, t_int}})
    gl.FramebufferTextureLayer = load("glFramebufferTextureLayer", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint, t_int}})
    gl.MapBufferRange = load("glMapBufferRange", {returns = t_voidptr, args = {t_uint, t_int, t_int, t_uint}})
    gl.FlushMappedBufferRange = load("glFlushMappedBufferRange", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.BindVertexArray = load("glBindVertexArray", {returns = t_void, args = {t_uint}})
    gl.DeleteVertexArrays = load("glDeleteVertexArrays", {returns = t_void, args = {t_int, t_voidptr}})
    gl.GenVertexArrays = load("glGenVertexArrays", {returns = t_void, args = {t_int, t_voidptr}})
    gl.IsVertexArray = load("glIsVertexArray", {returns = t_uchar, args = {t_uint}})
end

function loaders.loadGL_3_1(load: getProcFunction)
    gl.DrawArraysInstanced = load("glDrawArraysInstanced", {returns = t_void, args = {t_uint, t_int, t_int, t_int}})
    gl.DrawElementsInstanced = load("glDrawElementsInstanced", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr, t_int}})
    gl.TexBuffer = load("glTexBuffer", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.PrimitiveRestartIndex = load("glPrimitiveRestartIndex", {returns = t_void, args = {t_uint}})
    gl.CopyBufferSubData = load("glCopyBufferSubData", {returns = t_void, args = {t_uint, t_uint, t_int, t_int, t_int}})
    gl.GetUniformIndices = load("glGetUniformIndices", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetActiveUniformsiv = load("glGetActiveUniformsiv", {returns = t_void, args = {t_uint, t_int, t_voidptr, t_uint, t_voidptr}})
    gl.GetActiveUniformName = load("glGetActiveUniformName", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.GetUniformBlockIndex = load("glGetUniformBlockIndex", {returns = t_int, args = {t_uint, t_voidptr}})
    gl.GetActiveUniformBlockiv = load("glGetActiveUniformBlockiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetActiveUniformBlockName = load("glGetActiveUniformBlockName", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.UniformBlockBinding = load("glUniformBlockBinding", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.BindBufferRange = load("glBindBufferRange", {returns = t_void, args = {t_uint, t_uint, t_uint, t_int, t_int}})
    gl.BindBufferBase = load("glBindBufferBase", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.GetIntegeri_v = load("glGetIntegeri_v", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
end

function loaders.loadGL_3_2(load: getProcFunction)
    gl.DrawElementsBaseVertex = load("glDrawElementsBaseVertex", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr, t_int}})
    gl.DrawRangeElementsBaseVertex = load("glDrawRangeElementsBaseVertex", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_voidptr, t_int}})
    gl.DrawElementsInstancedBaseVertex = load("glDrawElementsInstancedBaseVertex", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr, t_int}})
    gl.MultiDrawElementsBaseVertex = load("glMultiDrawElementsBaseVertex", {returns = t_void, args = {t_uint, t_voidptr, t_int, t_int, t_voidptr}})
    gl.ProvokingVertex = load("glProvokingVertex", {returns = t_void, args = {t_uint}})
    gl.FenceSync = load("glFenceSync", {returns = t_voidptr, args = {t_uint, t_int}})
    gl.IsSync = load("glIsSync", {returns = t_uchar, args = {t_voidptr}})
    gl.DeleteSync = load("glDeleteSync", {returns = t_void, args = {t_voidptr}})
    gl.ClientWaitSync = load("glClientWaitSync", {returns = t_uint, args = {t_voidptr, t_uint, t_uint}})
    gl.WaitSync = load("glWaitSync", {returns = t_void, args = {t_voidptr, t_uint, t_ulong}})
    gl.GetInteger64v = load("glGetInteger64v", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetSynciv = load("glGetSynciv", {returns = t_void, args = {t_voidptr, t_int, t_int, t_voidptr}})
    gl.GetInteger64i_v = load("glGetInteger64i_v", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetBufferParameteri64v = load("glGetBufferParameteri64v", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.FramebufferTexture = load("glFramebufferTexture", {returns = t_void, args = {t_uint, t_uint, t_uint, t_int}})
    gl.TexImage2DMultisample = load("glTexImage2DMultisample", {returns = t_void, args = {t_uint, t_int, t_uint, t_int, t_int, t_uchar}})
    gl.TexImage3DMultisample = load("glTexImage3DMultisample", {returns = t_void, args = {t_uint, t_int, t_uint, t_int, t_int, t_int, t_uchar}})
    gl.GetMultisamplefv = load("glGetMultisamplefv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.SampleMaski = load("glSampleMaski", {returns = t_void, args = {t_uint, t_uchar}})
end

function loaders.loadGL_3_3(load: getProcFunction)
    gl.BindFragDataLocationIndexed = load("glBindFragDataLocationIndexed", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetFragDataIndex = load("glGetFragDataIndex", {returns = t_int, args = {t_uint, t_voidptr}})
    gl.GenSamplers = load("glGenSamplers", {returns = t_void, args = {t_int, t_voidptr}})
    gl.DeleteSamplers = load("glDeleteSamplers", {returns = t_void, args = {t_int, t_voidptr}})
    gl.IsSampler = load("glIsSampler", {returns = t_uchar, args = {t_uint}})
    gl.BindSampler = load("glBindSampler", {returns = t_void, args = {t_uint, t_uint}})
    gl.SamplerParameteri = load("glSamplerParameteri", {returns = t_void, args = {t_uint, t_uint, t_int}})
    gl.SamplerParameteriv = load("glSamplerParameteriv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.SamplerParameterf = load("glSamplerParameterf", {returns = t_void, args = {t_uint, t_uint, t_float}})
    gl.SamplerParameterfv = load("glSamplerParameterfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.SamplerParameterIiv = load("glSamplerParameterIiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.SamplerParameterIuiv = load("glSamplerParameterIuiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetSamplerParameteriv = load("glGetSamplerParameteriv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetSamplerParameterIiv = load("glGetSamplerParameterIiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetSamplerParameterfv = load("glGetSamplerParameterfv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetSamplerParameterIuiv = load("glGetSamplerParameterIuiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.QueryCounter = load("glQueryCounter", {returns = t_void, args = {t_uint, t_uint}})
    gl.GetQueryObjecti64v = load("glGetQueryObjecti64v", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetQueryObjectui64v = load("glGetQueryObjectui64v", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.VertexAttribDivisor = load("glVertexAttribDivisor", {returns = t_void, args = {t_uint, t_uint}})
    gl.VertexAttribP1ui = load("glVertexAttribP1ui", {returns = t_void, args = {t_uint, t_uint, t_uchar, t_voidptr}})
    gl.VertexAttribP1uiv = load("glVertexAttribP1uiv", {returns = t_void, args = {t_uint, t_uint, t_uchar, t_voidptr}})
    gl.VertexAttribP2ui = load("glVertexAttribP2ui", {returns = t_void, args = {t_uint, t_uint, t_uchar, t_voidptr}})
    gl.VertexAttribP2uiv = load("glVertexAttribP2uiv", {returns = t_void, args = {t_uint, t_uint, t_uchar, t_voidptr}})
    gl.VertexAttribP3ui = load("glVertexAttribP3ui", {returns = t_void, args = {t_uint, t_uint, t_uchar, t_voidptr}})
    gl.VertexAttribP3uiv = load("glVertexAttribP3uiv", {returns = t_void, args = {t_uint, t_uint, t_uchar, t_voidptr}})
    gl.VertexAttribP4ui = load("glVertexAttribP4ui", {returns = t_void, args = {t_uint, t_uint, t_uchar, t_voidptr}})
    gl.VertexAttribP4uiv = load("glVertexAttribP4uiv", {returns = t_void, args = {t_uint, t_uint, t_uchar, t_voidptr}})
    gl.VertexP2ui = load("glVertexP2ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.VertexP2uiv = load("glVertexP2uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexP3ui = load("glVertexP3ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.VertexP3uiv = load("glVertexP3uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexP4ui = load("glVertexP4ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.VertexP4uiv = load("glVertexP4uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.TexCoordP1ui = load("glTexCoordP1ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.TexCoordP1uiv = load("glTexCoordP1uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.TexCoordP2ui = load("glTexCoordP2ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.TexCoordP2uiv = load("glTexCoordP2uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.TexCoordP3ui = load("glTexCoordP3ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.TexCoordP3uiv = load("glTexCoordP3uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.TexCoordP4ui = load("glTexCoordP4ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.TexCoordP4uiv = load("glTexCoordP4uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoordP1ui = load("glMultiTexCoordP1ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.MultiTexCoordP1uiv = load("glMultiTexCoordP1uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoordP2ui = load("glMultiTexCoordP2ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.MultiTexCoordP2uiv = load("glMultiTexCoordP2uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoordP3ui = load("glMultiTexCoordP3ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.MultiTexCoordP3uiv = load("glMultiTexCoordP3uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.MultiTexCoordP4ui = load("glMultiTexCoordP4ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.MultiTexCoordP4uiv = load("glMultiTexCoordP4uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.NormalP3ui = load("glNormalP3ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.NormalP3uiv = load("glNormalP3uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.ColorP3ui = load("glColorP3ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.ColorP3uiv = load("glColorP3uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.ColorP4ui = load("glColorP4ui", {returns = t_void, args = {t_uint, t_uint}})
    gl.ColorP4uiv = load("glColorP4uiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.SecondaryColorP3ui = load("glSecondaryColorP3ui", {returns = t_void, args = {t_uint, t_uint}})
end

function loaders.loadGL_4_0(load: getProcFunction)
    gl.MinSampleShading = load("glMinSampleShading", {returns = t_void, args = {t_float}})
    gl.BlendEquationi = load("glBlendEquationi", {returns = t_void, args = {t_uint, t_uint}})
    gl.BlendEquationSeparatei = load("glBlendEquationSeparatei", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.BlendFunci = load("glBlendFunci", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.BlendFuncSeparatei = load("glBlendFuncSeparatei", {returns = t_void, args = {t_uint, t_uint, t_uint, t_uint}})
    gl.DrawArraysIndirect = load("glDrawArraysIndirect", {returns = t_void, args = {t_voidptr}})
    gl.DrawElementsIndirect = load("glDrawElementsIndirect", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.Uniform1d = load("glUniform1d", {returns = t_void, args = {t_uint, t_double}})
    gl.Uniform2d = load("glUniform2d", {returns = t_void, args = {t_uint, t_double, t_double}})
    gl.Uniform3d = load("glUniform3d", {returns = t_void, args = {t_uint, t_double, t_double, t_double}})
    gl.Uniform4d = load("glUniform4d", {returns = t_void, args = {t_uint, t_double, t_double, t_double, t_double}})
    gl.Uniform1dv = load("glUniform1dv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.Uniform2dv = load("glUniform2dv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.Uniform3dv = load("glUniform3dv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.Uniform4dv = load("glUniform4dv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.UniformMatrix2dv = load("glUniformMatrix2dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix3dv = load("glUniformMatrix3dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix4dv = load("glUniformMatrix4dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix2x3dv = load("glUniformMatrix2x3dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix2x4dv = load("glUniformMatrix2x4dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix3x2dv = load("glUniformMatrix3x2dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix3x4dv = load("glUniformMatrix3x4dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix4x2dv = load("glUniformMatrix4x2dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.UniformMatrix4x3dv = load("glUniformMatrix4x3dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.GetUniformdv = load("glGetUniformdv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetSubroutineUniformLocation = load("glGetSubroutineUniformLocation", {returns = t_int, args = {t_uint, t_voidptr}})
    gl.GetSubroutineIndex = load("glGetSubroutineIndex", {returns = t_uint, args = {t_uint, t_voidptr}})
    gl.GetActiveSubroutineUniformiv = load("glGetActiveSubroutineUniformiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetActiveSubroutineUniformName = load("glGetActiveSubroutineUniformName", {returns = t_void, args = {t_uint, t_uint, t_int, t_voidptr, t_voidptr}})
    gl.GetActiveSubroutineName = load("glGetActiveSubroutineName", {returns = t_void, args = {t_uint, t_uint, t_int, t_voidptr, t_voidptr}})
    gl.UniformSubroutinesuiv = load("glUniformSubroutinesuiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetUniformSubroutineuiv = load("glGetUniformSubroutineuiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetProgramStageiv = load("glGetProgramStageiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.PatchParameteri = load("glPatchParameteri", {returns = t_void, args = {t_uint, t_int}})
    gl.PatchParameterfv = load("glPatchParameterfv", {returns = t_void, args = {t_voidptr}})
    gl.BindTransformFeedback = load("glBindTransformFeedback", {returns = t_void, args = {t_uint, t_uint}})
    gl.DeleteTransformFeedbacks = load("glDeleteTransformFeedbacks", {returns = t_void, args = {t_int, t_voidptr}})
    gl.GenTransformFeedbacks = load("glGenTransformFeedbacks", {returns = t_void, args = {t_int, t_voidptr}})
    gl.IsTransformFeedback = load("glIsTransformFeedback", {returns = t_uchar, args = {t_uint}})
    gl.PauseTransformFeedback = load("glPauseTransformFeedback", {returns = t_void, args = {}})
    gl.ResumeTransformFeedback = load("glResumeTransformFeedback", {returns = t_void, args = {}})
    gl.DrawTransformFeedback = load("glDrawTransformFeedback", {returns = t_void, args = {t_uint, t_uint}})
    gl.DrawTransformFeedbackStream = load("glDrawTransformFeedbackStream", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.BeginQueryIndexed = load("glBeginQueryIndexed", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.EndQueryIndexed = load("glEndQueryIndexed", {returns = t_void, args = {t_uint, t_uint}})
    gl.GetQueryIndexediv = load("glGetQueryIndexediv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
end

function loaders.loadGL_4_1(load: getProcFunction)
    gl.ReleaseShaderCompiler = load("glReleaseShaderCompiler", {returns = t_void, args = {}})
    gl.ShaderBinary = load("glShaderBinary", {returns = t_void, args = {t_int, t_voidptr, t_uint, t_voidptr}})
    gl.GetShaderPrecisionFormat = load("glGetShaderPrecisionFormat", {returns = t_void, args = {t_uint, t_uint, t_voidptr, t_voidptr}})
    gl.DepthRangef = load("glDepthRangef", {returns = t_void, args = {t_float, t_float}})
    gl.ClearDepthf = load("glClearDepthf", {returns = t_void, args = {t_float}})
    gl.GetProgramBinary = load("glGetProgramBinary", {returns = t_void, args = {t_uint, t_int, t_voidptr, t_voidptr, t_voidptr}})
    gl.ProgramBinary = load("glProgramBinary", {returns = t_void, args = {t_uint, t_uint, t_voidptr, t_int}})
    gl.ProgramParameteri = load("glProgramParameteri", {returns = t_void, args = {t_uint, t_uint, t_int}})
    gl.UseProgramStages = load("glUseProgramStages", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.ActiveShaderProgram = load("glActiveShaderProgram", {returns = t_void, args = {t_uint, t_uint}})
    gl.CreateShaderProgramv = load("glCreateShaderProgramv", {returns = t_uint, args = {t_uint, t_int, t_voidptr}})
    gl.BindProgramPipeline = load("glBindProgramPipeline", {returns = t_void, args = {t_uint}})
    gl.DeleteProgramPipelines = load("glDeleteProgramPipelines", {returns = t_void, args = {t_int, t_voidptr}})
    gl.GenProgramPipelines = load("glGenProgramPipelines", {returns = t_void, args = {t_int, t_voidptr}})
    gl.IsProgramPipeline = load("glIsProgramPipeline", {returns = t_uchar, args = {t_uint}})
    gl.GetProgramPipelineiv = load("glGetProgramPipelineiv", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.ProgramUniform1i = load("glProgramUniform1i", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.ProgramUniform1iv = load("glProgramUniform1iv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform1f = load("glProgramUniform1f", {returns = t_void, args = {t_uint, t_int, t_float}})
    gl.ProgramUniform1fv = load("glProgramUniform1fv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform1d = load("glProgramUniform1d", {returns = t_void, args = {t_uint, t_int, t_double}})
    gl.ProgramUniform1dv = load("glProgramUniform1dv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform1ui = load("glProgramUniform1ui", {returns = t_void, args = {t_uint, t_int, t_uint}})
    gl.ProgramUniform1uiv = load("glProgramUniform1uiv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform2i = load("glProgramUniform2i", {returns = t_void, args = {t_uint, t_int, t_int, t_int}})
    gl.ProgramUniform2iv = load("glProgramUniform2iv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform2f = load("glProgramUniform2f", {returns = t_void, args = {t_uint, t_int, t_float, t_float}})
    gl.ProgramUniform2fv = load("glProgramUniform2fv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform2d = load("glProgramUniform2d", {returns = t_void, args = {t_uint, t_int, t_double, t_double}})
    gl.ProgramUniform2dv = load("glProgramUniform2dv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform2ui = load("glProgramUniform2ui", {returns = t_void, args = {t_uint, t_int, t_uint, t_uint}})
    gl.ProgramUniform2uiv = load("glProgramUniform2uiv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform3i = load("glProgramUniform3i", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.ProgramUniform3iv = load("glProgramUniform3iv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform3f = load("glProgramUniform3f", {returns = t_void, args = {t_uint, t_int, t_float, t_float, t_float}})
    gl.ProgramUniform3fv = load("glProgramUniform3fv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform3d = load("glProgramUniform3d", {returns = t_void, args = {t_uint, t_int, t_double, t_double, t_double}})
    gl.ProgramUniform3dv = load("glProgramUniform3dv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform3ui = load("glProgramUniform3ui", {returns = t_void, args = {t_uint, t_int, t_uint, t_uint, t_uint}})
    gl.ProgramUniform3uiv = load("glProgramUniform3uiv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform4i = load("glProgramUniform4i", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.ProgramUniform4iv = load("glProgramUniform4iv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform4f = load("glProgramUniform4f", {returns = t_void, args = {t_uint, t_int, t_float, t_float, t_float, t_float}})
    gl.ProgramUniform4fv = load("glProgramUniform4fv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform4d = load("glProgramUniform4d", {returns = t_void, args = {t_uint, t_int, t_double, t_double, t_double, t_double}})
    gl.ProgramUniform4dv = load("glProgramUniform4dv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniform4ui = load("glProgramUniform4ui", {returns = t_void, args = {t_uint, t_int, t_uint, t_uint, t_uint}})
    gl.ProgramUniform4uiv = load("glProgramUniform4uiv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniformMatrix2fv = load("glProgramUniformMatrix2fv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniformMatrix3fv = load("glProgramUniformMatrix3fv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniformMatrix4fv = load("glProgramUniformMatrix4fv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniformMatrix2dv = load("glProgramUniformMatrix2dv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniformMatrix3dv = load("glProgramUniformMatrix3dv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniformMatrix4dv = load("glProgramUniformMatrix4dv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ProgramUniformMatrix2x3fv = load("glProgramUniformMatrix2x3fv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix3x2fv = load("glProgramUniformMatrix3x2fv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix2x4fv = load("glProgramUniformMatrix2x4fv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix4x2fv = load("glProgramUniformMatrix4x2fv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix3x4fv = load("glProgramUniformMatrix3x4fv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix4x3fv = load("glProgramUniformMatrix4x3fv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix2x3dv = load("glProgramUniformMatrix2x3dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix3x2dv = load("glProgramUniformMatrix3x2dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix2x4dv = load("glProgramUniformMatrix2x4dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix4x2dv = load("glProgramUniformMatrix4x2dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix3x4dv = load("glProgramUniformMatrix3x4dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ProgramUniformMatrix4x3dv = load("glProgramUniformMatrix4x3dv", {returns = t_void, args = {t_uint, t_int, t_uchar, t_voidptr}})
    gl.ValidateProgramPipeline = load("glValidateProgramPipeline", {returns = t_void, args = {t_uint}})
    gl.GetProgramPipelineInfoLog = load("glGetProgramPipelineInfoLog", {returns = t_void, args = {t_uint, t_int, t_voidptr, t_voidptr}})
    gl.VertexAttribL1d = load("glVertexAttribL1d", {returns = t_void, args = {t_uint, t_double}})
    gl.VertexAttribL2d = load("glVertexAttribL2d", {returns = t_void, args = {t_uint, t_double, t_double}})
    gl.VertexAttribL3d = load("glVertexAttribL3d", {returns = t_void, args = {t_uint, t_double, t_double, t_double}})
    gl.VertexAttribL4d = load("glVertexAttribL4d", {returns = t_void, args = {t_uint, t_double, t_double, t_double, t_double}})
    gl.VertexAttribL1dv = load("glVertexAttribL1dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribL2dv = load("glVertexAttribL2dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribL3dv = load("glVertexAttribL3dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribL4dv = load("glVertexAttribL4dv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.VertexAttribLPointer = load("glVertexAttribLPointer", {returns = t_void, args = {t_uint, t_int, t_uint, t_uint, t_voidptr}})
    gl.GetVertexAttribLdv = load("glGetVertexAttribLdv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.ViewportArrayv = load("glViewportArrayv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.ViewportIndexedf = load("glViewportIndexedf", {returns = t_void, args = {t_uint, t_float, t_float, t_float, t_float}})
    gl.ViewportIndexedfv = load("glViewportIndexedfv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.ScissorArrayv = load("glScissorArrayv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.ScissorIndexed = load("glScissorIndexed", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.ScissorIndexedv = load("glScissorIndexedv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.DepthRangeArrayv = load("glDepthRangeArrayv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.DepthRangeIndexed = load("glDepthRangeIndexed", {returns = t_void, args = {t_uint, t_double, t_double}})
    gl.GetFloati_v = load("glGetFloati_v", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetDoublei_v = load("glGetDoublei_v", {returns = t_void, args = {t_uint, t_voidptr}})
end

function loaders.loadGL_4_2(load: getProcFunction)
    gl.DrawArraysInstancedBaseInstance = load("glDrawArraysInstancedBaseInstance", {returns = t_void, args = {t_int, t_int, t_int, t_uint}})
    gl.DrawElementsInstancedBaseInstance = load("glDrawElementsInstancedBaseInstance", {returns = t_void, args = {t_uint, t_int, t_uint, t_voidptr, t_uint}})
    gl.DrawElementsInstancedBaseVertexBaseInstance = load("glDrawElementsInstancedBaseVertexBaseInstance", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr, t_uint}})
    gl.GetInternalformativ = load("glGetInternalformativ", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.GetActiveAtomicCounterBufferiv = load("glGetActiveAtomicCounterBufferiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.BindImageTexture = load("glBindImageTexture", {returns = t_void, args = {t_uint, t_uint, t_int, t_uchar, t_int, t_uint, t_uint}})
    gl.MemoryBarrier = load("glMemoryBarrier", {returns = t_void, args = {t_uint}})
    gl.TexStorage1D = load("glTexStorage1D", {returns = t_void, args = {t_uint, t_int, t_int, t_uint}})
    gl.TexStorage2D = load("glTexStorage2D", {returns = t_void, args = {t_uint, t_int, t_int, t_uint}})
    gl.TexStorage3D = load("glTexStorage3D", {returns = t_void, args = {t_uint, t_int, t_int, t_uint}})
    gl.DrawTransformFeedbackInstanced = load("glDrawTransformFeedbackInstanced", {returns = t_void, args = {t_uint, t_uint}})
    gl.DrawTransformFeedbackStreamInstanced = load("glDrawTransformFeedbackStreamInstanced", {returns = t_void, args = {t_uint, t_uint, t_uint}})
end

function loaders.loadGL_4_3(load: getProcFunction)
    gl.ClearBufferData = load("glClearBufferData", {returns = t_void, args = {t_uint, t_int, t_uint, t_voidptr}})
    gl.ClearBufferSubData = load("glClearBufferSubData", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr, t_uint}})
    gl.DispatchCompute = load("glDispatchCompute", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.DispatchComputeIndirect = load("glDispatchComputeIndirect", {returns = t_void, args = {t_voidptr}})
    gl.CopyImageSubData = load("glCopyImageSubData", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_uint, t_uint, t_int, t_int, t_uint, t_uint, t_int, t_int}})
    gl.FramebufferParameteri = load("glFramebufferParameteri", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.GetFramebufferParameteriv = load("glGetFramebufferParameteriv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetInternalformati64v = load("glGetInternalformati64v", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.InvalidateTexSubImage = load("glInvalidateTexSubImage", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.InvalidateTexImage = load("glInvalidateTexImage", {returns = t_void, args = {t_uint, t_int}})
    gl.InvalidateBufferSubData = load("glInvalidateBufferSubData", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.InvalidateBufferData = load("glInvalidateBufferData", {returns = t_void, args = {t_uint}})
    gl.InvalidateFramebuffer = load("glInvalidateFramebuffer", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.InvalidateSubFramebuffer = load("glInvalidateSubFramebuffer", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.MultiDrawArraysIndirect = load("glMultiDrawArraysIndirect", {returns = t_void, args = {t_uint, t_voidptr, t_int, t_uint}})
    gl.MultiDrawElementsIndirect = load("glMultiDrawElementsIndirect", {returns = t_void, args = {t_uint, t_voidptr, t_int, t_uint}})
    gl.GetProgramInterfaceiv = load("glGetProgramInterfaceiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetProgramResourceIndex = load("glGetProgramResourceIndex", {returns = t_int, args = {t_uint, t_int}})
    gl.GetProgramResourceName = load("glGetProgramResourceName", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.GetProgramResourceiv = load("glGetProgramResourceiv", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_voidptr}})
    gl.GetProgramResourceLocation = load("glGetProgramResourceLocation", {returns = t_int, args = {t_uint, t_int}})
    gl.GetProgramResourceLocationIndex = load("glGetProgramResourceLocationIndex", {returns = t_int, args = {t_uint, t_voidptr}})
    gl.ShaderStorageBlockBinding = load("glShaderStorageBlockBinding", {returns = t_void, args = {t_uint, t_int, t_uint}})
    gl.TexBufferRange = load("glTexBufferRange", {returns = t_void, args = {t_uint, t_uint, t_int, t_uint}})
    gl.TexStorage2DMultisample = load("glTexStorage2DMultisample", {returns = t_void, args = {t_uint, t_int, t_int, t_uint, t_uint}})
    gl.TexStorage3DMultisample = load("glTexStorage3DMultisample", {returns = t_void, args = {t_uint, t_int, t_int, t_uint, t_uint}})
    gl.TextureView = load("glTextureView", {returns = t_void, args = {t_uint, t_uint, t_uint, t_int, t_int, t_int, t_int, t_int}})
    gl.BindVertexBuffer = load("glBindVertexBuffer", {returns = t_void, args = {t_uint, t_uint, t_int, t_uint}})
    gl.VertexAttribFormat = load("glVertexAttribFormat", {returns = t_void, args = {t_uint, t_int, t_int, t_uchar, t_uint}})
    gl.VertexAttribIFormat = load("glVertexAttribIFormat", {returns = t_void, args = {t_uint, t_int, t_int, t_uint}})
    gl.VertexAttribLFormat = load("glVertexAttribLFormat", {returns = t_void, args = {t_uint, t_int, t_int, t_uint}})
    gl.VertexAttribBinding = load("glVertexAttribBinding", {returns = t_void, args = {t_uint, t_uint}})
    gl.VertexBindingDivisor = load("glVertexBindingDivisor", {returns = t_void, args = {t_uint, t_uint}})
    gl.DebugMessageControl = load("glDebugMessageControl", {returns = t_void, args = {t_uint, t_uint, t_uchar, t_voidptr}})
    gl.DebugMessageInsert = load("glDebugMessageInsert", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.DebugMessageCallback = load("glDebugMessageCallback", {returns = t_void, args = {t_voidptr, t_voidptr}})
    gl.GetDebugMessageLog = load("glGetDebugMessageLog", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.PushDebugGroup = load("glPushDebugGroup", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.PopDebugGroup = load("glPopDebugGroup", {returns = t_void, args = {}})
    gl.ObjectLabel = load("glObjectLabel", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetObjectLabel = load("glGetObjectLabel", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.ObjectPtrLabel = load("glObjectPtrLabel", {returns = t_void, args = {t_voidptr, t_voidptr}})
    gl.GetObjectPtrLabel = load("glGetObjectPtrLabel", {returns = t_void, args = {t_voidptr, t_voidptr}})
    gl.GetPointerv = load("glGetPointerv", {returns = t_void, args = {t_uint, t_voidptr}})
end

function loaders.loadGL_4_4(load: getProcFunction)
    gl.BufferStorage = load("glBufferStorage", {returns = t_void, args = {t_uint, t_uint, t_voidptr, t_uint}})
    gl.ClearTexImage = load("glClearTexImage", {returns = t_void, args = {t_uint, t_int, t_uint, t_voidptr}})
    gl.ClearTexSubImage = load("glClearTexSubImage", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_int, t_int, t_int}})
    gl.BindBuffersBase = load("glBindBuffersBase", {returns = t_void, args = {t_uint, t_int, t_uint}})
    gl.BindBuffersRange = load("glBindBuffersRange", {returns = t_void, args = {t_uint, t_int, t_uint, t_int}})
    gl.BindTextures = load("glBindTextures", {returns = t_void, args = {t_uint, t_uint}})
    gl.BindSamplers = load("glBindSamplers", {returns = t_void, args = {t_uint, t_uint}})
    gl.BindImageTextures = load("glBindImageTextures", {returns = t_void, args = {t_uint, t_uint}})
    gl.BindVertexBuffers = load("glBindVertexBuffers", {returns = t_void, args = {t_uint, t_uint, t_int, t_uint}})
end

function loaders.loadGL_4_5(load: getProcFunction)
    gl.ClipControl = load("glClipControl", {returns = t_void, args = {t_int, t_int}})
    gl.CreateTransformFeedbacks = load("glCreateTransformFeedbacks", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.TransformFeedbackBufferBase = load("glTransformFeedbackBufferBase", {returns = t_void, args = {t_uint, t_uint}})
    gl.TransformFeedbackBufferRange = load("glTransformFeedbackBufferRange", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.GetTransformFeedbackiv = load("glGetTransformFeedbackiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetTransformFeedbacki_v = load("glGetTransformFeedbacki_v", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetTransformFeedbacki64_v = load("glGetTransformFeedbacki64_v", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.CreateBuffers = load("glCreateBuffers", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.NamedBufferStorage = load("glNamedBufferStorage", {returns = t_void, args = {t_uint, t_ulong, t_voidptr, t_uint}})
    gl.NamedBufferData = load("glNamedBufferData", {returns = t_void, args = {t_uint, t_ulong, t_voidptr, t_uint}})
    gl.NamedBufferSubData = load("glNamedBufferSubData", {returns = t_void, args = {t_uint, t_long, t_ulong, t_voidptr}})
    gl.CopyNamedBufferSubData = load("glCopyNamedBufferSubData", {returns = t_void, args = {t_uint, t_uint, t_long, t_long, t_ulong}})
    gl.ClearNamedBufferData = load("glClearNamedBufferData", {returns = t_void, args = {t_uint, t_int, t_int, t_uint, t_voidptr}})
    gl.ClearNamedBufferSubData = load("glClearNamedBufferSubData", {returns = t_void, args = {t_uint, t_int, t_int, t_uint, t_long, t_ulong, t_voidptr}})
    gl.MapNamedBuffer = load("glMapNamedBuffer", {returns = t_voidptr, args = {t_uint, t_uint}})
    gl.MapNamedBufferRange = load("glMapNamedBufferRange", {returns = t_voidptr, args = {t_uint, t_long, t_ulong, t_uint}})
    gl.UnmapNamedBuffer = load("glUnmapNamedBuffer", {returns = t_int, args = {t_uint}})
    gl.FlushMappedNamedBufferRange = load("glFlushMappedNamedBufferRange", {returns = t_void, args = {t_uint, t_long, t_ulong}})
    gl.GetNamedBufferParameteriv = load("glGetNamedBufferParameteriv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetNamedBufferParameteri64v = load("glGetNamedBufferParameteri64v", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetNamedBufferPointerv = load("glGetNamedBufferPointerv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetNamedBufferSubData = load("glGetNamedBufferSubData", {returns = t_void, args = {t_uint, t_long, t_ulong, t_voidptr}})
    gl.CreateFramebuffers = load("glCreateFramebuffers", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.NamedFramebufferRenderbuffer = load("glNamedFramebufferRenderbuffer", {returns = t_void, args = {t_uint, t_uint, t_int, t_uint}})
    gl.NamedFramebufferParameteri = load("glNamedFramebufferParameteri", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.NamedFramebufferTexture = load("glNamedFramebufferTexture", {returns = t_void, args = {t_uint, t_uint, t_int}})
    gl.NamedFramebufferTextureLayer = load("glNamedFramebufferTextureLayer", {returns = t_void, args = {t_uint, t_uint, t_uint, t_int}})
    gl.NamedFramebufferDrawBuffer = load("glNamedFramebufferDrawBuffer", {returns = t_void, args = {t_uint, t_int}})
    gl.NamedFramebufferDrawBuffers = load("glNamedFramebufferDrawBuffers", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.NamedFramebufferReadBuffer = load("glNamedFramebufferReadBuffer", {returns = t_void, args = {t_uint, t_int}})
    gl.InvalidateNamedFramebufferData = load("glInvalidateNamedFramebufferData", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.InvalidateNamedFramebufferSubData = load("glInvalidateNamedFramebufferSubData", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.ClearNamedFramebufferiv = load("glClearNamedFramebufferiv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.ClearNamedFramebufferuiv = load("glClearNamedFramebufferuiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.ClearNamedFramebufferfv = load("glClearNamedFramebufferfv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.ClearNamedFramebufferfi = load("glClearNamedFramebufferfi", {returns = t_void, args = {t_uint, t_int, t_float, t_float}})
    gl.BlitNamedFramebuffer = load("glBlitNamedFramebuffer", {returns = t_void, args = {t_uint, t_uint, t_int, t_int, t_int, t_int, t_int, t_int, t_int}})
    gl.CheckNamedFramebufferStatus = load("glCheckNamedFramebufferStatus", {returns = t_int, args = {t_uint, t_int}})
    gl.GetNamedFramebufferParameteriv = load("glGetNamedFramebufferParameteriv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetNamedFramebufferAttachmentParameteriv = load("glGetNamedFramebufferAttachmentParameteriv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.CreateRenderbuffers = load("glCreateRenderbuffers", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.NamedRenderbufferStorage = load("glNamedRenderbufferStorage", {returns = t_void, args = {t_uint, t_int, t_uint, t_uint}})
    gl.NamedRenderbufferStorageMultisample = load("glNamedRenderbufferStorageMultisample", {returns = t_void, args = {t_uint, t_int, t_uint, t_uint, t_int}})
    gl.GetNamedRenderbufferParameteriv = load("glGetNamedRenderbufferParameteriv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.CreateTextures = load("glCreateTextures", {returns = t_void, args = {t_int, t_voidptr}})
    gl.TextureBuffer = load("glTextureBuffer", {returns = t_void, args = {t_uint, t_uint, t_uint}})
    gl.TextureBufferRange = load("glTextureBufferRange", {returns = t_void, args = {t_uint, t_uint, t_uint, t_long, t_ulong}})
    gl.TextureStorage1D = load("glTextureStorage1D", {returns = t_void, args = {t_uint, t_int, t_int, t_int}})
    gl.TextureStorage2D = load("glTextureStorage2D", {returns = t_void, args = {t_uint, t_int, t_int, t_int}})
    gl.TextureStorage3D = load("glTextureStorage3D", {returns = t_void, args = {t_uint, t_int, t_int, t_int}})
    gl.TextureStorage2DMultisample = load("glTextureStorage2DMultisample", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.TextureStorage3DMultisample = load("glTextureStorage3DMultisample", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int}})
    gl.TextureSubImage1D = load("glTextureSubImage1D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_voidptr}})
    gl.TextureSubImage2D = load("glTextureSubImage2D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_voidptr}})
    gl.TextureSubImage3D = load("glTextureSubImage3D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_int, t_voidptr}})
    gl.CopyTextureSubImage1D = load("glCopyTextureSubImage1D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int}})
    gl.CopyTextureSubImage2D = load("glCopyTextureSubImage2D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int}})
    gl.CopyTextureSubImage3D = load("glCopyTextureSubImage3D", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int}})
    gl.TextureParameterf = load("glTextureParameterf", {returns = t_void, args = {t_uint, t_int, t_float}})
    gl.TextureParameterfv = load("glTextureParameterfv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.TextureParameteri = load("glTextureParameteri", {returns = t_void, args = {t_uint, t_int, t_int}})
    gl.TextureParameteriv = load("glTextureParameteriv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GenerateTextureMipmap = load("glGenerateTextureMipmap", {returns = t_void, args = {t_uint}})
    gl.BindTextureUnit = load("glBindTextureUnit", {returns = t_void, args = {t_uint, t_uint}})
    gl.GetTextureImage = load("glGetTextureImage", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_voidptr}})
    gl.GetCompressedTextureImage = load("glGetCompressedTextureImage", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.GetTextureLevelParameterfv = load("glGetTextureLevelParameterfv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.GetTextureLevelParameteriv = load("glGetTextureLevelParameteriv", {returns = t_void, args = {t_uint, t_int, t_int, t_voidptr}})
    gl.GetTextureParameterfv = load("glGetTextureParameterfv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetTextureParameteriv = load("glGetTextureParameteriv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.CreateSamplers = load("glCreateSamplers", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.CreateProgramPipelines = load("glCreateProgramPipelines", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.CreateQueries = load("glCreateQueries", {returns = t_void, args = {t_int, t_uint, t_voidptr}})
    gl.GetQueryBufferObjecti64v = load("glGetQueryBufferObjecti64v", {returns = t_void, args = {t_uint, t_uint, t_int, t_voidptr}})
    gl.GetQueryBufferObjectiv = load("glGetQueryBufferObjectiv", {returns = t_void, args = {t_uint, t_uint, t_int, t_voidptr}})
    gl.GetQueryBufferObjectui64v = load("glGetQueryBufferObjectui64v", {returns = t_void, args = {t_uint, t_uint, t_int, t_voidptr}})
    gl.GetQueryBufferObjectuiv = load("glGetQueryBufferObjectuiv", {returns = t_void, args = {t_uint, t_uint, t_int, t_voidptr}})
    gl.MemoryBarrierByRegion = load("glMemoryBarrierByRegion", {returns = t_void, args = {t_uint}})
    gl.GetTextureSubImage = load("glGetTextureSubImage", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_voidptr}})
    gl.GetCompressedTextureSubImage = load("glGetCompressedTextureSubImage", {returns = t_void, args = {t_uint, t_int, t_int, t_int, t_int, t_int, t_voidptr}})
    gl.GetGraphicsResetStatus = load("glGetGraphicsResetStatus", {returns = t_int, args = {}})
    gl.GetnCompressedTexImage = load("glGetnCompressedTexImage", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetnTexImage = load("glGetnTexImage", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetnUniformdv = load("glGetnUniformdv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetnUniformfv = load("glGetnUniformfv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetnUniformiv = load("glGetnUniformiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.GetnUniformuiv = load("glGetnUniformuiv", {returns = t_void, args = {t_uint, t_int, t_voidptr}})
    gl.ReadnPixels = load("glReadnPixels", {returns = t_void, args = {t_int, t_int, t_int, t_int, t_uint, t_voidptr}})
    gl.GetnMapdv = load("glGetnMapdv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetnMapfv = load("glGetnMapfv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetnMapiv = load("glGetnMapiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetnPixelMapfv = load("glGetnPixelMapfv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetnPixelMapuiv = load("glGetnPixelMapuiv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetnPixelMapusv = load("glGetnPixelMapusv", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetnPolygonStipple = load("glGetnPolygonStipple", {returns = t_void, args = {t_voidptr}})
    gl.GetnColorTable = load("glGetnColorTable", {returns = t_void, args = {t_uint, t_voidptr}})
    gl.GetnConvolutionFilter = load("glGetnConvolutionFilter", {returns = t_void, args = {t_uint, t_uint, t_voidptr}})
    gl.GetnSeparableFilter = load("glGetnSeparableFilter", {returns = t_void, args = {t_uint, t_uint, t_voidptr, t_voidptr}})
    gl.GetnHistogram = load("glGetnHistogram", {returns = t_void, args = {t_uint, t_uchar, t_voidptr}})
    gl.GetnMinmax = load("glGetnMinmax", {returns = t_void, args = {t_uint, t_uchar, t_voidptr}})
    gl.TextureBarrier = load("glTextureBarrier", {returns = t_void, args = {}})
end

function loaders.loadGL_4_6(load: getProcFunction)
    gl.SpecializeShader = load("glSpecializeShader", {returns = t_void, args = {t_uint, t_voidptr, t_int, t_voidptr, t_voidptr}})
    gl.MultiDrawArraysIndirectCount = load("glMultiDrawArraysIndirectCount", {returns = t_void, args = {t_uint, t_voidptr, t_int, t_int, t_int}})
    gl.MultiDrawElementsIndirectCount = load("glMultiDrawElementsIndirectCount", {returns = t_void, args = {t_uint, t_voidptr, t_uint, t_voidptr, t_int, t_int}})
    gl.PolygonOffsetClamp = load("glPolygonOffsetClamp", {returns = t_void, args = {t_float, t_float, t_float}})
end

return gl :: gl