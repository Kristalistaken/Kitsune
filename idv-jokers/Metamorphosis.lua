local extra_id = Card.get_id
function Card:get_id()
    local original_id = extra_id(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_fox_morph")) then
        local source_ids = {2, 3, 4, 5, 6, 7, 8, 10}
        for _, source_id in pairs(source_ids) do
            if original_id == source_id then return 14 end
        end
    end
    return extra_id
end

local joker = {
	key = 'morph',
	rarity = 1,
	pos = { x = 0, y = 0 },
	cost = 0,
	blueprint_compat = false,
	perishable_compat = false,
    in_pool = function()
        return next(SMODS.find_card("j_fox_kitsune"))
    end,
	config = {source_rank_type = "specific", source_ranks = {"2", "3", "4", "5", "6", "7", "8", "10"}, target_rank = "9"},
    
    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
    end,

    remove_from_deck = function(self, card, from_debuff)
    end,

}

return joker