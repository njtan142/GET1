project "Engine"
   kind "ConsoleApp"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"

   IncludeDir = {}
   IncludeDir["GLFW"] = "dependencies/GLFW/include"
   IncludeDir["glad"] = "dependencies/glad/include"

   files 
   {
		"**.h",
		"**.cpp",
		"**.c"
   }

   includedirs
	{
		"src",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.glad}",
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