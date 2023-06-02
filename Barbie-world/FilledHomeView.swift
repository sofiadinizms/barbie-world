//
//  FilledHomeView.swift
//  Barbie-world
//
//  Created by sofiadinizms on 31/05/23.
//

import SwiftUI

struct FilledHomeView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    var oas: FetchedResults<OA>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40.0){
            HStack(spacing: 300.0){
                Text("Objetivos de aprendizado")
                    .bold()
                    .font(.custom("SF Pro Display", size: 24))
                    .lineLimit(2)
                
                NavigationLink(destination: DetailView(), label: {
                    Image("newButton")
                        .resizable()
                        .scaledToFit()
                }).buttonStyle(PlainButtonStyle())
                    .frame(width: 100, height: 36)
                
                
                
            }
            VStack(spacing: 20.0){
                ForEach(oas.filter {$0.isCompleted == false}) { oa in
                    NavigationLink(destination: EditingDetailView(oa: oa)){
                        OACard(oa: oa)
                    }.buttonStyle(.plain)
                }
            }
            
            Text("Objetivos concluídos")
                .bold()
                .font(.custom("SF Pro Display", size: 24))
                .lineLimit(2)
            
            VStack(spacing: 20.0){
                ForEach(oas.filter {$0.isCompleted}) { oa in
                    NavigationLink(destination: EditingDetailView(oa: oa)){
                        OACard(oa: oa)
                    }.buttonStyle(.plain)
                }
            }
        }
        .foregroundColor(.black)
        .padding(EdgeInsets(top: 65, leading: 0, bottom: 65, trailing: 0))
        .frame(width: 800)
    }
}

//struct FilledHomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilledHomeView()
//    }
//}
