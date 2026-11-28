local resourcePath = mod_loader.mods[modApi.currentMod].resourcePath
modApi:appendAsset("img/effects/Betaspiderwebitem.png", resourcePath.."img/effects/Betaspiderwebitem.png")
modApi:appendAsset("img/effects/shotup_smallrocks.png", resourcePath.."img/effects/shotup_smallrocks.png")
modApi:appendAsset("img/effects/stinger_R.png", resourcePath.."img/effects/stinger_R.png")
modApi:appendAsset("img/effects/stinger_U.png", resourcePath.."img/effects/stinger_U.png")

--firefly
-------------------------------------------------------


BetaFireflyAtk1 = Skill:new{
	Name = "Unstable Thorax",
	Description = "Launch a unstable mass of goo either dealing 1 damage and boosted, or Heal 1 and burn.",
	Damage = 1,
	PathSize = 1,	
	Range = RANGE_PROJECTILE,
	Class = "Enemy",
	Icon = "weapons/enemy_firefly1.png",
	Explosion = "ExploFirefly1",
	ImpactSound = "/impact/dynamic/enemy_projectile",
	Projectile = "effects/shot_firefly",
	TipImage = {
		Unit = Point(2,2),
		Enemy = Point(2,1),
		Target = Point(2,1),
		CustomPawn = "BetaFirefly1"
	}
}

function BetaFireflyAtk1:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
	local dir = GetDirection(p2 - p1)
	local target = GetProjectileEnd(p1,p2,PATH_PROJECTILE) 
	local damage = SpaceDamage(target, self.Damage)	
	local distance = p1:Manhattan(target)%2	
	if  distance == 1 then
		damage.iDamage = self.Damage
		if Board:GetPawn(target) then damage.sScript = string.format("Board:GetPawn(%s):SetBoosted(true)", Board:GetPawn(target):GetId()) end
	else
		damage.iDamage = -self.Damage
		damage.iFire = 1
	end
	damage.sAnimation = self.Explosion
	ret:AddQueuedProjectile(damage, self.Projectile)
	return ret
end

function BetaFireflyAtk1:GetTargetScore(p1,p2)
	--Beta Firefly need to damage player in odd distance and heal vek in even distance
	local target = GetProjectileEnd(p1,p2,PATH_PROJECTILE) 
	local distance = (p1:Manhattan(target))%2
	local ret = 0
		if 	Board:IsPawnSpace(target)	then--check if unit
			if  distance == 1 then	--odd for damage
				if Board:GetPawn(target):GetTeam() == TEAM_PLAYER	then 
					ret = ret + 5 
				else
					ret = ret - 5
				end
			else	--even for heal
				if Board:GetPawn(target):GetTeam() == TEAM_ENEMY and Board:GetPawn(target):IsQueued() then 
					ret = ret + 5
				else
					ret = ret - 5	
				end
			end
		else
			if Board:GetTerrain(target) == TERRAIN_BUILDING	then	
				if  distance == 1 then		
					ret = ret + 5
				end
			end
		end
	return ret
end



----------|||------------

BetaFireflyAtk2 = BetaFireflyAtk1:new{
	Name = "Volatile Thorax",
	Description = "Launch a unstable mass of goo either dealing 3 damage and boosted, or Heal 3 and burn.",
	Damage = 3,
	Range = RANGE_PROJECTILE,
	Class = "Enemy",
	Icon = "weapons/enemy_firefly2.png",
	Explosion = "ExploFirefly2",
	ImpactSound = "/impact/dynamic/enemy_projectile",
	Projectile = "effects/shot_firefly",
	TipImage = {
		Unit = Point(2,2),
		Enemy = Point(2,1),
		Target = Point(2,1),
		CustomPawn = "BetaFirefly2"
	}
}

BetaFireflyAtkB = BetaFireflyAtk2:new{Damage=3, Class = "Enemy",Name = "Piercing Thorax", Description = "Launch a phasing mass of goo dealing 3 damage to the first two targets hit.",}

--Hornet
----------------------

BetaHornetAtk1 = Skill:new{
	Name = "Proliferation Stringer",
	Description = "Stab the target for 2 damage. Spawn Hornet of Proliferation on kill",
	Damage = 2,
	PathSize = 1,
	Class = "Enemy",
	Icon = "weapons/enemy_hornet1.png",
	TargetBehind = false,
	TipImage = {
		Unit = Point(2,1),
		Enemy = Point(2,2),
		Building = Point(2,3),
		Target = Point(2,2),
		CustomPawn = "BetaHornet1"
	}
}

function BetaHornetAtk1:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	local direction = GetDirection(p2 - p1)	
	
	local damage = SpaceDamage(p2,self.Damage)
	local damage2 = SpaceDamage(p2+DIR_VECTORS[direction],self.Damage)
	damage.sAnimation = "explohornet_"..direction

	if Board:IsDeadly(damage, user) then 
		if self.TargetBehind then
			damage.sPawn = "BetaHornet2" 
		else
			damage.sPawn = "BetaHornet1" 
		end
		damage.bKO_Effect = true --this is just visuals
	end

	if Board:IsDeadly(damage2, user) then 
		damage2.sPawn = "BetaHornet2" 
		damage.bKO_Effect = true --this is just visuals
	end

	ret:AddQueuedMelee(p1,damage, 0.25)
	if self.TargetBehind then
		ret:AddQueuedDamage(damage2)
	end
	return ret
end	

----------|||------------

BetaHornetAtk2 = BetaHornetAtk1:new{
	Name = "Parasitic Stringer",
	Description = "Stab 2 tiles in front of the unit for 4 damage. Spawn BetaHornet on kill",
	Damage = 4,
	PathSize = 1,
	Class = "Enemy",
	Icon = "weapons/enemy_hornet2.png",
	TargetBehind = true,
	TipImage = {
		Unit = Point(2,1),
		Enemy = Point(2,2),
		Building = Point(2,3),
		Target = Point(2,2),
		CustomPawn = "BetaHornet2"
	}
}

BetaHornetAtkB = BetaHornetAtk2:new{Damage = 6, Class = "Enemy", Name = "Impaling Stringer"}

--Leaper
----------------------

BetaLeaperAtk1_StarfishAtk = Skill:new{
	Name = "Split Fangs",
	Description = "preparing to strike a target for 3 damage, attack two oblique tiles if other veks on side or behind.",
	PathSize = 1,
	Icon = "weapons/enemy_scorpion1.png",	
	Damage = 3,
	Class = "Enemy",
	LaunchSound = "",
	SoundBase = "/enemy/scorpion_soldier_1",
	TipImage = {
		Unit = Point(2,2),
		Enemy = Point(2,1),
		Enemy2 = Point(1,2),
		Target = Point(2,1),
		CustomPawn = "BetaLeaper1"
	}
}

function BetaLeaperAtk1_StarfishAtk:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	local direction = GetDirection(p2 - p1)	
	local SecondFrom = false

	local damage = SpaceDamage(p2,self.Damage)
	local count = 0

	damage.sAnimation = "SwipeClaw2"
	damage.sSound = self.SoundBase.."/attack"

	for j = 1,3 do	--check if onther vek from behind or side
		if Board:IsPawnSpace(p1 + DIR_VECTORS[(direction + j)% 4]) and Board:GetPawn(p1 + DIR_VECTORS[(direction + j)% 4]):GetTeam() == TEAM_ENEMY then 
			SecondFrom = true
		else
			count = count + 1
		end
	end
	if count == 3 then 
		SecondFrom = false
		count = 0
	end
	if SecondFrom then
		damage.loc = p2 + DIR_VECTORS[(direction + 1)% 4]
		ret:AddQueuedDamage(damage)
		damage.loc = p2 + DIR_VECTORS[(direction - 1)% 4]
		ret:AddQueuedDamage(damage)
	else
		ret:AddQueuedMelee(p1,damage)
	end
	return ret
end	 

----------|||------------

BetaLeaperAtk2_StarfishAtk = BetaLeaperAtk1_StarfishAtk:new{
	Name = "Double Fangs",
	Description = "preparing to strike a target for 5 damage, attack two oblique tiles if other veks on side or behind.",
	PathSize = 1,
	Icon = "weapons/enemy_scorpion2.png",	
	Damage = 5,
	Class = "Enemy",
	LaunchSound = "",
	SoundBase = "/enemy/scorpion_soldier_2",
	TipImage = {
		Unit = Point(2,2),
		Enemy = Point(2,1),
		Enemy2 = Point(1,2),
		Target = Point(2,1),
		CustomPawn = "BetaLeaper2"
	}
}

BetaLeaperAtkB_StarfishAtk = BetaLeaperAtk2_StarfishAtk:new{Damage = 5, Class = "Enemy", Name = "Rending Fangs"}

--scorpion
----------------------
BetaScorpionAtk1 = Skill:new{
	Name = "Backsting Spinneret",
	Description = "Web an adjacent target, preparing to fire a short-ranged artillery shot from behind for 1 damage.",
	PathSize = 1,
	Icon = "weapons/enemy_scorpion1.png",	
	Damage = 1,
	Range = 1,
	Class = "Enemy",
	LaunchSound = "",
	SoundBase = "/enemy/scorpion_soldier_1",
	ImpactSound = "/impact/generic/explosion",
	Projectile = "effects/shotup_crab1.png",
	TipImage = {
		Unit = Point(2,2),
		Enemy = Point(2,1),
		Target = Point(2,1),
		CustomPawn = "BetaScorpion1"
	}
}

function BetaScorpionAtk1:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	local direction = GetDirection(p2 - p1)
	local p3 = p1 + DIR_VECTORS[(direction + 2)% 4]	--behind
	local damage = SpaceDamage(p3, self.Damage)

	--case1:p2 had unit but p3 empty: artillery from p3 to p2 , do damage
	--case2:p3 had unit but p2 empty: p3 leap to p2 and damage
	--case3:both p2 and p3 had unit: attack canceled.

	SkillEffect["New_AddQueuedArtillery"] = function(self, origin, damage, graphics, delay) -- add our own queued artillery that can start from anywhere
        local fx = SkillEffect()
        fx["AddArtillery"](fx, origin, damage, graphics, delay)
        self.q_effect:AppendAll(fx.effect)
    end

	ret:AddDamage(SoundEffect(p2,self.SoundBase.."/attack_web"))
	ret:AddGrapple(p1,p2,"hold")	

	if Board:IsPawnSpace(p3) then 
		if	not IsPawnSpace(p2) then 
			ret:AddLeap(p2,FULL_DELAY)	
			ret:AddQueuedMelee(p1,damage)
		end
	else
		damage.loc = p2
		ret:New_AddQueuedArtillery(p3, damage, self.Projectile, 0)
	end

	return ret
end	

function BetaScorpionAtk1:GetTargetScore(p1,p2)
	local ret = 0
	local direction = GetDirection(p2 - p1)
	local behind = p1 + DIR_VECTORS[(direction + 2)% 4]

	
	return ret	
end

----------|||------------

BetaScorpionAtk2 = BetaScorpionAtk1:new{
	Name = "Backsting Spinneret",
	Description = "Web an adjacent target, preparing to fire a short-ranged artillery shot from behind for 3 damage.",
	PathSize = 1,
	Icon = "weapons/enemy_scorpion2.png",	
	Damage = 3,
	Range = 1,
	Class = "Enemy",
	LaunchSound = "",
	SoundBase = "/enemy/scorpion_soldier_2",
	ImpactSound = "/impact/generic/explosion",
	Projectile = "effects/shotup_crab2.png",
	TipImage = {
		Unit = Point(2,2),
		Enemy = Point(2,1),
		Target = Point(2,1),
		CustomPawn = "BetaScorpion2"
	}
}

BetaScorpionAtkB = BetaScorpionAtk2:new{Damage = 4, Class = "Enemy", Name = "Rupturing Spinneret"}