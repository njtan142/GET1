project "Engine"
   kind "ConsoleApp"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"

   IncludeDir = {}
   IncludeDir["GLFW"] = "dependencies/GLFW/include"

   files { "**.h", "**.cpp" }

   includedirs
	{
		"src",
		"%{IncludeDir.GLFW}",
	}
	
	libdirs
	{
		"dependencies/GLFW/lib"
	}

	links
	{
		"glfw3.lib",
		"opengl32.lib"
	}

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"