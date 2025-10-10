assert(SMODS.load_file("idv-jokers/Kitsune.lua"))()
assert(SMODS.load_file("idv-jokers/Balanced_Joker.lua"))()
SMODS.Atlas({
    key = "fox_jokers",
    atlas_table = "ASSET_ATLAS",
    path = 'kitsune.png', -- use this for any languages not specified
    px = 142,
    py = 190
})