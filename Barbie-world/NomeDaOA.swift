//
//  NomeDaOA.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct NomeDaOA: View {
    let emojis = ["🖌️", "👩‍🎨", "🧑‍🎨", "🧑‍💻", "👩‍💻", "🎯", "🧩", "🥇", "🏆", "🥈", "🏅", "🎖️", "🥉", "🎲", "💰", "💸", "💡", "🕯️", "⏰", "📈", "📅", "📁", "🧷", "📎", "📌", "📏", "📒", "🔍", "📝", "✏️", "🗳️", "❤️‍🔥", "🩷", "💘", "💖", "💝", "💚", "💛", "🧡", "❤️", "🩵", "💙", "💜", "🖤", "🩶", "🤍", "🤎", "✅", "🔊", "💬", "🕐", "🥰", "😍", "😌", "😘", "🤫", "😬", "😀", "😄", "😊", "😃", "😉", "🙂", "😅", "🥰", "😍", "🤩", "😎", "🤗", "😘", "😚", "😋", "🤪", "😜", "🤓", "😛", "🥳", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🦆", "🦉", "🐝", "📚", "🎓", "🖊", "✏️", "📝", "📖", "📓", "📔", "📒", "📕", "📗", "📘", "📙", "🎒", "🧮", "📏", "📐", "📚", "📝", "🔍", "📚", "🎓", "🖊", "✏️", "📝", "📖", "📓", "📔", "📒", "📕", "📗", "📘", "📙", "🎒", "🧮", "📏", "📐", "💼", "💻", "📎", "📋", "📁", "📂", "📌", "📚", "📝"]
    
    
    @State private var randomEmoji = "😬"
    @State private var textFields1: String = ""
    @State private var textFields2: String = ""
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .opacity(0.3)
                    .frame(width: 952, height: geometry.size.width*0.4)
                    .cornerRadius(16)
                    .border(Color.gray, width: 1)
                    
                
                
                VStack(alignment: .leading){
                    HStack(alignment: .bottom) {
                        Text(randomEmoji)
                            .font(.system(size: 68))
                        
                        Button(action: {
                            randomEmoji = emojis.randomElement() ?? ""
                        }) {
                            Image("button random")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 34,height:34)
                            
                        }
                        .padding(.bottom, 3)
                        .buttonStyle(PlainButtonStyle())
                    }
                    TextField("Nome da OA", text: $textFields1)
                        .textFieldStyle(PlainTextFieldStyle())
                        .font(.system(size: 32))
                        .foregroundColor(.black)
                    TextField("Descrição do objetivo de aprendizado", text: $textFields2)
                        .textFieldStyle(PlainTextFieldStyle())
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    
                }
                .padding(.leading, 26)
                .padding(.top, 22)
                .padding(.bottom, 30)
                
                
            }
        }
        
        
        
        
    }}

struct NomeDaOA_Previews: PreviewProvider {
    static var previews: some View {
        NomeDaOA()
    }
}
