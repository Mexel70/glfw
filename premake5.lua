project "glfw"
	kind "SharedLib"
    language "C"
    staticruntime "off"

	targetname ("%{wks.name}-%{prj.name}")
	targetdir (BinaryOutputDirectory)
	objdir (IntermediateOutputDirectory)

	files {
        "premake5.lua",
        
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",

        "src/init.c",
        "src/context.c",
        "src/monitor.c",
        "src/window.c",
        "src/input.c",
        "src/vulkan.c"
    }
    
    defines {
        "_GLFW_BUILD_DLL"
    }

    filter "system:windows"
        systemversion "latest"

        files {
            "src/win32_init.c",

            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
            
            "src/win32_monitor.c",
            "src/win32_window.c",
            "src/win32_joystick.c",

            "src/win32_thread.c",
            "src/win32_time.c"
        }

        defines { 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    
    filter "system:linux"
        systemversion "latest"

        files {
            "src/x11_init.c",

            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",

            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/linux_joystick.c",

            "src/posix_thread.c",
            "src/posix_time.c",
            "src/xkb_unicode.c"
        }

        defines {
            "_GLFW_X11"
        }

    filter "system:macosx"
        systemversion "latest"

        files {
            "src/nsgl_context.h",
            "src/egl_context.h",
            "src/osmesa_context.h",

            "src/cocoa_platform.h",
            "src/cocoa_joystick.h",
            "src/posix_thread.h",


            "src/cocoa_init.m",
            "src/egl_context.c",
            "src/nsgl_context.m",
            "src/osmesa_context.c",

            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/cocoa_joystick.m",
            "src/posix_thread.c",
            "src/cocoa_time.c"
        }

        defines {
            "_GLFW_COCOA"
        }

        links {
            "Cocoa"
        }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
	
	filter "configurations:Distribution"
		runtime "Release"
		optimize "On"
		inlining "Auto"