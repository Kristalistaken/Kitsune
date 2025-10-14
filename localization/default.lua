return {
    descriptions = {
        Joker = {
            j_fox_kitsune = {
                name = "Kitsune",
                text = {
--                    'Has a {C:green}#3# in #4#{} chance to gain',
					'This Joker gains {X:red,C:white}X0.5{} mult',
                    'every {C:attention}9{} {C:inactive}[#2#]{} {C:attention}9{}s played',
                    '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}mult){}'
        }
            },
            j_fox_balancedjoker = {
                name = "Balanced Joker",
                text = {
                    'Has a {C:green}#1# in #2#{} chance for {C:red}+3600{} mult',
                    '{C:inactive}(Always is Eternal and {C:dark_edition}Negative{}{C:inactive}){}'
        }
            },
            j_fox_blankcanvas = {
                name = "Blank Canvas",
                text = {
                    'Copies the effect of editions it',
                    'has or had, always has an edition',
                    '{C:inactive}(Currently {}{C:blue}+#1#{}{C:inactive} chips, {}{C:red}+#2#{}{C:inactive} mult,{}',
                    '{X:red,C:white}X#3#{}{C:inactive} mult, {}{C:dark_edition}+#4#{}{C:inactive} Joker slots){}'
        }
            },
            j_fox_armed = {
                name = "Armed and Dangerous",
                text = {
                    'Each retrigger on a card gives {X:red,C:white}X1.1{}',
                    'mult when scored, this is increased by',
                    '{X:red,C:white}X0.1{} mult for each retriggered',
                    'card, resets after the hand is scored'
        }
            },
            j_fox_loan = {
                name = "Loan Shark",
                text = {
                    'Gain {C:money}$50{} on pickup,',
                    'lose {C:money}$100{} when sold'
        }
            },
            j_fox_singing = {
                name = "Singing Machine",
                text = {
                    'When {C:attention}Boss Blind{} is selected, this',
                    'Joker has a {C:green}#1# in #2#{} chance to',
                    '{C:attention}destroy{} all other {C:attention}Jokers{} and to',
                    'permanently copy their abilities',
        }
            }
        },
    },
}