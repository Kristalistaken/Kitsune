SMODS.Joker {
	key = 'armed',
	atlas = 'fox_placeholder',
	rarity = 3,
	pos = { x = 0, y = 0 },
	cost = 4,
	blueprint_compat = true,
	perishable_compat = true,
	config = { extra = { xmult = 1, retriggers = 0 } },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.post_trigger and context.other_context.retrigger_joker and not context.blueprint then
            card.ability.extra.retriggers = card.ability.extra.retriggers + 1
            card.ability.extra.xmult = card.ability.extra.xmult + 0.5
            return { card = card, xmult = card.ability.extra.xmult }
        end
        if (context.before or context.after) and not context.blueprint then
            card.ability.extra.retriggers = 0
        end
    end
}
local rep_calc = SMODS.calculate_repetitions
function SMODS.calculate_repetitions(card, context, reps)
    local rep_return = rep_calc(card, context, reps)
    local jokers = SMODS.find_card('j_fox_armed')
    if next(jokers) then
        for _, joker in ipairs(jokers) do
            joker.ability.extra.retriggers = joker.ability.extra.retriggers + #rep_return - 1
        end
    end
    return rep_return
end
