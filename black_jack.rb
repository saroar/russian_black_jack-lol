# Black Jack
require 'pry'

def calculate_total(cards)
  arr = cards.map { |card| card[1] }

  total = 0
    arr.each do |value|
      if value == "Ace"
        total += 11
      elsif value.to_i == 0 # J, Q, K
        total += 10
      else
        total += value.to_i
      end
    end

    # correct for Aces
    arr.select { |e| e == "Ace" }.count.times do
    total -= 10 if total > 21
  end
    total
end


# Start game

puts "----- Weclome to Black Jack -----"
puts "Whats you name ?"

name = gets.chomp.capitalize

puts "Nice to meet you #{name}. Let's play some Blackjack!"
puts ""

suits = %w[Heart Diamond Spade Club]

cards = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King]


puts ".....Shuffling cards....."
5.times do
  print "....."
  sleep 0.3
end

deck = suits.product(cards)
deck.shuffle!

# Deal cards

my_cards = []
dealear_cards = []

2.times do
  my_cards << deck.pop
  dealear_cards << deck.pop
end

dealer_total = calculate_total(dealear_cards)
my_total = calculate_total(my_cards)

# Showing the cards

begin
  puts "\n\nDealer's cards: "
  puts "=> #{dealear_cards[0].join(" of ")}"
  puts "=> other card in hidden"
  puts ""

  puts "#{name}'s Cards"
  my_cards.each do |card|
  puts "=> #{card[0]} of #{card[1]}"
  end
  puts "#{name}'s total is: #{my_total}"
  puts ""

# Player Card
if my_total == 21
  puts "Congratulation #{name} HIT blackjack! #{name} you win"
  exit
end

while my_total < 21
<<<<<<< HEAD
  puts "What #{name} like to do? Hit/Stay => click (h/s?) and enter."
=======
  puts "What #{name} like to do? Hit/Stay => click (h/s?) and enter!"
>>>>>>> 1e1efb3605d13599e27564080b8d86a798876342
  hit_or_stay = gets.chomp.downcase

  if !['h', 's'].include?(hit_or_stay)
    puts "Error! #{name} must enter only H/S"
    next
  end

  if hit_or_stay == "s"
    puts "#{name} choose stay"
    puts ""
    break
  end

  #hit
  new_card = deck.pop
  puts "Dealing card to player"
  puts "=> #{new_card.join(" of ")}"
  puts "=> other card is hidden "
  my_cards << new_card
  my_total = calculate_total(my_cards)
  puts ""
  puts "#{name}'s cards"
  puts "=> #{new_card.join(" of ")}"
  puts "#{name} your total is now: "
  puts "=> #{my_total}"

#Buest

  if my_total == 21
    puts "Congratulation #{name} HIT blackjack! #{name} you win!"
    elsif my_total > 21
    puts "Sorry, it looks like #{name} you buested"
    exit
  end
end


# Dealer turn
  if dealer_total == 21
    puts "Sorry, dealer hit blackjack #{name} you lose!"
    exit
  end

while dealer_total < 17
# Hit
  new_card = deck.pop
  puts "Dealing new card for dealer: "
  puts "=> #{new_card.join(" of ")}"
  dealear_cards << new_card
  dealer_total = calculate_total(dealear_cards)
  puts "Dealer toatal is now: #{dealer_total}"
  puts ""

  if dealer_total == 21
    puts "Sorry,Dealer hit blackjack, #{name} you lose"
    exit
  elsif dealer_total > 21
    puts "Congratulation,dealer buested! #{name} you win!"
    exit
  end
end

# compare hands
  puts "Dealer's cards: "
  dealear_cards.each do |card|
  puts "=> #{card[0]} of #{card[1]}"
  end
  puts "The Dealer's total is #{dealer_total}"
  puts ""

  puts "#{name} cards: "
  my_cards.each do |card|
  puts "=> #{card[0]} of #{card[1]}"
  end
  puts "#{name}'s total is #{my_total}"
  puts ""


  if dealer_total > my_total
    puts "Sorry, dealer win!"
    elsif dealer_total < my_total
    puts "Congratulation #{name} you wins!"
    else
    puts "Its tie!"
  end
end

puts "\nThanks for playing black jack #{name}"
