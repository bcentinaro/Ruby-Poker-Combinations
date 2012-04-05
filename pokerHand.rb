class PokerDeck
  @@deckValue = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
  @@deckSuits = ["C","D","H","S"]
  @deck = Array.new

  def initialize
    @deck = []
    @@deckSuits.each do |cardSuit|
      @@deckValue.each do |cardValue|
        card = PokerCard.new(cardValue, cardSuit)
          @deck.push(card)
      end
    end
  end

  def possibleHands(cards)
    e = @deck.combination(cards)
    return e
  end
end

class PokerCard
  @value=""
  @suit=""
  def initialize (val, suit)
    @value = val
    @suit = suit
  end
  def getValue
    return @value
  end
  def getSuit
    return @suit
  end
  def toString
    return @value + @suit
  end
end

class PokerHand
  @hand
  @@deckValue = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
  @@deckSuits = ["C","D","H","S"]
  @flush = false
  @strait = false
  @jacksOrBetter = false
  @pair = false
  @twoPair = false
  @aceHigh = false
  @threeOfAKind = false
  @fourOfAKind = false
  def initialize (cards)
    @hand = cards
    suitCount = [0,0,0,0]
    faceCount = [0,0,0,0,0,0,0,0,0,0,0,0,0]

    @hand.each do |card|
      #checking for flush

      suit = 0
      case card.getSuit
        when "C"
          suit=0
        when "D"
          suit=1
        when "H"
          suit=2
        when "S"
          suit=3
      end
      suitCount[suit] = suitCount[suit] + 1
      if suitCount[suit] == 5
        @flush = true
      end


      #checking for pair/three of a kind/full house / strait
      face=0
      case card.getValue
        when "2"
          face=0
        when "3"
          face =1
        when "4"
          face =2
        when "5"
          face=3
        when "6"
          face=4
        when "7"
          face=5
        when "8"
          face=6
        when "9"
          face=7
        when "10"
          face=8
        when "J"
          face=9
        when "Q"
          face=10
        when "K"
          face=11
        when "A"
          face=12
      end
      faceCount[face]= faceCount[face] + 1
      if face == 12
        @aceHigh= true
      end
      if faceCount[face] == 4
        @fourOfAKind= true
      end
      if faceCount[face] == 3
        @threeOfAKind= true
      end
      if faceCount[face] == 2 and face > 8
        @jacksOrBetter = true
      end

      if faceCount[face] == 2 and @pair
        @twoPair = true
      end
      if faceCount[face] == 2
        @pair = true
      end
    end


    maxStrait = 0
    current = 0
    (0...12).each do |i|
      if faceCount[i] > 0
        current = current + 1
      else
        current = 0
      end

      if current > maxStrait
        maxStrait = current
      end


    end
    if maxStrait >= 5
      @strait = true
    end



  end

  def to_s


    if @fourOfAKind
      return "Four of a kind"
    end

    if @flush
      return "Flush"
    end

    if @strait
      return "Strait"
    end

    if @threeOfAKind
      return "Three of a kind"
    end

    if @jacksOrBetter
      return "Jacks or better"
    end

    if @pair
      return "Pair"
    end

    if @aceHigh
      return "Ace High"
    end
    return "Nothing"
  end

  def to_i


    if @fourOfAKind
      return 7
    end

    if @flush
      return 6
    end

    if @strait
      return 5
    end

    if @threeOfAKind
      return 4
    end

    if @jacksOrBetter
      return 3
    end

    if @pair
      return 2
    end

    if @aceHigh
      return 1
    end
    return 0
  end
end
