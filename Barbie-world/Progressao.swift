//
//  Progressao.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct Progressao: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Progressão")
                .font(.system(size: 24))
                .fontWeight(.bold)
            
            Rectangle()
                .frame(height: 52)
                .cornerRadius(10)
//                    .border(Color.white, width: 1)
                .opacity(0.6)
        }
        .frame(width: 952, height: 202)
    }
}

struct Progressao_Previews: PreviewProvider {
    static var previews: some View {
        Progressao()
    }
}
