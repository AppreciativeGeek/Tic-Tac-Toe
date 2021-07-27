//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by James on 7/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = Array(repeating: "", count: 9)
    
    var body: some View {
        VStack {
            // Title Text
            Text("Tic Tac Toe")
                .font(.title)
                .bold()
                .padding()
            // LazyVGrid, stores the tic tac toe board.
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: 15), count: 3), spacing: 15, content: {
                // For loop that displays each grid on the tic tac toe board.
                ForEach(0 ..< 9) { index in
                    ZStack {
                        Color.blue
                            .frame(width: 120, height: 120, alignment: .center)
                            .cornerRadius(30)
                        Image(systemName: moves[index])
                            .font(.system(size: 90, weight: .bold))
                    }
                    .frame(width: 120, height: 120, alignment: .center)
                    .cornerRadius(30)
                    .onTapGesture {
                        moves[index] = "multiply"
                    }
                }
            })
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
