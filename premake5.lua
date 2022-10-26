workspace "VulkanTutorial"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release"
	}

outputdir="%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir={}
IncludeDir["GLFW"]="vendor/GLFW/include"
IncludeDir["imgui"]="vendor/imgui"
IncludeDir["glm"] = "vendor/glm"
IncludeDir["stb"] = "vendor/stb"
IncludeDir["tinyobjloader"] = "vendor/tinyobjloader"
IncludeDir["ImGuizmo"] = "vendor/ImGuizmo"


group "Dependencies"
	include "vendor/GLFW"
	include "vendor/imgui"

group ""
project "Sandbox"

	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	characterset ("MBCS")

	targetdir("bin/" ..outputdir.. "/%{prj.name}")
	objdir("bin-int/" ..outputdir.. "/%{prj.name}")
	

	files
	{
		"%{prj.name}/**.h",
		"%{prj.name}/**.cpp",
		"%{IncludeDir.ImGuizmo}/ImGuizmo.h",
		"%{IncludeDir.ImGuizmo}/ImGuizmo.cpp",
	}

	includedirs
	{
		"%{prj.name}",
		"vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%VULKAN_SDK%/include",
		"%{IncludeDir.glm}",
		"%{IncludeDir.imgui}",
		"%{IncludeDir.stb}",
		"%{IncludeDir.ImGuizmo}"

	}

	links
	{
		"GLFW",
		"ImGui",
		"vulkan-1.lib"
	}

	libdirs 
	{ 
		"%VULKAN_SDK%/lib" 
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			GLFW_INCLUDE_NONE
		}


	filter "configurations:Debug"
		defines ""
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines ""
		runtime "Release"
		optimize "on"


project "SandboxEdit"

	location "SandboxEdit"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	characterset ("MBCS")

	targetdir("bin/" ..outputdir.. "/%{prj.name}")
	objdir("bin-int/" ..outputdir.. "/%{prj.name}")
	

	files
	{
		"%{prj.name}/**.h",
		"%{prj.name}/**.cpp",
	}

	includedirs
	{
		"%{prj.name}",
		"vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%VULKAN_SDK%/include",
		"%{IncludeDir.glm}",
		"%{IncludeDir.imgui}",
		"%{IncludeDir.stb}",

	}

	links
	{
		"GLFW",
		"ImGui",
		"vulkan-1.lib"
	}

	libdirs 
	{ 
		"%VULKAN_SDK%/lib" 
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			GLFW_INCLUDE_NONE
		}


	filter "configurations:Debug"
		defines ""
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines ""
		runtime "Release"
		optimize "on"


project "PointTest"

		location "PointTest"
		kind "ConsoleApp"
		language "C++"
		cppdialect "C++17"
		staticruntime "on"
		characterset ("MBCS")
	
		targetdir("bin/" ..outputdir.. "/%{prj.name}")
		objdir("bin-int/" ..outputdir.. "/%{prj.name}")
		
	
		files
		{
			"%{prj.name}/**.h",
			"%{prj.name}/**.cpp",
		}
	
		includedirs
		{
			"%{prj.name}",
			"vendor/spdlog/include",
			"%{IncludeDir.GLFW}",
			"%VULKAN_SDK%/include",
			"%{IncludeDir.glm}",
			"%{IncludeDir.imgui}",
			"%{IncludeDir.stb}",
	
		}
	
		links
		{
			"GLFW",
			"ImGui",
			"vulkan-1.lib"
		}
	
		libdirs 
		{ 
			"%VULKAN_SDK%/lib" 
		}
	
		filter "system:windows"
			systemversion "latest"
	
			defines
			{
				GLFW_INCLUDE_NONE
			}
	
	
		filter "configurations:Debug"
			defines ""
			runtime "Debug"
			symbols "on"
	
		filter "configurations:Release"
			defines ""
			runtime "Release"
			optimize "on"