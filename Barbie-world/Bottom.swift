//
//  Bottom.swift
//  Barbie-world
//
//  Created by Jpsmor on 11/08/23.
//

import SwiftUI

extension DetailView {
    @ViewBuilder
    func Bottom() -> some View {
        HStack{
            Spacer()
            Button(action: {
                dismiss()
            }, label: {
                Image("Cancelar")
                    .resizable()
                    .scaledToFit()
            }).buttonStyle(PlainButtonStyle())
                .frame(width: 170, height: 80)
                .padding(.trailing, 20)
            
            Button(action: {
                for i in 0...3 {
                    addTextField(index: i)
                }
                if oa != nil {
                    DataController.shared.editOA(oa: oa!, title: oaTitle, subtitle: oaSubtitle, icon: randomEmoji, context: managedObjContext, subOAs: items, ceprs: ceprs, evidences: successParameters)
                } else {
                    DataController.shared.addOA(title: oaTitle, subtitle: oaSubtitle, icon: randomEmoji, context: managedObjContext, subOAs: items, ceprs: ceprs, evidences: successParameters)
                }
                dismiss()
            }, label: {
                Image("Criar")
                    .resizable()
                    .scaledToFit()
            }).buttonStyle(PlainButtonStyle())
                .frame(width: 170, height: 80)
        }
        .frame(width: 952, height: 202)
    }
}
