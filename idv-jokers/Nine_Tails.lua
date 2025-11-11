local joker = {
    key = "ninetails",
    config = {
        extra = { repetitions = 2 }
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    perishable_compat = true,
    in_pool = function()
        return next(SMODS.find_card("j_fox_kitsune"))
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 9 then
                return { repetitions = card.ability.extra.repetitions, message = localize('k_again_ex')}
            end
        end
    end
}

return joker