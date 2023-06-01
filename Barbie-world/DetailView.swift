//
//  DetailView.swift
//  Barbie-world
//
//  Created by sofiadinizms on 26/05/23.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
                
            VStack(alignment: .center){
                    NomeDaOA()
//                    Spacer()
                    SubOAItems()
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
