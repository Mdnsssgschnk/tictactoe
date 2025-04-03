//
//  makeCell.swift
//  tictactoe
//
//  Created by Виктория Мирошник on 06.09.2024.
//

import Foundation
import SwiftUI

struct CongratulationsView: View {
    let winner: Sign
    var body: some View {
        HStack {
            Text("\(winner) WINS")
                .bold()
            Image(systemName: "heart.fill")
        }
        .foregroundColor(Color.accentColor)
        .font(.title).fontDesign(.rounded)
        .padding()
        .frame(width: 350, height: 70)
        .overlay {
            RoundedRectangle(cornerRadius: 50)
                .strokeBorder(Color.accentColor, lineWidth: 5)
        }
        
        
    }
}

#Preview {
    CongratulationsView(winner: .X)
}
