//: Playground - noun: a place where people can play

import UIKit

var suits : [String] = ["♥️","♠️","♦️","♣️"]
var ranks : [String] = ["2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"]

func getDeck(suits : [String],ranks : [String]) -> [(suit : String,rank : String)]{
    var deck : [(suit : String, rank : String)] = []
    for suit in suits{
        for rank in ranks{
            deck.append((suit: suit, rank: rank))
        }
    }
    return deck
}

var completeDeck = getDeck(suits: suits, ranks: ranks)
print("Complete Deck: \(completeDeck)")

func getRandomCard(from deck : [(suit : String,rank : String)]) -> (suit : String,rank : String){
    let randIndex = Int(arc4random_uniform(UInt32(deck.count)))
    return deck[randIndex]
}

print("Random Card: \(getRandomCard(from: completeDeck))")

func shuffleDeck(deck : [(suit : String,rank : String)]) -> [(suit : String,rank : String)]{
    var deconstructedDeck = deck
    var shuffledDeck : [(suit : String,rank : String)] = []
    
    while deconstructedDeck.count > 0 {
        shuffledDeck.append(deconstructedDeck.remove(at: Int(arc4random_uniform(UInt32(deconstructedDeck.count)))))
    }
    return shuffledDeck
}
var shuffledDeck = shuffleDeck(deck: completeDeck)
print("Shuffled Deck : \(shuffledDeck)")

func sumOfDeck(of deck : [(suit : String,rank : String)]) -> Int{
    var sum = 0
    for (_,rank) in deck{
        sum += getCardNumericValue(for: rank)
    }
    return sum
}

func getCardNumericValue(for rank : String) -> Int{
    var value = 0
    switch rank {
    case "Jack":
        value = 11
    case "Queen":
        value = 12
    case "King":
        value = 13
    case "Ace":
        value = 14
    default:
        value = Int(rank) ?? 0 //This is acceptable as long as we know the "deck" argument is valid and does not contain any invalid data.
    }
    return value
}

print("Sum of Deck: \(sumOfDeck(of: completeDeck))")

func getCardDictionary(for deck : [(suit : String,rank : String)]) -> [String : Int]{
    var cardDictionary : [String : Int] = [:]
    for (suit,rank) in deck{
        let cardName = "\(rank) of \(suit)"
        let cardValue = getCardNumericValue(for: rank)
        cardDictionary[cardName] = cardValue
    }
    return cardDictionary
}

var cardDictionary = getCardDictionary(for: completeDeck)

print("Card Dictionary: \(cardDictionary)")



