//
//  game.swift
//  tictactoe
//
//  Created by Виктория Мирошник on 03.09.2024.
//

import Foundation
import SwiftUI

enum Sign: String {
    case X
    case O
}

class GameRules: ObservableObject {

    @Published public private(set) var field: [Sign?] =
    [nil, nil, nil,
     nil, nil, nil,
     nil, nil, nil]
    
  
    private var currentTurn: Sign = .X
    func makeTurn (index: Int) {
        if field[index] == nil {
            field[index] = currentTurn
            if currentTurn == .X {
                currentTurn = .O
            } else {
                currentTurn = .X
            }
        }
    }
    
    func checkWin (cellIndex: Int) -> Sign? {
        let row = cellIndex / 3
        let column = cellIndex % 3
        let firstRowIdx = row * 3
        let checkRow = field[firstRowIdx] == field[firstRowIdx + 1] &&
            field[firstRowIdx] == field[firstRowIdx + 2]
        
        let firstColumnIdx = column
        let checkColumn = field[firstColumnIdx] == field[firstColumnIdx + 3] &&
            field[firstColumnIdx] == field[firstColumnIdx + 6]
        
        let checkLeftDiagonal = column == row &&
            field[0] == field[4] && field[0] == field[8];
        
        let checkRightDiagonal = column == (2 - row) &&
            field[2] == field[4] && field[2] == field[6]
        
        if checkRow || checkColumn || checkLeftDiagonal || checkRightDiagonal {
            return field[cellIndex]
        }
        return nil
    }
    
    func startNewGame() {
        field = [nil, nil, nil,
                 nil, nil, nil,
                 nil, nil, nil]
        currentTurn = .X
    }
}
