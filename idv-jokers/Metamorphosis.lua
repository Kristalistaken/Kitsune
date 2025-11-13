local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_fox_morph")) then
        local source_ids = {2}
        for _, source_id in pairs(source_ids) do
            if original_id == source_id then return 14 end
        end
    end
    return original_id
end

local joker = {
	key = 'morph',
	rarity = 1,
	pos = { x = 0, y = 0 },
	cost = 0,
	blueprint_compat = false,
	perishable_compat = false,
	config = {extra = {source_rank_type = "specific", source_ranks = {"2"}, target_rank = "9"} },
    in_pool = function()
        return next(SMODS.find_card("j_fox_kitsune"))
    end,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
    end,

    remove_from_deck = function(self, card, from_debuff)
    end,


}

return joker