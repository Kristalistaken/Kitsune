local joker = {
	key = 'singing',
	rarity = 4,
	pos = { x = 0, y = 0 },
	cost = 20,
	blueprint_compat = false,
	perishable_compat = false,
	config = { extra = { odds = 4, currentJoker = {}, mergetable = {} } },
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_fox_singing')
        return {vars = {new_numerator, new_denominator}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.blind.boss and not context.blueprint then
            local jokers = {}
            for _, j in pairs(G.jokers.cards) do
                if j ~= card then
                    if SMODS.pseudorandom_probability(card, 'group_0_e2e11086', 1, card.ability.extra.odds, 'j_fox_singing') then
                        table.insert(card.ability.extra.currentJoker, j.config.center.key)
                        SMODS.destroy_cards(j)
                    end
                end
            end
        end
        if card.ability.extra.currentJoker then
            local mergetable = {}
            for i, j in ipairs(card.ability.extra.currentJoker) do
                local key = j
                G.fox_savedjokercards = G.fox_savedjokercards or {}
                G.fox_savedjokercards[card.sort_id] = G.fox_savedjokercards[card.sort_id] or {}
                if not G.fox_savedjokercards[card.sort_id][key] then
                    local old_ability = copy_table(card.ability)
                    local old_center = card.config.center
                    local old_center_key = card.config.center_key
                    card:set_ability(key, nil, 'quantum')
                    card:update(0.016)
                    G.fox_savedjokercards[card.sort_id][key] = SMODS.shallow_copy(card)
                    G.fox_savedjokercards[card.sort_id][key].ability = copy_table(G.fox_savedjokercards[card.sort_id][key].ability)
                    for k, v in ipairs({"T", "VT", "CT"}) do
                        G.fox_savedjokercards[card.sort_id][key][v] = copy_table(G.fox_savedjokercards[card.sort_id][key][v])
                    end
                    G.fox_savedjokercards[card.sort_id][key].config = SMODS.shallow_copy(G.fox_savedjokercards[card.sort_id][key].config)
                    card.ability = old_ability
                    card.config.center = old_center
                    card.config.center_key = old_center_key
                end
                local effect = G.fox_savedjokercards[card.sort_id][key]:calculate_joker(context)
                if effect then
                    table.insert(mergetable, effect)
                end
            end
            return SMODS.merge_effects(mergetable)
        end
    end
}

return joker