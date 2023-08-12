//
//  Progress.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

extension DetailView {
    @ViewBuilder
    func Progress() -> some View {
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
                ForEach(0...(items.count), id:\.self){ i in
                    let total = items.count
                    let completed = items.filter{ $0.done }.count
                    if ((i == 0) && (completed > i)) {
                        Circle()
                            .foregroundColor(barColor)
                            .frame(width: 20, height: 20)
                    } else if ((i == 0) && (completed == 0)) {
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.1)
                            .frame(width: 20, height: 20)
                    } else if i <= completed && i < total{
                        Rectangle()
                            .foregroundColor(barColor)
                            .frame(height: 6)
                        Circle()
                            .foregroundColor(barColor)
                            .frame(width: 20, height: 20)
                    } else if i <= completed && i == total {
                        Rectangle()
                            .foregroundColor(barColor)
                            .frame(height: 6)
                        Circle()
                            .foregroundColor(barColor)
                            .frame(width: 20, height: 20)
                    } else if i > completed && i < total{
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.1)
                            .frame(height: 6)
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.1)
                            .frame(width: 20, height: 20)
                    } else if i > completed && i == total{
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.1)
                            .frame(height: 6)
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
    .frame(width: 952, height: 202)}
}

