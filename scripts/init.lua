local description = "Adds alternate versions of all vanilla Vek called Transfigured Vek."

local mod = {
	id = "HK_BetaVek",
	name = "Transfigured Vek",
	version = "1.0.0",
	requirements = {},
	dependencies = { 
		modApiExt = "1.21",
		memedit = "1.1.4",
		easyEdit = "2.0.6",
	},
	modApiVersion = "2.9.2",
	icon = "mod_icon.png",
	description = description,
	--metadata = metadata,
	submodFolders = {"mods/"},
}


function mod:init()
	require(self.scriptPath.."replaceSpawns")	--Logic that replaces Alphas with Omegas(Beta). Had to copy it because i dont know how it work ._.
end

function mod:load(options, version)
end

function mod:metadata()
	modApi:addGenerationOption(
		"BetaVek",
		"Transfigured Vek spawn settings",
		"Pick the overall percentage of Vek that will be replaced by Transfigured or Beta Vek if Alpha. The options below overrule this one for specific species.",
		{ strings = { "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 }, 
		  value = 0.5 }	--defaults to 50%
	)
	modApi:addGenerationOption(
		"BetaFirefly",
		"Transfigured or Beta Firefly spawn settings",
		"Pick the percentage of Fireflies that will be replaced by Transfigured or Beta Fireflies. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaHornet",
		"Transfigured or Beta Hornet spawn settings",
		"Pick the percentage of Hornets that will be replaced by Transfigured or Beta Hornets. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaLeaper",
		"Transfigured or Beta Leaper spawn settings",
		"Pick the percentage of Leapers that will be replaced by Transfigured or Beta Leapers. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaScarab",
		"Transfigured or Beta Scarab spawn settings",
		"Pick the percentage of Scarabs that will be replaced by Transfigured or Beta Scarabs. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaScorpion",
		"Transfigured or Beta Scorpion spawn settings",
		"Pick the percentage of Scorpions that will be replaced by Transfigured or Beta Scorpions. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaBeetle",
		"Transfigured or Beta Beetle spawn settings",
		"Pick the percentage of Beetles that will be replaced by Transfigured or Beta Beetles. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaBlobber",
		"Transfigured or Beta Blobber spawn settings",
		"Pick the percentage of Blobbers that will be replaced by Transfigured or Beta Blobbers. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaBurrower",
		"Transfigured or Beta Burrower spawn settings",
		"Pick the percentage of Burrowers that will be replaced by Transfigured or Beta Burrowers. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaCentipede",
		"Transfigured or Beta Centipede spawn settings",
		"Pick the percentage of Centipedes that will be replaced by Transfigured or Beta Centipedes. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaCrab",
		"Transfigured or Beta Crab spawn settings",
		"Pick the percentage of Crabs that will be replaced by Transfigured or Beta Crabs. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaDigger",
		"Transfigured or Beta Digger spawn settings",
		"Pick the percentage of Diggers that will be replaced by Transfigured or Beta Diggers. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaSpider",
		"Transfigured or Beta Spider spawn settings",
		"Pick the percentage of Spiders that will be replaced by Transfigured or Beta Spiders. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaBouncer",
		"Transfigured or Beta Bouncer spawn settings",
		"Pick the percentage of Bouncers that will be replaced by Transfigured or Beta Bouncers. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaBurnbug",
		"Transfigured or Beta Gastropod spawn settings",
		"Pick the percentage of Gastropods that will be replaced by Transfigured or Beta Gastropods. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaMosquito",
		"Transfigured or Beta Mosquito spawn settings",
		"Pick the percentage of Mosquitos that will be replaced by Transfigured or Beta Mosquitos. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaMoth",
		"Transfigured or Beta Moth spawn settings",
		"Pick the percentage of Moths that will be replaced by Transfigured or Beta Moths. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaShaman",
		"Transfigured or Beta Plasmodia spawn settings",
		"Pick the percentage of Plasmodias that will be replaced by Transfigured or Beta Plasmodias. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaStarfish",
		"Transfigured or Beta Starfish spawn settings",
		"Pick the percentage of Starfishes that will be replaced by Transfigured or Beta Starfishes. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
	modApi:addGenerationOption(
		"BetaDung",
		"Transfigured or Beta Tumblebug spawn settings",
		"Pick the percentage of Tumblebugs that will be replaced by Transfigured or Beta Tumblebugs. Can default to the overall percentage defined above.",
		{ strings = { "Default", "0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" }, 
		  values = { "Default", 0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1 } }
	)
end

return mod