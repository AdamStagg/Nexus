workspace "Nexus"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Nexus/vendor/GLFW/include"
IncludeDir["GLAD"] = "Nexus/vendor/GLAD/include"

include "Nexus/vendor/GLFW"
include "Nexus/vendor/GLAD"

project "Nexus"
	location "Nexus"
	kind "SharedLib"
	language "C++"
	staticruntime "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "nxpch.h"
	pchsource "Nexus/src/nxpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.GLAD}"
	}

	links
	{
		"GLFW",
		"GLAD",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"NX_PLATFORM_WINDOWS",
			"NX_BUILD_DLL",
			"NX_ENABLE_ASSERTS"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
		}

	filter "configurations:Debug"
		defines "NX_DEBUG"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "NX_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		defines "NX_DIST"
		buildoptions "/MD"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Nexus/vendor/spdlog/include",
		"Nexus/src"
	}

	links
	{
		"Nexus"
	}

	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"NX_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "NX_DEBUG"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "NX_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		defines "NX_DIST"
		buildoptions "/MD"
		optimize "On"

		-- workspace "Nexus"
-- 	architecture "x64"
-- 	startproject "Sandbox"

-- 	configurations 
-- 	{
-- 		"Debug",
-- 		"Release",
-- 		"Dist"
-- 	}

-- outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- project "Nexus"
-- 	location "Nexus"
-- 	kind "SharedLib"
-- 	language "C++"

-- 	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
-- 	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

-- 	files
-- 	{
-- 		"%{prj.name}/src/**.h",
-- 		"%{prj.name}/src/**.cpp",
-- 	}

-- 	includedirs
-- 	{
-- 		"%{prj.name}/src",
-- 		"%{prj.name}/vendor/spdlog/include"
-- 	}

-- 	filter "system:windows"
-- 		cppdialect "C++20"
-- 		staticruntime "On"
-- 		systemversion "latest"

-- 		defines
-- 		{
-- 			"NX_PLATFORM_WINDOWS",
-- 			"NX_BUILD_DLL"
-- 		}

-- 		postbuildcommands
-- 		{
-- 			("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
-- 		}

-- 	filter "configurations:Debug"
-- 		defines "NX_DEBUG"
-- 		symbols "On"

-- 	filter "configurations:Release"
-- 		defines "NX_RELEASE"
-- 		optimize "On"

-- 	filter "configurations:Dist"
-- 		defines "NX_DIST"
-- 		optimize "On"




-- project "Sandbox"
-- 	location "Sandbox"
-- 	kind "ConsoleApp"
-- 	language "C++"

-- 	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
-- 	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

-- 	files
-- 	{
-- 		"%{prj.name}/src/**.h",
-- 		"%{prj.name}/src/**.cpp",
-- 	}

-- 	includedirs
-- 	{
-- 		"Nexus/vendor/spdlog/include",
-- 		"Nexus/src"
-- 	}

-- 	links 
-- 	{
-- 		"Nexus"
-- 	}

-- 	filter "system:windows"
-- 		cppdialect "C++20"
-- 		staticruntime "On"
-- 		systemversion "latest"

-- 		defines
-- 		{
-- 			"NX_PLATFORM_WINDOWS",
-- 		}

-- 	filter "configurations:Debug"
-- 		defines "NX_DEBUG"
-- 		symbols "On"

-- 	filter "configurations:Release"
-- 		defines "NX_RELEASE"
-- 		optimize "On"

-- 	filter "configurations:Dist"
-- 		defines "NX_DIST"
-- 		optimize "On"
