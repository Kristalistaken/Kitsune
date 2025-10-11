assert(SMODS.load_file("idv-jokers/Kitsune.lua"))()
assert(SMODS.load_file("idv-jokers/Balanced_Joker.lua"))()
assert(SMODS.load_file("idv-jokers/Blank_Canvas.lua"))()
SMODS.Atlas({
    key = "fox_placeholder",
    atlas_table = "ASSET_ATLAS",
    path = 'placeholder.png',
    px = 142,
    py = 190
})