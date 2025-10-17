SMODS.Sound({
    key = "fox_armed",
    path = "armed_and_dangerous.ogg",
    pitch = 1
})

SMODS.Sound({
    key = "fox_again",
    path = "again.ogg",
    pitch = 1
})

G.playsound = true

local joker = {
	key = 'armed',
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
            if G.playsound == true then
                G.playsound = false
                return { message = "ARMED AND DANGEROUS", sound = 'fox_armed', pitch = 1, volume = 1.5 }
            end
            if card.ability.extra.retriggeredcard and context.other_card == card.ability.extra.retriggeredcard then
                card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 0.1
            if card.ability.extra.retriggeredcard and context.other_card == card.ability.extra.retriggeredcard then
                return { message = "AGAIN", sound = 'fox_again', pitch = 1, volume = 2, extra = { Xmult = card.ability.extra.xmultvar } }
            end
            else
                if not context.blueprint then
                    card.ability.extra.retriggeredcard = context.other_card
                end
            end
        end
        if context.after and context.cardarea == G.jokers and not context.blueprint then
            G.playsound = true
            return { func = function()
                card.ability.extra.xmultvar = 1 return true end
            }
        end
    end
}

return joker

