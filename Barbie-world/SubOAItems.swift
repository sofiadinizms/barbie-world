//
//  SubOA.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct SubOAItems: View {
    
    struct SubOA {
      var descript: String
      var done: Bool
    }

    @State var items: [SubOA] = [
      SubOA(descript: "ddd0", done: true),
      SubOA(descript: "ddd1", done: true),
      SubOA(descript: "ddd2", done: true),
      SubOA(descript: "ddd3", done: true),
      SubOA(descript: "ddd4", done: false),
      SubOA(descript: "ddd4", done: false),
      SubOA(descript: "ddd4", done: false),
      SubOA(descript: "ddd4", done: false),
      SubOA(descript: "ddd4", done: false),
      SubOA(descript: "ddd4", done: false),
      SubOA(descript: "ddd4", done: false),
      SubOA(descript: "ddd4", done: false),
      
    ]
    var body: some View {
        HStack {
          ForEach(0...(items.count - 1), id: \.self) { i in
            HStack{
              Image(items[i].done ? "checkedsquare" : "square")
                .onTapGesture {
                  print("tocou")
                  items[i].done = changeValue(val: items[i].done)
                  print(items[i].done)
                }
              TextField("nome da oa", text: $items[i].descript)
                .textFieldStyle(.plain)
                .foregroundColor(.black)


            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .border(.gray)

          }
        }
        .frame(maxWidth: 952, maxHeight: 202)
//        .padding()
    }
}

func changeValue(val: Bool) -> Bool {
    let newVal = !val

  return newVal
}

struct SubOA_Previews: PreviewProvider {
    static var previews: some View {
        @State var c = false
        SubOAItems()
    }
}
