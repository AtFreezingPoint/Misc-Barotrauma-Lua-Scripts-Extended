--[[
    This example shows how to create a script that gives everyone a certain amount of experience every certain amount of seconds.
--]]

if CLIENT then return end -- stops this wrong running on the client

local amountExperience = 500
local passiveExperienceDelay = 600
local passiveExperienceTimer = 0

Hook.Add("think", "examples.passiveExperience", function()
    if Timer.GetTime() < passiveExperienceTimer then return end

    for k, v in pairs(Character.CharacterList) do
        if not v.IsDead and v.Info ~= nil then
            v.Info.GiveExperience(amountExperience)
        end
    end

    passiveExperienceTimer = Timer.GetTime() + passiveExperienceDelay
end)