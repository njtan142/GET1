project "Engine"
   kind "ConsoleApp"
   language "C++"
   
   targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
   objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

   IncludeDir = {}
   IncludeDir["GLFW"] = "dependencies/GLFW/include"
   IncludeDir["glad"] = "dependencies/glad/include"
   IncludeDir["glm"] = "dependencies/glm"
   IncludeDir["img"] = "dependencies/image"

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
  		"%{IncludeDir.glm}",
		"%{IncludeDir.img}"
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
		"{COPY} %{prj.dir}src/Shader/shader.vs %{cfg.targetdir}",

		"{DELETE} % %{cfg.targetdir}/shader.fs",
		"{COPY} %{prj.dir}src/Shader/shader.fs %{cfg.targetdir}",

		"{DELETE} % %{cfg.targetdir}/resources/img/**.jpg",
		"{COPY} %{prj.dir}resources/**.jpg %{cfg.targetdir}/resources/img/",



	}
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"