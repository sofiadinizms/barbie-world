//
//  SubOA.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct SubOAItem {
    var descript: String
    var done: Bool
}

extension DetailView {
    @ViewBuilder
    func SubOAItems() -> some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(0...(items.count - 1), id: \.self) { i in
                
                HStack {
                    TextField("Insira o nome da task", text: $items[i].descript)
                        .fixedSize(horizontal: false, vertical: true)
                        .textFieldStyle(.plain)
                        .foregroundColor(.black)
                        .onSubmit {
                            if items[i].descript == "" && (i != items.count - 1) {
                                items.remove(at: i)
                            } else {
                                if items.last?.descript != "" {
                                    items.append(SubOAItem(descript: "", done: false))
                                }
                            }
                            if ((items.count) == (items.filter{ $0.done }.count) && (items.count != 0)) {
                                barColor = .theme.customGreen
                            } else {
                                barColor = .theme.customBlue
                            }
                        }
                    
                    Image(items[i].done ? "checkedsquare" : "square")
                        .onTapGesture {
                            items[i].done = changeValue(val: items[i].done)
                            if ((items.count) == (items.filter{ $0.done }.count) && (items.count != 0)) {
                                barColor = .theme.customGreen
                            } else {
                                barColor = .theme.customBlue
                            }
                            
                        }
                        .onHover { inside in
                            if inside {
                                NSCursor.pointingHand.push()
                            } else {
                                NSCursor.pop()
                            }
                        }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 0)
                .frame(height: 52, alignment: .leading)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.25)
                        .stroke(.black.opacity(0.2), lineWidth: 0.5)
                )
            }
            
            Button(action: {
                if items.last?.descript != "" {
                    items.append(SubOAItem(descript: "", done: false))
                    if ((items.count) == (items.filter{ $0.done }.count) && (items.count != 0)) {
                        barColor = .theme.customGreen
                    } else {
                        barColor = .theme.customBlue
                    }
                }
            }) {
                Text("􀅼  Criar novo")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 0)
                    .frame(height: 52, alignment: .leading)
                    .background(.white.opacity(0.2))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.25)
                            .stroke(.black.opacity(0.2), lineWidth: 0.5)
                    )
                
                
            }
            .buttonStyle(PlainButtonStyle())
            .onHover { inside in
                if inside {
                    NSCursor.pointingHand.push()
                } else {
                    NSCursor.pop()
                }
            }
        }
        .frame(maxWidth: 952)}
}

func changeValue(val: Bool) -> Bool {
    let newVal = !val
    
    return newVal
}
