//
//  NomeDaOA.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct OAname: View {
    let emojis = ["🖌️", "👩‍🎨", "🧑‍🎨", "🧑‍💻", "👩‍💻", "🎯", "🧩", "🥇", "🏆", "🥈", "🏅", "🎖️", "🥉", "🎲", "💰", "💸", "💡", "🕯️", "⏰", "📈", "📅", "📁", "🧷", "📎", "📌", "📏", "📒", "🔍", "📝", "✏️", "🗳️", "❤️‍🔥", "🩷", "💘", "💖", "💝", "💚", "💛", "🧡", "❤️", "🩵", "💙", "💜", "🖤", "🩶", "🤍", "🤎", "✅", "🔊", "💬", "🕐", "🥰", "😍", "😌", "😘", "🤫", "😬", "😀", "😄", "😊", "😃", "😉", "🙂", "😅", "🥰", "😍", "🤩", "😎", "🤗", "😘", "😚", "😋", "🤪", "😜", "🤓", "😛", "🥳", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🦆", "🦉", "🐝", "📚", "🎓", "🖊", "✏️", "📝", "📖", "📓", "📔", "📒", "📕", "📗", "📘", "📙", "🎒", "🧮", "📏", "📐", "📚", "📝", "🔍", "📚", "🎓", "🖊", "✏️", "📝", "📖", "📓", "📔", "📒", "📕", "📗", "📘", "📙", "🎒", "🧮", "📏", "📐", "💼", "💻", "📎", "📋", "📁", "📂", "📌", "📚", "📝"]
    
    
    @State private var randomEmoji = "😬"
    @State private var textFields1: String = ""
    @State private var textFields2: String = ""
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 952, height: 202)
                .cornerRadius(16)
            
                
            
            
            
            
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
                Spacer()
                TextField("Nome da OA", text: $textFields1)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 32))
                    .foregroundColor(.black)
                TextField("Descrição do objetivo de aprendizado", text: $textFields2)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.bottom, 26)
                
            }
            .padding(.leading, 26)
            
            
        }
        .frame(width: 952, height: 202)
        .padding(.top, 84)
        .shadow(color: Color.black.opacity(0.1), radius: 5)
        
        
        
    }}

struct NomeDaOA_Previews: PreviewProvider {
    static var previews: some View {
        OAname()
    }
}
