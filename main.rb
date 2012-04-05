require "./pokerHand.rb"

hand = PokerDeck.new
handCount = [0,0,0,0,0,0,0,0,0,0]
pCount =  [0,0,0,0,0,0,0,0,0,0]
e = hand.possibleHands(11)
hands = 0
e.each do |hand|
  currentHand = PokerHand.new(hand)
  hands = hands + 1
  handCount[currentHand.to_i] = handCount[currentHand.to_i]+ 1
  if hands % 1_000_000 == 0
    (0...12).each do |i|
      temp =  handCount[i].to_f / hands.to_f
      temp = temp * 100.00
      pCount[i] = temp.round(2)
    end

    puts "hand #" + hands.to_s + "| Nothing-" + pCount[0].to_s + "% AceHigh-" + pCount[1].to_s  + "% Pair-" +
             pCount[2].to_s + "% JacksOrBetter-" + pCount[3].to_s  + "% ThreeOfAKind-" + pCount[4].to_s + "% Strait-" +
             pCount[5].to_s + "% Flush-" + pCount[6].to_s + "% FourOfAKind-" + pCount[7].to_s + "%"
  end


end
