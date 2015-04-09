--
-- actions/vstudio/vs2013.lua
-- Extend the existing exporters with support for Visual Studio 2013.
-- Copyright (c) 2013-2014 Jason Perkins and the Premake project
--

	premake.vstudio.vc2013 = {}

	local p = premake
	local vstudio = p.vstudio
	local vc2010 = vstudio.vc2010

	local m = vstudio.vc2013


---
-- Define the Visual Studio 2013 export action.
---

	newaction {
		-- Metadata for the command line and help system

		trigger     = "vs2013",
		shortname   = "Visual Studio 2013",
		description = "Generate Visual Studio 2013 project files",

		-- Visual Studio always uses Windows path and naming conventions

		os = "windows",

		-- The capabilities of this action

		valid_kinds     = { "ConsoleApp", "WindowedApp", "StaticLib", "SharedLib", "Makefile", "None" },
		valid_languages = { "C", "C++", "C#" },
		valid_tools     = {
			cc     = { "msc"   },
			dotnet = { "msnet" },
		},

		-- Solution and project generation logic

		onSolution = function(sln)
			vstudio.vs2005.generateSolution(sln)
		end,
		onProject = function(prj)
			vstudio.vs2010.generateProject(prj)
		end,

		onCleanSolution = vstudio.cleanSolution,
		onCleanProject  = vstudio.cleanProject,
		onCleanTarget   = vstudio.cleanTarget,

		pathVars        = vstudio.pathVars,

		-- This stuff is specific to the Visual Studio exporters

		vstudio = {
			solutionVersion = "12",
			versionName     = "2013",
			targetFramework = "4.5",
			toolsVersion    = "12.0",
			filterToolsVersion = "4.0",
			platformToolset = "v120"
		}
	}
