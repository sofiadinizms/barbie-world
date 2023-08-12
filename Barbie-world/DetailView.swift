//
//  DetailView.swift
//  Barbie-world
//
//  Created by sofiadinizms on 26/05/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @State var showingNoNameAlert = false

    
    var oa : FetchedResults<OA>.Element?
    
    @State var oaEmoji = "😬"
    @State var oaTitle: String = ""
    @State var oaSubtitle: String = ""
    @State var items: [SubOAItem] = [
        SubOAItem(descript: "", done: false),
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 250))
    ]
    
    @State var successParameters : [successParameter] = [
        successParameter(name: "")
    ]
    
    @State var barColor: Color = .theme.customBlue
    
    @State var ceprs : [[String]] = [[],[],[],[]]
    @State var ceprsTextFields : [String] = ["", "", "", ""]
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .center){
                OAName()
                SubOAItems()
                Success()
                Progress()
                CardsView()
                Spacer()
                Bottom()
            }
            .onAppear {
                if oa != nil {
                    self.oaEmoji = oa!.icon!
                    self.oaTitle = oa!.title ?? ""
                    self.oaSubtitle = oa!.subtitle ?? ""
                    if oa!.evidencies?.allObjects.count != 0 {
                        if let success = oa!.evidencies?.allObjects as? [Evidence] {
                            self.successParameters.removeAll()
                            for evidence in success {
                                self.successParameters.append(successParameter(name: evidence.name ?? ""))
                            }
                        }
                    }
                    if oa!.subOAs?.allObjects.count != 0 {
                        if let suboaitems = oa!.subOAs?.allObjects as? [SubOA] {
                            items.removeAll()
                            for subOA in suboaitems {
                                items.append(SubOAItem(descript: subOA.name ?? "", done: subOA.isCompleted))
                            }
                        }
                    }
                    if oa!.ceprs?.allObjects.count != 0 {
                        if let ceprItems = oa!.ceprs?.allObjects as? [CEPR] {
                            for ceprItem in ceprItems {
                                switch ceprItem.category {
                                case "Conteúdos":
                                    ceprs[0].append(ceprItem.name ?? "")
                                case "Experiências":
                                    ceprs[1].append(ceprItem.name ?? "")
                                case "Pessoas":
                                    ceprs[2].append(ceprItem.name ?? "")
                                case "Redes":
                                    ceprs[3].append(ceprItem.name ?? "")
                                default:
                                    print("erro")
                                }
                            }
                        }
                    }
                }
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
