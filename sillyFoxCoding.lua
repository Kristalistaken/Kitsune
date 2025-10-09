--Hopefully makes it so stuff can be read
local current_mod = SMODS.current_mod
local mod_path = SMODS.current_mod.path
local config = SMODS.current_mod.config
local folder = nil


-- Ingame Jokers
local joker_list = {
"Kitsune"



}
assert(SMODS.load_file("indiv-jokers/Kitsune.lua"))()
SMODS.atlas({
    key = "Fox_Jokers",
    atlas_table = "ASSET_ATLAS",
    path = "1"
})