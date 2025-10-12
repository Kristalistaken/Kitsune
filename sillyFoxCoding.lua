assert(SMODS.load_file("idv-jokers/Kitsune.lua"))()
assert(SMODS.load_file("idv-jokers/Balanced_Joker.lua"))()
assert(SMODS.load_file("idv-jokers/Blank_Canvas.lua"))()
--assert(SMODS.load_file("idv-jokers/Singing_Machine.lua"))()
assert(SMODS.load_file("idv-jokers/Armed_and_Dangerous.lua"))()
assert(SMODS.load_file("idv-jokers/Loan_Shark.lua"))()
SMODS.Atlas({
    key = "fox_placeholder",
    atlas_table = "ASSET_ATLAS",
    path = 'placeholder.png',
    px = 142,
    py = 190
})