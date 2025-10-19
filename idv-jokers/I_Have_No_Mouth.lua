local joker = {
	key = 'andimustscream',
	rarity = 4,
	pos = { x = 0, y = 0 },
	cost = 20,
	blueprint_compat = false,
	perishable_compat = false,
	config = { extra = { tally1 = 0, tally2 = 0, tally3 = 0, odds = 5, tally4 = 0, xmult = 1, counter = 0 } },
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fox_andimustscream')
        return {vars = { card.ability.extra.tally1, card.ability.extra.tally2,
        card.ability.extra.tally3, new_numerator, new_denominator, card.ability.extra.tally4,
        card.ability.extra.xmult}}
    end,
    in_pool = function()
        return false
    end,
    calculate = function(self, card, context)
        if ((context.setting_blind and not context.blueprint) or (context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint)) then
            local sliced_card = G.jokers.cards[1]
            SMODS.destroy_cards(sliced_card)
            card.ability.extra.counter = card.ability.extra.counter + 1
            if card.ability.extra.counter >= 5 then
                card.ability.extra.counter = 0
                card.ability.extra.tally1 = card.ability.extra.tally1 + 1
                if card.ability.extra.tally1 >= 5 then
                    card.ability.extra.tally2 = card.ability.extra.tally2 + 1
                    card.ability.extra.tally1 = 0
                    if card.ability.extra.tally2 >= 10 and G.GAME.dollars == 84 then
                        card.ability.extra.tally3 = card.ability.extra.tally3 + 1
                        card.ability.extra.tally2 = 0
                        if SMODS.pseudorandom_probability(card, 'group_0_e2e11086', 1, card.ability.extra.odds, 'j_fox_andimustscream') then
                            card.ability.extra.counter = 0
                            card.ability.extra.tally1 = 0
                            card.ability.extra.tally2 = 0
                            card.ability.extra.tally3 = 0
                            card.ability.extra.tally4 = 0
                        elseif card.ability.extra.tally3 >= 3 then
                            card.ability.extra.tally4 = card.ability.extra.tally4 + 1
                            card.ability.extra.tally3 = 0
                            SMODS.destroy_cards(G.consumeables.cards)
                            if card.ability.extra.tally4 >= 4 then
                                card.ability.extra.xmult = card.ability.extra.xmult + 0.5
                            end
                        end
                    end
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
            return { Xmult = card.ability.extra.xmultvar }
        end
    end
}

return joker