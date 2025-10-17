local joker = {
    key = "ninetails",

    config = {
        extra = { repetitions = 2 }
    },
    cost = 6,
    rarity = 4,
    blueprint_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 9 then
                return { repetitions = card.ability.extra.repetitions, message = localize('k_again_ex')}
            end
        end
    end
}

return joker