//
//  SubOA.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI


struct SubOA: View {
    
    struct SubOA {
        var descript: String
        var done: Bool
    }
    
    @State var items: [SubOA] = [
        SubOA(descript: "ddd0", done: true),
        SubOA(descript: "ddd1", done: true),
        SubOA(descript: "ddd2", done: true),
        SubOA(descript: "ddd0", done: true),
        SubOA(descript: "ddd1", done: true),
        SubOA(descript: "ddd2", done: true),
        SubOA(descript: "kjvnkdjnvkdjfnkjdf", done: true),
        SubOA(descript: "ddd1", done: true),
        SubOA(descript: "ddd2", done: true),
        SubOA(descript: "ddd0", done: true),
        SubOA(descript: "ddd1", done: true),
        SubOA(descript: "ddd2", done: true)
        
    ]

   let columns = [
    GridItem(.adaptive(minimum: 250))
   ]
    
    
    var body: some View {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0...(items.count - 1), id: \.self) { i in
                            
                            HStack {

                                Image(items[i].done ? "checkedsquare" : "square")
                                    .onTapGesture {
                                        items[i].done = changeValue(val: items[i].done)

                                    }
                                TextField("nome da oa", text: $items[i].descript)
                                    .fixedSize(horizontal: false, vertical: true)
//                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .textFieldStyle(.plain)
                                    .foregroundColor(.black)


                            } .padding()
//                                .frame(width: 150)
                                .background(Color.white)
                                .border(.black.opacity(0.1))
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.1), radius: 5)
                            
                    
                        }
                    }
                    .frame(maxWidth: 952)
        
    }
}

func changeValue(val: Bool) -> Bool {
    let newVal = !val
    
    return newVal
}

struct SubOA_Previews: PreviewProvider {
    static var previews: some View {
        @State var c = false
        SubOA()
    }
}
