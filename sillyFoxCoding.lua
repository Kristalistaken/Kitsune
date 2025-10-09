--Hopefully makes it so stuff can be read (Does quite literally nothing atm I'm pretty sure)
local current_mod = SMODS.current_mod
local mod_path = SMODS.current_mod.path
local config = SMODS.current_mod.config
local folder = nil


-- Ingame Jokers
local joker_list = {
"Kitsune"



}
assert(SMODS.load_file("idv-jokers/Kitsune.lua"))()
SMODS.Atlas({
    key = "fox_jokers",
    atlas = "fox_atlas",
    path = 'kitsune.png', -- use this for any languages not specified
    pos = { x = 0, y = 0 },
    px = 470,
    py = 661
})