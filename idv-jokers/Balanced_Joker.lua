SMODS.Joker {
	key = 'balancedjoker',
	atlas = 'fox_placeholder',
	rarity = 1,
	pos = { x = 0, y = 0 },
	cost = -10,
	blueprint_compat = true,
	perishable_compat = false,
	config = { extra = { odds = 900, mult = 3600 } },
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fox_balancedjoker') 
        return {vars = {new_numerator, new_denominator}}
    end,
--    set_ability = function(self, card, context)
--        card:set_eternal(true)
--        card:set_edition("e_negative", true)
--    end,
    add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
            card:set_eternal({ eternal = true})
            card:set_edition({ negative = true }, true)
		end
	end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_e2e11086', 1, card.ability.extra.odds, 'j_fox_balancedjoker') then
                    SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                end
            end
        end
    end
}