project "glfw"
	kind "SharedLib"
	language "C"

	targetname ("%{wks.name}-%{prj.name}")
	targetdir (BinaryOutputDirectory)
	objdir (IntermediateOutputDirectory)

	files {
        "premake5.lua",
        
        "include/GLFW/**.h",
        "src/glfw_config.h",
        
        "src/init.c",
        "src/context.c",
        "src/monitor.c",
        "src/input.c",
        "src/window.c",
        "src/vulkan.c"
	}

    filter "system:windows"
        systemversion "latest"
        staticruntime "On"

        files {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

    defines { 
        "_GLFW_WIN32",
        "_CRT_SECURE_NO_WARNINGS"
    }

    
    filter "system:linux"
        systemversion "latest"
        staticruntime "On"
        pic "On"

        files {
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/linux_joystick.c"
        }

        defines {
            "_GLFW_X11"
        }

	filter "configurations:Debug"
		defines "NEXUS_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "NEXUS_RELEASE"
		runtime "Release"
		optimize "On"
	
	filter "configurations:Distribution"
		defines "NEXUS_DISTRIBUTION"
		runtime "Release"
		optimize "On"
		inlining "Auto"