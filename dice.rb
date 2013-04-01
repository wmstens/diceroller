
class String
   def pluralize
      if self[self.length] == 'y'
         self.chop + "ies"
      else
         self + "'s"
      end
   end
end

def rollShips ( shipType, hitScore, hits )
   puts "How many #{shipType.pluralize}?:"
   numShip = Integer(gets.chomp)
   hits.times do
      numShip.times do
         if rand(@dice) > hitScore
            puts "Hit" 
         else
            puts "No Hit"
         end
      end
   end
end
puts "What type of dice is being rolled? (normal = 6, deca = 10)"
@dice = gets.chomp
if @dice.to_i == 0 then
   @dice = 6 if @dice == "normal"
   @dice = 10 if @dice == "deca"
end
@dice = @dice.to_i

puts "Hit on high or low?"
hitHigh = gets.chomp[0]
if hitHigh == 'h' then hitHigh = 1 else hitHigh = 0 end

puts "What type of units do you have, separate by space?"
inshipList = gets.chomp()
shipList = inshipList.split(' ')
ships = Hash.new
shipList.each do |i|
   puts "What does a #{i} hit on?"
   ships[i] = gets.chomp.to_i
end

shipList.each do |i|
   puts "How many shots does a #{i} get?"
   rollShips( i, ships[i], gets.chomp.to_i )
end

# class SHIPLIST
#    attr_accessor :list, :hitcount
   
#    def initialize(pdsnum,fighternum,carriernum,cruisernum,destroyernum,dreadnoughtnum,warsunnum)
#       @list = Hash[ "PDS" => pdsnum, "Fighter" => fighternum, "Carrier" => carriernum, "Destroyer" => destroyernum, "Dreadnought" => dreadnoughtnum, "War Sun" => warsunnum ]
#    end

#    def have ( shipType )
#       @list[shipType]
#    end
# end

# def main
   # #PDS FIRE
   # if ships.have( "PDS" ) > 0
      # defendList.have( "PDS" ).each { rollShips( "PDS's", 6, 1 ) }
   # end

   # #DESTROYER FIGHTER PRE FIRE
   # #need two lists for this obvi.
   # if defendList.have("Fighter") > 0 && attackList.have( "Destroyer" ) > 0
      # attackList.have( "Destroyer" ).each do
         # defendList.have("Fighter").each { rollShips( "Destroyer", 9, 1 ) }
      # end
   # end

   # #REGULAR BATTLE
   # while ships
      # if ships.have()      
   # end
# end

 
  # SPACE BATTLES
      # If the active system contains ships belonging to the
         # active player and ships belonging to an opponent, a
         # Space Battle must be fought. 
      # A Space Battle is fought over a consecutive number of
         # combat rounds until only ships of one player remain
         # (or the ships of both players have been simultaneously
         # destroyed).
      # Before Combat
         # Before the actual Space Battle begins, resolve any
         # pre-combat actions such as Destroyer Anti-Fighter
         # Barrage and then Sabotage Runs (the Sabotage
         # Run is an optional rule found on page 35).
      # Destroyer Anti-Fighter Barrage
         # Before the first round of Space Battle, roll two dice
         # for each Destroyer unit in the battle. For every result
         # equal to or higher than the Destroyer's combat value
         # (all combat values can be found on the unit table on
         # every player's Race Sheet), the opponent must take
         # one Fighter unit as an immediate casualty. Such eliminated Fighter units are removed immediately and
         # placed back among a player's reinforcements; they do
         # not receive return fire and will not participate in the
         # upcoming Space Battle.
         #
         # A fleet containing no Fighter units is unaffected by
         # pre-combat Destroyer fire.
      # The Battle Round
            # After finishing any "before combat" actions, continue
            # to the actual combat. A Space Battle always follows
            # the Space Battle Sequence:
         # The Space Battle Sequence
            # 1) Announce withdrawals/retreats 
            # 2) Roll combat dice 
            # 3) Remove casualties
            # 4) Execute withdrawals/retreats
         # After step 4, if both players still have ships remaining
         # in the system, repeat the Space Battle Sequence until
         # only one player has ships remaining, or all ships in
         # the system have been destroyed.
         # Below, each step of the Space Battle Sequence is
         # described in detail:
         # 1 ANNOUNCE ETREATS ITHDRAWALS
            # The attacker first has the option to announce his withdrawal from battle. If the attacker chooses not to
            # declare a withdrawal, then the defender may declare a
            # retreat. Note that if the attacker does decide to withdraw, the defender may not declare a retreat. 
            # Any actual withdrawals/retreats occur at the last step
            # of the combat phase. This means that all Space Battles
            # will have at least one round of combat. 
         # 2 ROLL OMBAT ICE
            # During this step, both players simultaneously roll one
            # combat die for every one of their spaceships in the
            # battle (with the exception of the War Sun, which rolls
            # three dice). For each result that is equal to or higher
            # than the combat value of its ship, a "hit" is scored (all
            # base combat values can be found on the unit table on
            # a player’s Race Sheet). Players must remember the
            # total number of successful hits as they move to the
            # next step.
            # Example: The attacking player has a fleet of three
            # Cruisers and one Dreadnought. During the first battle
            # round, he rolls for his attacking ships. He takes three
            # dice for the Cruisers (Combat Value 7) and rolls a 2,
            # 5, and 7 -- one  hit. Then he takes one die for his
            # Dreadnought and rolls a 6 -- a hit. The attacking
            # player announces that he has inflicted a total of two
            # hits on the defending fleet. The defending player has
            # two Fighters (supported by a Space Dock in the system) and one Destroyer. He takes two dice for the
            # Fighter units and rolls a 3 and a 5 -- both misses.
            # Then he takes one die for his Destroyer and rolls a 0
            # (a 10) a hit. The defending player announces that he
            # has inflicted one total hit on the attacking fleet
         # 3 REMOVE CASUALTIES
            # Each player must now take a number of casualties
            # equal to the number of hits scored by the opponent in
            # step 2.
            # First the attacking player removes his casualties. For
            # every casualty, he must destroy one of his ships of his
            # choice or damage one of his Dreadnoughts or War
            # Suns (if a damaged Dreadnought or War Sun receives
            # a second hit, it is destroyed). Destroyed ships are
            # placed among a player's reinforcements, and become
            # available for production once again. After the attacking player has removed all his casualties, the defending player must then remove his casualties.
            # Note that whenever a player removes casualties in TI,
            # the casualty is always determined by the affected
            # player. Since Fighters are the cheapest unit to produce, they make effective "cannon fodder" and are
            # thus typically among the first units to be chosen as
            # casualties.
            # Example: The defending player scored one hit. The
            # attacking player then chooses to damage his
            # Dreadnought (soaking up a casualty). The attacker
            # scored a total of two hits. The defending player chooses to remove two Fighter units as casualties and
            # places them back with his reinforcements.
         # 4. EXECUTE WITHDRAWALS/RETREATS
            # If the attacking player announced a withdrawal or the
            # defending player announced a retreat during step 1 of
            # the Space Battle Sequence, that player may now execute the withdrawal/retreat, following the rules below.
            # • A withdrawal or retreat is not allowed if, at this
               # point in the battle, the opposing player has no units
               # left in the system. Even if a player announced a withdrawal or retreat at the beginning of the combat
               # round, if he has somehow managed to destroy all the
               # opposing units, the withdrawal/retreat is cancelled and
               # the units must remain in the system.
            # • When executing a withdrawal or retreat, a player
               # must withdraw his entire fleet to an adjacent system
               # that has previously been activated by the withdrawing/retreating player. If a player has no previously activated systems adjacent to the contested system, he may not withdraw or retreat.
            # After a successful withdrawal or retreat, make sure
            # that the withdrawing/retreating player is still in compliance with his Fleet Supply (see rules for Fleet
            # Supply on page 21) and has sufficient Fighter capacity
            # (see the Fighter units description on page 29) in the
            # new system. If not, he must immediately destroy the
            # excess ships.
         # END OF A SPACE BATTLE
            # After the first Space Battle round is completed, if both
            # players still have surviving ships in the system, another Space Battle round begins. This continues until
            # only one player has ships in the system (or the ships
            # of both players have been eliminated). 
   # INVASION COMBAT
      # After the active player has landed one or more
      # Ground Force units during the Planetary Landings
      # step of a Tactical Action, an Invasion Combat must be
      # fought if the destination planet holds any enemy
      # Ground Force units.
      # Invasion Combat is executed almost identically to
      # Space Battle, with the notable exception that no withdrawals or retreats are allowed. 
      # BEFORE COMBAT
         # Before the actual Invasion Combat begins, players
         # must resolve pre-combat actions such as planetary
         # bombardments and defensive PDS fire.
         # Bombardments
            # Dreadnought and War Sun units in the activated system may bombard a planet before the player undertakes Invasion Combat (exception: a War Sun unit
            # may bombard a planet even if no Invasion Combat is
            # about to take place). Simply roll one combat die for
            # every Dreadnought, three for every War Sun, and
            # remove one enemy Ground Force on the contested
            # planet for every result equal to or higher than the
            # combat value of the bombarding unit. 
            # Remember that a Dreadnought may not bombard a
            # planet that contains at least one enemy PDS due to the
            # presence of a planetary shield. 
            # Ground Forces destroyed by bombardment are
            # removed immediately, do not receive return fire, and
            # will not participate in the upcoming Invasion Combat.
         # PDS Fire 
            # After the attacking player has finished his bombardment, the defending player may fire a single shot with
            # each PDS unit on the contested planet. The defending
            # player rolls a die for every PDS unit present, and for
            # every result equal to or greater than the combat value
            # of the PDS unit, an invading Ground Force is
            # destroyed. Attacking Ground Force units destroyed by
            # defending PDS do not receive return fire and will not
            # participate in the upcoming Invasion Combat.
      # THE INVASION COMBAT ROUND
         # After any bombardment and defensive PDS fire has
         # been resolved, the players proceed to the Invasion
         # Combat itself. Like a Space Battle, Invasion Combat
         # is fought over a series of consecutive combat rounds
         # until only one player's Ground Forces (or none)
         # remain.
         # To resolve an Invasion Combat round, follow the
         # Invasion Combat Sequence:
         # The sequence is here described in detail
            # 1) Roll Combat Dice
               # Both players simultaneously roll one die for every
               # friendly Ground Force unit on the planet. For every
               # result equal to or higher than the combat value of the
               # Ground Force unit, the player scores a "hit." Players
               # must remember their total number of successful hits
               # as they move to the next step.
            # 2) Remove Casualties
               # Each player must now take a number of Ground Force
               # unit casualties equal to the number of hits scored by
               # the opponent in step 1. Casualties are, as always,
               # returned to a player's reinforcement pile.
            # If, at this point, both players still have Ground Force
            # units remaining on the planet, another Invasion
            # Combat round is initiated. This continues until only
            # one (or no) player has Ground Force units left on the
            # planet.
         # Invasion Success?
            # If all defending Ground Forces were destroyed and at
            # least one attacking Ground Force survived the battle,
            # the invasion is a success. All defending PDS units and
            # any Space Dock on the planet are immediately
            # destroyed. The attacking player then claims the Planet
            # Card from the previous owner and places it, exhausted, into his play area.
            # Since combat is simultaneous, it is possible that all
            # the Ground Forces on both sides were destroyed. If
            # this is the case, the defending player retains control
            # over the planet and simply places one of his Control
            # Markers on the vacant planet to indicate this.