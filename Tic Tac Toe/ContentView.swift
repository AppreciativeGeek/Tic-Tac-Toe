//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by James on 7/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = Array(repeating: "", count: 9)
    @State private var xTurn = true
    @State private var gameOver = false
    @State private var winMessage = ""
    
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
                        Color.gray
                            .opacity(moves[index] == "" ? 1 : 0)
                        Image(systemName: moves[index])
                            .font(.system(size: 90, weight: .bold))
                    }
                    .frame(width: 120, height: 120, alignment: .center)
                    .cornerRadius(30)
                    .onTapGesture {
                        withAnimation(Animation.default) {
                            if moves[index] == "" {
                                moves[index] = xTurn ? "multiply" : "circle"
                                xTurn.toggle()
                            }
                        }
                    }
                    .rotation3DEffect(
                        .init(degrees: moves[index] != "" ? 180 : 0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                }
            })
        }
        .preferredColorScheme(.dark)
        .alert(isPresented: $gameOver, content: {
            Alert(title: Text(winMessage))
        })
        .onChange(of: moves, perform: { value in
            checkForWinner()
        })
    }
    
    private func checkForWinner() {
        if moves[0] != "" && moves[0] == moves[1] && moves[1] == moves[2] {
            var winner = ""
            if moves[0] == "multiply" {
                winner = "X"
            } else if moves[0] == "circle" {
                winner = "O"
            }
            winMessage = "\(winner) is the winner!"
            gameOver = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
