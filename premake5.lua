workspace "Game Engine Trial1"
	architecture "x64"
	startproject "Engine"

   configurations { "Debug", "Release" }
   
   outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
include "Engine"