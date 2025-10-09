SMODS.Joker {
	key = 'kitsune',
	rarity = 3,
	pos = { x = 0, y = 0 },
	cost = 8,
	blueprint_compat = true,
	perishable_compat = false,
	config = { extra = { odds = 2, xmult = 1,
	xmult_gain = 1, played_cards = 9,
	played_cards_remaining = 9 } },
	loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fox_kitsune')
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain,
			card.ability.extra.played_cards, card.ability.extra.played_cards_remaining,
			numerator, denominator } }
	end,

-- SMODS.pseudorandom_probability(card, 'fox_kitsune', 1, card.ability.extra.odds) 
-- [goes in the if card.ability.extra.etc thing]

	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 9) then
			card.ability.extra.played_cards = card.ability.extra.played_cards_remaining - 1
			if card.ability.extra.played_cards_remaining < 1 and not context.blueprint then
				card.ability.extra.played_cards_remaining = card.ability.extra.played_cards
				card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
				return {
					message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
					colour = G.C.RED
				}
			end
		end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
	end
}