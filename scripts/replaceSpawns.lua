local mod = modApi:getCurrentMod()

local old_Spawner_NextPawn = Spawner.NextPawn
function Spawner:NextPawn(pawn_tables)
	local options = mod_loader.currentModContent[mod.id].options
	--merge_table(options, mod_loader.currentModContent["HK_BetaBotsAndBugs"].options)
	--merge_table(options, mod_loader.currentModContent["HK_BetaVextra"].options)
	local ret = old_Spawner_NextPawn(self, pawn_tables)
	if _G["Beta"..ret] ~= nil then
		if options["BetaVek"] ~= nil and options["Beta"..ret:sub(1, -2)] ~= nil then
			if options["Beta"..ret:sub(1, -2)].value ~= "Default" then 
				chance = options["Beta"..ret:sub(1, -2)].value
			else
				chance = options["BetaVek"].value
			end
		else
			chance = 0.5 --default setting
		end
			if math.random() <= chance then ret = "Beta"..ret end --RNG check
	end
	return ret
end