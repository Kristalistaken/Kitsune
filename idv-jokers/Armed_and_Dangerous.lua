SMODS.Joker {
	key = 'armed',
	atlas = 'fox_placeholder',
	rarity = 2,
	pos = { x = 0, y = 0 },
	cost = 4,
	blueprint_compat = true,
	perishable_compat = true,
	config = { extra = { xmultvar = 1, retriggeredcard = nil } },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmultvar}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if card.ability.extra.retriggeredcard and context.other_card == card.ability.extra.retriggeredcard then
                card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 0.5
            else
                card.ability.extra.retriggeredcard = context.other_card
            end
            return { Xmult = card.ability.extra.xmultvar }
        end
        if context.after and context.cardarea == G.jokers and not context.blueprint then
            return { func = function()
                card.ability.extra.xmultvar = 1 return true end
            }
        end
    end
}