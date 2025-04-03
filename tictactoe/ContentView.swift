//
//  ContentView.swift
//  tictactoe
//
//  Created by Виктория Мирошник on 30.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameRules = GameRules()
    @State private var winner: Sign? = nil
    
    func makeCell(_ row: Int, _ column: Int) -> some View {
        RoundedRectangle(cornerRadius: 3).foregroundColor(.white)
            .overlay {
                let idx = (row * 3) + column
                Button {
                    gameRules.makeTurn(index: idx)
                    winner = gameRules.checkWin(cellIndex: idx)
                }
                label: {
                    if gameRules.field[idx] != nil {
                        Image(gameRules.field[idx]!.rawValue)           .resizable()
                    } else {
                        Text(" ").frame(width: 80, height: 80)
                    }
                }
                .disabled(winner != nil)
                .frame(width: 80, height: 80)
            }
    }
    
    var body: some View {
        Spacer(minLength: 140)
        VStack (alignment: .center, spacing: 23) {
            Grid (alignment: .center, horizontalSpacing: 2, verticalSpacing: 2) {
                ForEach (0..<3) { row in
                    GridRow {
                        ForEach (0..<3) { column in
                            makeCell(row, column)
                        }
                    }
                }
            }
            .frame(width: 350, height: 350)
            .padding(2)
            .background(Color.black)
            
            Button {
                gameRules.startNewGame()
                winner = nil
            }
        label: {
            RoundedRectangle(cornerRadius: 50)
                .overlay {
                    Text("NEW GAME")
                        .foregroundStyle(Color(.white))
                        .font(.title)
                        .fontDesign(.rounded)
                        .bold()
                }
                .frame(width: 350, height: 70)
        }
            if winner != nil {
                CongratulationsView(winner: winner!)
            }
            Spacer()
        }
        .padding()
    }
}




#Preview {
    ContentView()
}
