local joker_list = {

    "Kitsune",
    "Balanced_Joker",
    "Blank_Canvas",
--    "Singing_Machine",    -- W.I.P.
    "Armed_and_Dangerous",  -- Doesn't work with Talisman if cloning joker
    "Loan_Shark",
--    "ninetails"           -- W.I.P.

}




SMODS.Atlas({
    key = "fox_placeholder",
    atlas_table = "ASSET_ATLAS",
    path = 'placeholder.png',
    px = 142,
    py = 190
})


for _, v in ipairs(joker_list) do
    local joker = SMODS.load_file("idv-jokers/" .. v .. ".lua")()
    joker.alerted = true
    joker.atlas = "fox_placeholder"

    if not joker.pos then
        joker.pos = { x = 0, y = 0 }
    end

    local joker_obj = SMODS.Joker(joker)

    for k_, v_ in pairs(joker) do
        if type(v_) == 'function' then
            joker_obj[k_] = joker[k_]
        end
    end


end

