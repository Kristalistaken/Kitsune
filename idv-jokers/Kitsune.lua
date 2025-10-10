SMODS.Joker {
	key = 'kitsune',
	atlas = 'fox_placeholder',
	rarity = 3,
	pos = { x = 0, y = 0 },
	cost = 8,
	blueprint_compat = true,
	perishable_compat = false,
	config = { extra = { xmultvar = 1, ninesplayed = 0, odds = 2 } },
    loc_vars = function(self, info_queue, card)       
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fox_kitsune') 
        return {vars = {card.ability.extra.xmultvar, card.ability.extra.ninesplayed, new_numerator, new_denominator}}
    end,

-- SMODS.pseudorandom_probability(card, 'fox_kitsune', 1, card.ability.extra.odds) 
-- [goes in the if card.ability.extra.etc thing]

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xmultvar
                }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint  then
            if (context.other_card:get_id() == 9 and (card.ability.extra.ninesplayed or 0) >= 8) then
                card.ability.extra.ninesplayed = 0
                if SMODS.pseudorandom_probability(card, 'group_0_6ecd10a1', 1, card.ability.extra.odds, 'j_fox_kitsune') then
              card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 0.5
                        
          end
            elseif context.other_card:get_id() == 9 then
                card.ability.extra.ninesplayed = (card.ability.extra.ninesplayed) + 1
            end
        end
    end
}