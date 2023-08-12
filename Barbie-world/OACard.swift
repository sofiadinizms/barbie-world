//
//  OACard.swift
//  Barbie-world
//
//  Created by sofiadinizms on 30/05/23.
//

import SwiftUI

struct OACard: View {
    
    var oa : FetchedResults<OA>.Element
    @Environment(\.managedObjectContext) var managedObjContext
    @State var deletingOA = false
    
    var completed: Int = 0
    @State var total: Int
    
    var isCompleted: Bool
    var barColor: Color
    var title : String
    var subtitle : String
    var icon : String
    
    init(oa: OA) {
        self.completed = Int(oa.completedNumber)
        self.total = oa.subOAs?.count ?? 0
        self.isCompleted = oa.isCompleted
        
        self.barColor = isCompleted ? .theme.customGreen : .theme.customBlue
        self.icon = oa.icon ?? ""
        self.title = oa.title ??  ""
        self.subtitle = oa.subtitle ?? ""
        self.oa = oa
    }
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0.0){
            
            HStack(){
                Text(icon)
                    .font(.custom("SF Pro Display", size: 50))
                    .frame(alignment: .leading)
                
                VStack(alignment: .leading){
                    Text(title)
                        .font(.custom("SF Pro Display", size: 25))
                        .fontWeight(.bold)
                    Text(subtitle)
                        .font(.custom("SF Pro Display", size: 16))
                        .fontWeight(.light)
                        .opacity(0.6)
                }
                Spacer()
                Button {
                    deletingOA = true
                } label: {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                }
                .buttonStyle(PlainButtonStyle())
                .alert("Confirmar a exclusão da OA?", isPresented: $deletingOA) {
                    Button("Sim") {
                        DataController.shared.deleteOA(oa: oa, context: managedObjContext)
                        
                    }
                    Button("Cancelar", role: .cancel) {}
                }

                
                
            }.frame(width: 610, height: 40, alignment: .leading)
            //                .background(.red)
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            
            HStack (spacing: -0.8){
                ForEach(0...total, id:\.self){i in
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
            .frame(width: 610, height: 40)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            
            //                                .background(.blue)
        }
        .frame(width: 700, height: 150)
        .background(.white)
        .border(.black.opacity(0.1))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5)
        .onAppear {
            self.total = oa.subOAs?.count ?? 0
        }
        
        
    }
}

//struct OACard_Previews: PreviewProvider {
//    static var previews: some View {
//        OACard(isCompleted: true)
//    }
//}
