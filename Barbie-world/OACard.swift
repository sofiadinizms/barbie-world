//
//  OACard.swift
//  Barbie-world
//
//  Created by sofiadinizms on 30/05/23.
//

import SwiftUI

struct OACard: View {
    
    var completed: Int
    var total: Int
    
    var isCompleted: Bool
    var barColor: Color
    
    init(isCompleted: Bool) {
        self.completed = 4
        self.total = 10
        self.isCompleted = isCompleted
        
        self.barColor = isCompleted ? .theme.customGreen : .theme.customBlue
        
    }
    
    
    var body: some View {
        
                VStack(alignment: .center, spacing: 0.0){
                    
                    HStack(){
                        Text("😍")
                            .font(.custom("SF Pro Display", size: 50))
                            .frame(alignment: .leading)
                        
                        VStack(alignment: .leading){
                            Text("Psicologia das cores")
                                .font(.custom("SF Pro Display", size: 25))
                                .fontWeight(.bold)
                            Text("Descrição do objetivo de aprendizado")
                                .font(.custom("SF Pro Display", size: 16))
                                .fontWeight(.light)
                                .opacity(0.6)
                        }
                        
                    }.frame(width: 610, height: 40, alignment: .leading)
                    //                .background(.red)
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                    
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
                    .frame(width: 610, height: 40)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                    
//                                .background(.blue)
                }

            .frame(width: 700, height: 150)
            .background(.white)
            .border(.black.opacity(0.1))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 5)
        
        
    }
}

struct OACard_Previews: PreviewProvider {
    static var previews: some View {
        OACard(isCompleted: true)
    }
}
