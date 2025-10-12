SMODS.Joker {
	key = 'singing',
	atlas = 'fox_placeholder',
	rarity = 4,
	pos = { x = 0, y = 0 },
	cost = 20,
	blueprint_compat = false,
	perishable_compat = false,
	config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fox_singing')
        return {vars = {new_numerator, new_denominator}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind and context.game_over == false and context.main_eval and not context.blueprint then
            if context.select_blind_button and context.boss then
                if SMODS.pseudorandom_probability(card, 'group_0_e2e11086', 1, card.ability.extra.odds, 'j_fox_singing') then
                    local destructable_jokers = {}
                    local jokers_copying = {}
                    local copied_jokers
                    if jokers_copying == not nil then
                        copied_jokers = SMODS.blueprint_effect(card, G.joker.cards[jokers_copying], context)
                    end
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) and not G.jokers.cards[i].getting_sliced then
                            destructable_jokers[#destructable_jokers + 1] = G.joker.cards[i]
                        end
                    end
                    jokers_copying = destructable_jokers
                    if destructable_jokers then
                        destructable_jokers.getting_sliced = true
                    end
                    return SMODS.merge_effects { copied_jokers or {} }
                end
            end
        end
    end
}