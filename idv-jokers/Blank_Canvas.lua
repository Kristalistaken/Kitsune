-- Blank Card
-- Editions have double the effect on this Joker
-- (will always have an edition)

SMODS.Joker {
	key = 'blankcanvas',
	atlas = 'fox_placeholder',
	rarity = 2,
	pos = { x = 0, y = 0 },
	cost = 4,
	blueprint_compat = false,
	perishable_compat = true,
	config = { extra = { xmultvar = 1, ninesplayed = 0, odds = 2 } },
--	set_ability = function(self, card, initial)
--        card:set_edition("e_polychrome", true)

--	end,
    loc_vars = function(self, info_queue, card)       
      --  local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fox_kitsune') 
      --  return {vars = {card.ability.extra.xmultvar, card.ability.extra.ninesplayed, new_numerator, new_denominator}}
    
    end,



}