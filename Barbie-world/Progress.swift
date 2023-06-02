//
//  Progress.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct Progress: View {
    
    var completed: Int = 4
    var total: Int = 10

    var isCompleted: Bool = false
    var barColor: Color = .theme.customGreen

//    init(isCompleted: Bool) {
//        self.completed = 4
//        self.total = 10
//        self.isCompleted = isCompleted
//
//        self.barColor = isCompleted ? .theme.customGreen : .theme.customBlue
//
//    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Progressão")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.top, 60)
            ZStack{
                Rectangle()
                    .frame(width: 952, height: 118)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5)
                
                HStack (spacing: -0.8){
                    ForEach(0...10, id:\.self){i in
                        if i <= completed && i < total{
                            Circle()
                                .foregroundColor(barColor)
                                .frame(width: 20, height: 20)
                            Rectangle()
                                .foregroundColor(barColor)
                                .frame(width: 40, height: 6)
                        } else if i <= completed && i == total {
                            Circle()
                                .foregroundColor(barColor)
                                .frame(width: 20, height: 20)
                        } else if i > completed && i < total{
                            Circle()
                                .foregroundColor(.black)
                                .opacity(0.1)
                                .frame(width: 20, height: 20)
                            Rectangle()
                                .foregroundColor(.black)
                                .opacity(0.1)
                                .frame(width: 40, height: 6)
                        } else if i > completed && i == total{
                            Circle()
                                .foregroundColor(.black)
                                .opacity(0.1)
                                .frame(width: 20, height: 20)
                        }

                    }
                }
                .frame(width: 900, height: 40)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            }
            
            
        }
        .frame(width: 952, height: 202)
    }
}
//
//struct Progressao_Previews: PreviewProvider {
//    static var previews: some View {
//        Progress(isCompleted: false)
//    }
//}
