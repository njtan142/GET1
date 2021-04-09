project "Engine"
   kind "ConsoleApp"
   language "C++"
   
   targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
   objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

   IncludeDir = {}
   IncludeDir["GLFW"] = "dependencies/GLFW/include"
   IncludeDir["glad"] = "dependencies/glad/include"
   IncludeDir["glm"] = "dependencies/glm"

   files 
   {
		"src/**.h",
		"src/**.cpp",
		"dependencies/glad/src/glad.c"
   }

   includedirs
	{
		"src",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.glad}",
  		"%{IncludeDir.glm}"
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
	postbuildcommands 
	{
		"{DELETE} % %{cfg.targetdir}/shader.vs",
		"{DELETE} % %{cfg.targetdir}/shader.fs",
		"{COPY} %{prj.dir}src/Shader/shader.vs %{cfg.targetdir}",
		"{COPY} %{prj.dir}src/Shader/shader.fs %{cfg.targetdir}"

	}
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"