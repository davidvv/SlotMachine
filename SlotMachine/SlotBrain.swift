//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by David Vences Vaquero on 1/5/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import Foundation

class SlotBrain {
    
    class func unpackSlotIntoSlotRows (slots:[[Slot]]) -> [[Slot]] {
        var slotRow1: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots { //Por qué no declara slotArray? está declarada en Factory y con eso nos vale? Vamos a ejecutar esto en Factory? por qué no da error?
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                switch index {
                case 0: slotRow1.append(slot)
                case 1: slotRow2.append(slot)
                case 2: slotRow3.append(slot)
                default: println("Error")
                }
            }
        }
        var slotsInRows: [[Slot]] = [slotRow1, slotRow2, slotRow3]
        return slotsInRows
    }
    
    class func computeWinnings (slots: [[Slot]]) -> Int {
        var slotsInRows = unpackSlotIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var straightWinCount = 0
        var threeOfAKindWinCount = 0
        
        
        for slotRow in slotsInRows {
            if checkFlush(slotRow) == true {
                println("flush")
                winnings += 1
                flushWinCount += 1
            }
            
            if checkThreeInARow(slotRow) == true {
                println("Three in a row")
                winnings += 1
                straightWinCount += 1
            }
            if checkThreeOfAKind(slotRow) == true {
                println("Three of a kind")
                winnings += 3
                threeOfAKindWinCount += 1
            }
        
        }
        
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
        }
        if straightWinCount == 3{
            println("Epic Straight")
            winnings += 1000
        }
        if threeOfAKindWinCount == 3 {
            println("Threes all around!")
            winnings += 50
        }
        
        return winnings
    }
    
    class func checkFlush (slotRow:[Slot]) -> Bool {
        if slotRow[0].isRed == true && slotRow[1].isRed == true && slotRow[2].isRed == true {
            return true
        }
        else if slotRow[0].isRed == false && slotRow[1].isRed == false && slotRow[2].isRed == false {
            return true
        }
        else{
            return false
        }
    }
    
    class func checkThreeInARow(slotRow: [Slot]) -> Bool {
        if slotRow[0].value == slotRow[1].value - 1 && slotRow[1].value == slotRow[2].value - 1 {
            return true
        }
        else if slotRow[0].value == slotRow[1].value + 1 && slotRow[1].value == slotRow[2].value + 1 {
            return true
        }
        else{
            return false
        }
    }
    
    class func checkThreeOfAKind (slotRow: [Slot]) -> Bool {
        if slotRow[0].value == slotRow[1].value && slotRow[0].value == slotRow[2].value{
            return true
        }
        else {
            return false
        }
    }
    
}