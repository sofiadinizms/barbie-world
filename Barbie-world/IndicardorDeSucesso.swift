//
//  IndicardorDeSucesso.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct IndicardorDeSucesso: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Indicadores de Sucesso")
                .font(.system(size: 24))
                .fontWeight(.bold)
            HStack{
                
                NovoIndicador()
                    .padding(.trailing)
                
                Button(action: {
                    //
                }) {
                    Text("􀅼  Criar novo")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        
                        
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 177, height: 52)
                .background(Color.white)
                .opacity(0.3)
    //            .border(Color.white, width: 1)
                .cornerRadius(10)
                Spacer()
            }
        }
        .frame(width: 952, height: 202)
        
    }
}
struct NovoIndicador: View {
    @State private var text: String = ""
    
    var body: some View {
        HStack{
            ZStack{
                Rectangle()
                    .frame(height: 52)
                    .cornerRadius(10)
//                    .border(Color.white, width: 1)
                    .opacity(0.6)
               
                HStack{
                    Text("🎯")
                        .font(.largeTitle)
                        .padding(.leading, 24)
                    
                    TextField("Indicador de sucesso", text: $text)
                        .textFieldStyle(PlainTextFieldStyle())
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
            }

        }
                
    }
}

struct IndicardorDeSucesso_Previews: PreviewProvider {
    static var previews: some View {
        IndicardorDeSucesso()
    }
}
