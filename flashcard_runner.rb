# Header Files
require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'

# Make the Cards
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("What is 20 + 51", "71", :Math)
card_3 = Card.new("What is the largest planet in our solar system?", "Jupiter", :Space)
card_4 = Card.new("What is the capital of Canada?", "Ottawa", :Geography)
card_5 = Card.new("What is five cubed?", "125", :Math)
card_6 = Card.new("What is the hottest planet in our solar system?", "Venus", :Space)
card_7 = Card.new("How many US state capitals are West of Los Angeles?", "6", :Geography)
card_8 = Card.new("What is the smallest perfect number? (A positive integer that is equal to the sum of its proper divisors)", "6", :Math)
card_9 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :Space)
card_10 = Card.new("What US state was Grant born in?", "Texas", :Bonus)

# Create the Deck & Round
cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10]
deck = Deck.new(cards)
round = Round.new(deck)

# Welcome
puts " "
puts "Welcome to Grant's Game!"
puts "10 questions, 10 answers - how will you fare?"
puts "---------------------------------------------"

# Game
counter = 1
deck.count.times do
    puts " "
    puts "Card #{counter}: #{round.current_card.question}"
    guess = gets.chomp
    new_turn = round.take_turn(guess)
    puts new_turn.feedback?
    counter += 1
end

# Exit & Summary
puts " "
puts "Game Over! Let's see how you did..."
puts " "
puts "Game Summary:"
puts "-------------"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
puts "Math - #{round.percent_correct_by_category(:Math)}% correct"
puts "Space - #{round.percent_correct_by_category(:Space)}% correct"
puts "Bonus - #{round.percent_correct_by_category(:Bonus)}% correct"
puts " "
puts "See you next time!"
puts " "