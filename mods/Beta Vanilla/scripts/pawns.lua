local mod = mod_loader.mods[modApi.currentMod]
local resourcePath = mod.resourcePath
local scriptPath = mod.scriptPath

local writepath = "img/units/aliens/"
local readpath = resourcePath .. writepath
local imagepath = writepath:sub(5,-1)
local a = ANIMS

local function IsTipImage()
	return Board:GetSize() == Point(6,6)
end

TIER_Beta = 20

-------------
--   Art   --
-------------


local names = {"blobber", "spider", "beetle", "starfish", "crab", "burnbug", "firefly", "leaper", "scarab", "mosquito", "digger", "centipede", "bouncer", "moth", "dungbeetle", "hornet", "burrower", "scorpion", "shaman", "totem"} --list all

for i = 1, #names do
	local name = names[i]
	modApi:appendAsset(writepath.."Beta"..name..".png", readpath.."Beta"..name..".png")
	modApi:appendAsset(writepath.."Beta"..name.."a.png", readpath.."Beta"..name.."a.png")
	modApi:appendAsset(writepath.."Beta"..name.."_death.png", readpath.."Beta"..name.."_death.png")
	modApi:appendAsset(writepath.."Beta"..name.."_emerge.png", readpath.."Beta"..name.."_emerge.png")
	a["Beta"..name] = a[name]:new{ Image = "units/aliens/Beta"..name..".png"}
	a["Beta"..name.."e"] = a[name.."e"]:new{ Image = "units/aliens/Beta"..name.."_emerge.png"}
	a["Beta"..name.."d"] = a[name.."d"]:new{ Image = "units/aliens/Beta"..name.."_death.png"}
	a["Beta"..name.."a"] = a[name.."a"]:new{ Image = "units/aliens/Beta"..name.."a.png"}
end
modApi:appendAsset(writepath.."Betablob.png", readpath.."Betablob.png")
modApi:appendAsset(writepath.."Betablob_death.png", readpath.."Betablob_death.png")
a["Betalob"] = a["blob"]:new{ Height = 1, Image = "units/aliens/Betablob.png"}
a["Betablobd"] = a["blobd"]:new{ Height = 1, Image = "units/aliens/Betablob_death.png"}


modApi:appendAsset("img/portraits/enemy/BetaBeetle2.png", resourcePath.."img/portraits/enemy/BetaBeetle2.png")
modApi:appendAsset("img/portraits/enemy/BetaBlobber2.png", resourcePath.."img/portraits/enemy/BetaBlobber2.png")
modApi:appendAsset("img/portraits/enemy/BetaBouncer2.png", resourcePath.."img/portraits/enemy/BetaBouncer2.png")
modApi:appendAsset("img/portraits/enemy/BetaBurnbug2.png", resourcePath.."img/portraits/enemy/BetaBurnbug2.png")
modApi:appendAsset("img/portraits/enemy/BetaBurrower2.png", resourcePath.."img/portraits/enemy/BetaBurrower2.png")
modApi:appendAsset("img/portraits/enemy/BetaCentipede2.png", resourcePath.."img/portraits/enemy/BetaCentipede2.png")
modApi:appendAsset("img/portraits/enemy/BetaCrab2.png", resourcePath.."img/portraits/enemy/BetaCrab2.png")
modApi:appendAsset("img/portraits/enemy/BetaDigger2.png", resourcePath.."img/portraits/enemy/BetaDigger2.png")
modApi:appendAsset("img/portraits/enemy/BetaDung2.png", resourcePath.."img/portraits/enemy/BetaDung2.png")
modApi:appendAsset("img/portraits/enemy/BetaFirefly2.png", resourcePath.."img/portraits/enemy/BetaFirefly2.png")
modApi:appendAsset("img/portraits/enemy/BetaHornet2.png", resourcePath.."img/portraits/enemy/BetaHornet2.png")
modApi:appendAsset("img/portraits/enemy/BetaLeaper2.png", resourcePath.."img/portraits/enemy/BetaLeaper2.png")
modApi:appendAsset("img/portraits/enemy/BetaMosquito2.png", resourcePath.."img/portraits/enemy/BetaMosquito2.png")
modApi:appendAsset("img/portraits/enemy/BetaMoth2.png", resourcePath.."img/portraits/enemy/BetaMoth2.png")
modApi:appendAsset("img/portraits/enemy/BetaScarab2.png", resourcePath.."img/portraits/enemy/BetaScarab2.png")
modApi:appendAsset("img/portraits/enemy/BetaScorpion2.png", resourcePath.."img/portraits/enemy/BetaScorpion2.png")
modApi:appendAsset("img/portraits/enemy/BetaShaman2.png", resourcePath.."img/portraits/enemy/BetaShaman2.png")
modApi:appendAsset("img/portraits/enemy/BetaSpider2.png", resourcePath.."img/portraits/enemy/BetaSpider2.png")
modApi:appendAsset("img/portraits/enemy/Betaspiderling1.png", resourcePath.."img/portraits/enemy/Betaspiderling1.png")
modApi:appendAsset("img/portraits/enemy/BetaStarfish2.png", resourcePath.."img/portraits/enemy/BetaStarfish2.png")
modApi:appendAsset("img/portraits/enemy/BetaTotem2.png", resourcePath.."img/portraits/enemy/BetaTotem2.png")

---------------
--   Pawns   --
---------------

--edit:
--Name
--ImageOffset
--SkillList
--DONT CHANGE Portrait
--AddPawn

BetaBurnbug1 = Pawn:new{
	Name = "Burnbug of Devour",
	Health = 3,
	MoveSpeed = 3,
	Image = "Betaburnbug",
	ImageOffset = 0,
	Ranged = 1,
	SkillList = { "BetaBurnbugAtk1" },
	SoundLocation = "/enemy/burnbug/",
	Portrait = "enemy/BetaBurnbug2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,	
}
AddPawn("BetaBurnbug1")

BetaBurnbug2 = Pawn:new{
	Name = "Beta Burnbug",
	Health = 5,
	MoveSpeed = 3,
	Image = "Betaburnbug",
	ImageOffset = 1,
	Ranged = 1,
	SkillList = { "BetaBurnbugAtk2" },
	SoundLocation = "/enemy/burnbug/",
	Portrait = "enemy/BetaBurnbug2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaBurnbug2")

BetaFirefly1 = Pawn:new{
	Name = "Firefly of Volatility",
	Health = 3,
	MoveSpeed = 2,
	Image = "Betafirefly",
	ImageOffset = 0,
	Ranged = 1,
	SkillList = { "BetaFireflyAtk1" },
	SoundLocation = "/enemy/firefly/",
	Portrait = "enemy/BetaFirefly2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,	
}
AddPawn("BetaFirefly1")

BetaFirefly2 = Pawn:new{
	Name = "Beta Firefly",
	Health = 5,
	MoveSpeed = 2,
	Image = "Betafirefly",
	ImageOffset = 1,
	Ranged = 1,
	SkillList = { "BetaFireflyAtk2" },
	SoundLocation = "/enemy/firefly/",
	Portrait = "enemy/BetaFirefly2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaFirefly2")

BetaLeaper1 = Pawn:new{
	Name = "Leaper of Spilt",
	Health = 1,
	MoveSpeed = 4,
	Image = "Betaleaper",
	ImageOffset = 0,
	Jumper = true,
	SkillList = { "BetaLeaperAtk1_StarfishAtk" },
	SoundLocation = "/enemy/leaper/",
	Portrait = "enemy/BetaLeaper2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,	
}
AddPawn("BetaLeaper1")

BetaLeaper2 = Pawn:new{
	Name = "Beta Leaper",
	Health = 3,
	MoveSpeed = 4,
	Image = "Betaleaper",
	ImageOffset = 1,
	Jumper = true,
	SkillList = { "BetaLeaperAtk2_StarfishAtk" },
	SoundLocation = "/enemy/leaper/",
	Portrait = "enemy/BetaLeaper2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaLeaper2")

BetaScarab1 = Pawn:new{
	Name = "Scarab of ",
	Health = 2,
	MoveSpeed = 2,
	Image = "Betascarab",
	ImageOffset = 0,
	Ranged = 1,
	SkillList = { "BetaScarabAtk1" },
	SoundLocation = "/enemy/scarab/",
	Portrait = "enemy/BetaScarab2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaScarab1")

BetaScarab2 = Pawn:new{
	Name = "Beta Scarab",
	Health = 4,
	MoveSpeed = 2,
	Image = "Betascarab",
	ImageOffset = 1,
	Ranged = 1,
	SkillList = { "BetaScarabAtk2" },
	SoundLocation = "/enemy/scarab/",
	Portrait = "enemy/BetaScarab2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaScarab2")

BetaMosquito1 = Pawn:new{
	Name = "Mosquito of Heatseeker",
	Health = 2,
	MoveSpeed = 3,
	Image = "Betamosquito",
	ImageOffset = 0,
	SkillList = { "BetaMosquitoAtk1" },
	SoundLocation = "/enemy/mosquito/",
	Portrait = "enemy/BetaMosquito2",
	Flying = true,
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaMosquito1")

BetaMosquito2 = Pawn:new{
	Name = "Beta Mosquito",
	Health = 4,
	MoveSpeed = 3,
	Image = "Betamosquito",
	ImageOffset = 1,
	SkillList = { "BetaMosquitoAtk2" },
	SoundLocation = "/enemy/mosquito/",
	Portrait = "enemy/BetaMosquito2",
	Flying = true,
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaMosquito2")

BetaDigger1 = Pawn:new{
	Name = "Digger of ",
	Health = 2,
	MoveSpeed = 3,
	Image = "Betadigger",
	ImageOffset = 0,
	SkillList = { "BetaDiggerAtk1" },
	SoundLocation = "/enemy/digger/",
	Portrait = "enemy/BetaDigger2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaDigger1")

BetaDigger2 = Pawn:new{
	Name = "Beta Digger",
	Health = 4,
	MoveSpeed = 3,
	Image = "Betadigger",
	ImageOffset = 1,
	SkillList = { "BetaDiggerAtk2" },
	SoundLocation = "/enemy/digger/",
	Portrait = "enemy/BetaDigger2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaDigger2")

BetaCentipede1 = Pawn:new{
	Name = "Centipede of Airburst",
	Health = 3,
	MoveSpeed = 3,
	Image = "Betacentipede",
	ImageOffset = 0,
	SkillList = { "BetaCentipedeAtk1" },
	SoundLocation = "/enemy/centipede/",
	Portrait = "enemy/BetaCentipede2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaCentipede1")

BetaCentipede2 = Pawn:new{
	Name = "Beta Centipede",
	Health = 5,
	MoveSpeed = 3,
	Image = "Betacentipede",
	ImageOffset = 1,
	SkillList = { "BetaCentipedeAtk2" },
	SoundLocation = "/enemy/centipede/",
	Portrait = "enemy/BetaCentipede2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaCentipede2")

BetaBouncer1 = Pawn:new{
	Name = "Bouncer of Pliers",
	Health = 2,
	MoveSpeed = 3,
	Image = "Betabouncer",
	ImageOffset = 0,
	SkillList = { "BetaBouncerAtk1" },
	SoundLocation = "/enemy/bouncer/",
	Portrait = "enemy/BetaBouncer2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaBouncer1")

BetaBouncer2 = Pawn:new{
	Name = "Beta Bouncer",
	Health = 4,
	MoveSpeed = 3,
	Image = "Betabouncer",
	ImageOffset = 1,
	SkillList = { "BetaBouncerAtk2" },
	SoundLocation = "/enemy/bouncer/",
	Portrait = "enemy/BetaBouncer2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaBouncer2")

BetaMoth1 = Pawn:new{
	Name = "Moth of ",
	Health = 3,
	MoveSpeed = 3,
	Flying = true,
	Image = "Betamoth",
	ImageOffset = 0,
	Ranged = 1,
	SkillList = { "BetaMothAtk1" },
	SoundLocation = "/enemy/moth/",
	Portrait = "enemy/BetaMoth2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaMoth1")

BetaMoth2 = Pawn:new{
	Name = "Beta Moth",
	Health = 5,
	MoveSpeed = 3,
	Flying = true,
	Image = "Betamoth",
	ImageOffset = 1,
	Ranged = 1,
	SkillList = { "BetaMothAtk2" },
	SoundLocation = "/enemy/moth/",
	Portrait = "enemy/BetaMoth2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaMoth2")

BetaDung1 = Pawn:new{
	Name = "Tumblebug of Overkill",
	Health = 3,
	MoveSpeed = 3,
	Image = "Betadungbeetle",
	ImageOffset = 0,
	SkillList = { "BetaDungAtk1" },
	SoundLocation = "/enemy/dung/",
	Portrait = "enemy/BetaDung2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaDung1")

BetaDung2 = Pawn:new{
	Name = "Beta Tumblebug",
	Health = 5,
	MoveSpeed = 3,
	Image = "Betadungbeetle",
	ImageOffset = 1,
	SkillList = { "BetaDungAtk2" },
	SoundLocation = "/enemy/dung/",
	Portrait = "enemy/BetaDung2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaDung2")

BetaHornet1 = Pawn:new{
	Name = "Hornet of Proliferation",
	Health = 1,
	MoveSpeed = 4,
	Image = "Betahornet",
	ImageOffset = 0,
	SkillList = { "BetaHornetAtk1" },
	SoundLocation = "/enemy/hornet/",
	Portrait = "enemy/BetaHornet2",
	Flying = true,
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaHornet1")

BetaHornet2 = Pawn:new{
	Name = "Beta Hornet",
	Health = 2,
	MoveSpeed = 4,
	Image = "Betahornet",
	ImageOffset = 1,
	SkillList = { "BetaHornetAtk2" },
	SoundLocation = "/enemy/hornet/",
	Portrait = "enemy/BetaHornet2",
	Flying = true,
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaHornet2")

BetaBurrower1 = Pawn:new{
	Name = "Burrower of ",
	Health = 2,
	Armor = true,
	Image = "Betaburrower",
	ImageOffset = 0,
	MoveSpeed = 4,
	Ranged = 1,
	Burrows = true,
	DefaultTeam = TEAM_ENEMY,
	SkillList = {"BetaBurrowerAtk1"},
	ImpactMaterial = IMPACT_INSECT,
	SoundLocation = "/enemy/burrower_2/",
	Portrait = "enemy/BetaBurrower2",
	Pushable = false,
	Tier = TIER_Beta,
}
AddPawn("BetaBurrower1")  

BetaBurrower2 = Pawn:new{
	Name = "Beta Burrower",
	Health = 2,
	Armor = true,
	Image = "Betaburrower",
	ImageOffset = 1,
	MoveSpeed = 4,
	Ranged = 1,
	Burrows = true,
	DefaultTeam = TEAM_ENEMY,
	SkillList = {"BetaBurrowerAtk2"},
	ImpactMaterial = IMPACT_INSECT,
	SoundLocation = "/enemy/burrower_2/",
	Portrait = "enemy/BetaBurrower2",
	Pushable = false,
	Tier = TIER_Beta,
}
AddPawn("BetaBurrower2")  

BetaScorpion1 = Pawn:new{
	Name = "Scorpion of Backsting",
	Health = 3,
	MoveSpeed = 3,
	Image = "Betascorpion",
	ImageOffset = 0,
	SkillList = { "BetaScorpionAtk1" },
	SoundLocation = "/enemy/scorpion/",
	Portrait = "enemy/BetaScorpion2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaScorpion1")

BetaScorpion2 = Pawn:new{
	Name = "Beta Scorpion",
	Health = 5,
	MoveSpeed = 3,
	Image = "Betascorpion",
	ImageOffset = 1,
	SkillList = { "BetaScorpionAtk2" },
	SoundLocation = "/enemy/scorpion/",
	Portrait = "enemy/BetaScorpion2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaScorpion2")

BetaShaman1 = Pawn:new{
	Name = "Plasmodia of Parasitic",
	Health = 2,
	MoveSpeed = 2,
	Image = "Betashaman",
	ImageOffset = 0,
	SkillList = { "BetaShamanAtk1" },
	SoundLocation = "/enemy/shaman/",
	Portrait = "enemy/BetaShaman2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaShaman1")

BetaShaman2 = Pawn:new{
	Name = "Beta Plasmodia",
	Health = 4,
	MoveSpeed = 2,
	Image = "Betashaman",
	ImageOffset = 1,
	SkillList = { "BetaShamanAtk2" },
	SoundLocation = "/enemy/shaman/",
	Portrait = "enemy/BetaShaman2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaShaman2")

BetaTotem1 = Pawn:new{
	Name = "Beta Spore1",
	Health = 1,
	MoveSpeed = 0,
	Minor = true,
	Image = "Betatotem",
	ImageOffset = 0,
	SkillList = { "" },
	SoundLocation = "/enemy/totem/",
	Portrait = "enemy/BetaTotem2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaTotem1")

BetaTotem2 = Pawn:new{
	Name = "Beta Spore2",
	Health = 1,
	MoveSpeed = 0,
	Minor = true,
	Image = "Betatotem",
	ImageOffset = 1,
	SkillList = { "" },
	SoundLocation = "/enemy/totem/",
	Portrait = "enemy/BetaTotem2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaTotem2")

BetaCrab1 = Pawn:new{
	Name = "Crab of Crossfire",
	Health = 3,
	MoveSpeed = 3,
	Image = "Betacrab",
	ImageOffset = 0,
	Ranged = 1,
	SkillList = { "BetaCrabAtk1" },
	SoundLocation = "/enemy/crab/",
	Portrait = "enemy/BetaCrab2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaCrab1")

BetaCrab2 = Pawn:new{
	Name = "Beta Crab",
	Health = 5,
	MoveSpeed = 3,
	Image = "Betacrab",
	ImageOffset = 1,
	Ranged = 1,
	SkillList = { "BetaCrabAtk2" },
	SoundLocation = "/enemy/crab/",
	Portrait = "enemy/BetaCrab2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaCrab2")

BetaBeetle1 = Pawn:new{
	Name = "Beetle of Rushing",
	Health = 4,
	MoveSpeed = 2,
	Image = "Betabeetle",
	ImageOffset = 1,
	-- Ranged = 1,
	SkillList = { "BetaBeetleAtk1" },
	SoundLocation = "/enemy/beetle/",
	Portrait = "enemy/BetaBeetle2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaBeetle1")

BetaBeetle2 = Pawn:new{
	Name = "Beta Beetle",
	Health = 5,
	MoveSpeed = 2,
	Image = "Betabeetle",
	ImageOffset = 1,
	-- Ranged = 1,
	SkillList = { "BetaBeetleAtk2" },
	SoundLocation = "/enemy/beetle/",
	Portrait = "enemy/BetaBeetle2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaBeetle2")

BetaStarfish1 = Pawn:new{
	Name = "Starfish of Flee",
	Health = 2,
	MoveSpeed = 3,
	Image = "Betastarfish",
	ImageOffset = 0,
	Ranged = 1,
	SkillList = { "StarfishAtk1" },
	SoundLocation = "/enemy/starfish/",
	Portrait = "enemy/BetaStarfish2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaStarfish1")

BetaStarfish2 = Pawn:new{
	Name = "Beta Starfish",
	Health = 4,
	MoveSpeed = 3,
	Image = "Betastarfish",
	ImageOffset = 1,
	Ranged = 1,
	SkillList = { "StarfishAtk2" },
	SoundLocation = "/enemy/starfish/",
	Portrait = "enemy/BetaStarfish2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaStarfish2")

BetaSpider1 = Pawn:new{
	Name = "Spider of ",
	Health = 2,
	MoveSpeed = 4,
	Image = "Betaspider",
	ImageOffset = 0,
	Jumper = true,
	SkillList = { "BetaSpiderAtk1" },
	SoundLocation = "/enemy/spider/",
	Portrait = "enemy/BetaSpider2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaSpider1")

BetaSpider2 = Pawn:new{
	Name = "Beta Spider",
	Health = 4,
	MoveSpeed = 4,
	Image = "Betaspider",
	ImageOffset = 1,
	Jumper = true,
	SkillList = { "BetaSpiderAtk2" },
	SoundLocation = "/enemy/spider/",
	Portrait = "enemy/BetaSpider2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaSpider2")

BetaBlobber1 = Pawn:new{
	Name = "Blobber of Sticky",
	Health = 2,
	MoveSpeed = 2,
	Image = "Betablobber",
	ImageOffset = 0,
	SkillList = { "BetaBlobberAtk1" },
	SoundLocation = "/enemy/blobber/",
	Portrait = "enemy/BetaBlobber2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaBlobber1")

BetaBlobber2 = Pawn:new{
	Name = "Beta Blobber",
	Health = 4,
	MoveSpeed = 2,
	Image = "Betablobber",
	ImageOffset = 1,
	SkillList = { "BetaBlobberAtk2" },
	SoundLocation = "/enemy/blobber/",
	Portrait = "enemy/BetaBlobber2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_INSECT,
	Tier = TIER_Beta,
}
AddPawn("BetaBlobber2")

BetaBlob1 = {
	Name = "Beta Blob1",
	Health = 1,
	MoveSpeed = 0,
	Image = "Betablob",
	Minor = true,
	SkillList = { },
	SoundLocation = "/enemy/blob_1/",
	Portrait = "enemy/Blob2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_BLOB,
	Tier = TIER_Beta,
}
AddPawn("BetaBlob1") 

BetaBlob2 = {
	Name = "Beta Blob2",
	Health = 1,
	MoveSpeed = 0,
	Image = "Betablob",
	Minor = true,
	SkillList = { },
	SoundLocation = "/enemy/blob_2/",
	Portrait = "enemy/Blob2",
	DefaultTeam = TEAM_ENEMY,
	ImpactMaterial = IMPACT_BLOB,
	Tier = TIER_Beta,
}
AddPawn("BetaBlob2") 