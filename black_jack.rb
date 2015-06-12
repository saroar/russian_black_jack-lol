# Black Jack

def calculate_total(cards)
    arr = cards.map { |e| e[1] }

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

suits = %w[Heart Diamond Spade Club]

cards = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King]


deck = suits.product(cards)
deck.shuffle!

# Deal cards


mycards = []
dealearcards = []

2.times do
  mycards << deck.pop
  dealearcards << deck.pop
end

dealertotal = calculate_total(dealearcards)
mytotal = calculate_total(mycards)

# Showing the cards

loop do
begin
puts "Dealer's cards: "
dealearcards.each do |card|
  puts "=> #{card[0]} of #{card[1]}"
end
puts "Dealer's total is : #{dealertotal}"

puts ""


puts "#{name}'s Cards"
mycards.each do |card|
  puts "=> #{card[0]} of #{card[1]}"
end
puts "#{name}'s total is: #{mytotal}"

puts ""

# Player Card



if mytotal == 21
  puts "Congratulation #{name} HIT blackjack! #{name} you win"
  system 'clear'
end

while mytotal < 21
  puts "What #{name} like to do? H/S?"
  hit_or_stay = gets.chomp.downcase

  if !['h', 's'].include?(hit_or_stay)
    puts "Error! #{name} must enter only H/S"
    next
  end

  if hit_or_stay == "s"
    puts "#{name} choose stay"
    break
  end

  #hit
  new_card = deck.pop
  puts "Dealing card to player: #{new_card} and total now #{dealertotal}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "#{name}  your total is now: #{mytotal}"

#Buest

  if mytotal == 21
    puts "Congratulation #{name} HIT blackjack! #{name} you win!"
  elsif mytotal > 21
    puts "Sorry, it looks like #{name} you buested"
  end

end


# Dealer turn

if dealertotal == 21
  puts "Sorry, dealer hit blackjack #{name} you  lose!"
  exit
end

while dealertotal < 17
  #hit
  new_card = deck.pop
  puts "Dealing new card for dealer: #{new_card}"
  dealearcards << new_card
  dealertotal = calculate_total(dealearcards)
  puts "Dealer toatal is now: #{dealertotal}"

  if dealertotal == 21
    puts "Sorry,Dealer hit blackjack, #{name} you lose"
    exit
  elsif dealertotal > 21
    puts "Congratulation,dealer buested! #{name} you win!"
    puts "#{name}  your total is now: #{mytotal}"
    exit
  end
end



# compare hands

puts "Dealer's cards: "
dealearcards.each do |card|
  puts "=> #{card}"
end
puts ""

puts "#{name} cards: "
mycards.each do |card|
  puts "=> #{card}"
  puts "#{name}  your total is now: #{mytotal}"
end
puts ""

if dealertotal > mytotal
  puts "Sorry, dealer win!"
elsif dealertotal < mytotal
  puts "Congratulation #{name} you wins!"
else
  puts "Its tie!"
end

puts "#{name} would you like to play again ? YES(y) or NO(n)"
 break unless gets.chomp.downcase == 'y'
 system 'clear'
 end

end

puts "Thanks for play with us see u next time until have good time :)"