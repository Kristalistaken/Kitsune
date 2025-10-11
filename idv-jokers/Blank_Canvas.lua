SMODS.Joker {
	key = 'blankcanvas',
	atlas = 'fox_placeholder',
	rarity = 2,
	pos = { x = 0, y = 0 },
	cost = 6,
	blueprint_compat = true,
	perishable_compat = true,
	config = { extra = { chips = 0, mult = 0, xmult = 1, jokerslots = 0 } },
    add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			local edition = poll_edition('fox_blankcanvas', nil, false, true, {'e_foil', 4, 'e_holo', 3, 'e_polychrome', 2, 'e_negative', 1})
        	card:set_edition(edition, true)
		end
	end,
	loc_vars = function(self, info_queue, card)
		if card.edition and card.edition.base then
		elseif card.edition and card.edition.e_foil then
			card.ability.extra.chips = 50
		elseif card.edition and card.edition.e_holo then
			card.ability.extra.mult = 10
		elseif card.edition and card.edition.e_polychrome then
			card.ability.extra.xmult = 1.5
		elseif card.edition and card.edition.e_negative then
			G.jokers.config.card_limit = G.jokers.config.card_limit + 1
			card.ability.extra.jokerslots = 1
			G.was_negative = false
		end
		return { vars = {
			card.ability.extra.chips,
			card.ability.extra.mult,
			card.ability.extra.xmult,
			card.ability.extra.jokerslots
		} }
	end,
	calculate = function(self, card, context)
		if context.selling_card == true and G.was_negative == true and not context.blueprint then
			G.jokers.config.card_limit = G.jokers.config.card_limit - 1
		end
		if context.cardarea == G.jokers and context.joker_main then
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult,
				xmult = card.ability.extra.xmult,
				jokerslots = card.ability.extra.jokerslots
			}
		end
	end
}