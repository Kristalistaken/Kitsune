local oldsetcost = Card.set_cost
function Card:set_cost()
    local g = oldsetcost(self)
    if self.config.center.key == "j_fox_loan" then self.cost = 0 end
    return g
end
SMODS.Joker {
	key = 'loan',
	atlas = 'fox_placeholder',
	rarity = 1,
  cost = 0,
	pos = { x = 0, y = 0 },
	blueprint_compat = false,
	perishable_compat = false,
	config = { extra = { dollars = 50, sell_value = -100 } },
  add_to_deck = function(self,card,from_debuff)
      card.ability.extra_value = -101
      card:set_cost(-101)
      ease_dollars(50)
  end
--[[  calculate = function(self, card, context)
    if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
      return { dollars = card.ability.extra.dollars, extra = { func = function()local my_pos = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          my_pos = i
          break
        end
      end
      local target_card = G.jokers.cards[my_pos]
      return true
      end,
    }
  }
    end
  end ]]
}