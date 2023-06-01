//
//  TelaDaOA.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct TelaDaOA: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
                
            VStack(alignment: .center){
                    NomeDaOA()
//                    Spacer()
                    SubOA()
//                    Spacer()
                    IndicardorDeSucesso()
//                    Spacer()
                    Progressao()
                    Spacer()
//                    
                }
        }
    }
}

struct TelaDaOA_Previews: PreviewProvider {
    static var previews: some View {
        TelaDaOA()
            
    }
}

