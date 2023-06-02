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
    
    //    var oaname = OAname()
    let emojis = ["🖌️", "👩‍🎨", "🧑‍🎨", "🧑‍💻", "👩‍💻", "🎯", "🧩", "🥇", "🏆", "🥈", "🏅", "🎖️", "🥉", "🎲", "💰", "💸", "💡", "🕯️", "⏰", "📈", "📅", "📁", "🧷", "📎", "📌", "📏", "📒", "🔍", "📝", "✏️", "🗳️", "❤️‍🔥", "🩷", "💘", "💖", "💝", "💚", "💛", "🧡", "❤️", "🩵", "💙", "💜", "🖤", "🩶", "🤍", "🤎", "✅", "🔊", "💬", "🕐", "🥰", "😍", "😌", "😘", "🤫", "😬", "😀", "😄", "😊", "😃", "😉", "🙂", "😅", "🥰", "😍", "🤩", "😎", "🤗", "😘", "😚", "😋", "🤪", "😜", "🤓", "😛", "🥳", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🦆", "🦉", "🐝", "📚", "🎓", "🖊", "✏️", "📝", "📖", "📓", "📔", "📒", "📕", "📗", "📘", "📙", "🎒", "🧮", "📏", "📐", "📚", "📝", "🔍", "📚", "🎓", "🖊", "✏️", "📝", "📖", "📓", "📔", "📒", "📕", "📗", "📘", "📙", "🎒", "🧮", "📏", "📐", "💼", "💻", "📎", "📋", "📁", "📂", "📌", "📚", "📝"]
    
    
    @State var randomEmoji = "😬"
    @State var textFields1: String = "Nome da OA"
    @State var textFields2: String = "Descrição do objetivo de aprendizado"
    //    var suboaitems = SubOAItems()
    @State var items: [SubOAItem] = [
        SubOAItem(descript: "Insira o nome da task", done: false),
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 250))
    ]
//    var success = Success()
    @State var successParameters : [successParameter] = [
    successParameter(name: "Indicador de sucesso")
    ]
    //    var progress = Progress(isCompleted: true)
    @State var barColor: Color = .theme.customBlue
    
    var cardsview = CardsView()
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .center){
                //                oaname
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 952, height: 202)
                        .cornerRadius(16)
                    
                    
                    VStack(alignment: .leading){
                        HStack(alignment: .bottom) {
                            Text(randomEmoji)
                                .font(.system(size: 68))
                            
                            Button(action: {
                                randomEmoji = emojis.randomElement() ?? ""
                            }) {
                                Image("button random")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 34,height:34)
                                
                            }
                            .padding(.bottom, 3)
                            .buttonStyle(PlainButtonStyle())
                        }
                        Spacer()
                        TextField("Nome da OA", text: $textFields1)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.system(size: 32))
                            .foregroundColor(.black)
                        TextField("Descrição do objetivo de aprendizado", text: $textFields2)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.bottom, 26)
                        
                    }
                    .padding(.leading, 26)
                    
                    
                }
                .frame(width: 952, height: 202)
                .padding(.top, 84)
                .shadow(color: Color.black.opacity(0.1), radius: 5)
                
                //                suboaitems
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0...(items.count - 1), id: \.self) { i in
                        
                        HStack {
                            
                            Image(items[i].done ? "checkedsquare" : "square")
                                .onTapGesture {
                                    items[i].done = changeValue(val: items[i].done)
                                    if ((items.count) == (items.filter{ $0.done }.count) && (items.count != 0)) {
                                        barColor = .theme.customGreen
                                    } else {
                                        barColor = .theme.customBlue
                                    }
                                    
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
                    
                    Button(action: {
                        items.append(SubOAItem(descript: "Insira o nome da task", done: false))
                    }) {
                        Text("􀅼  Criar novo")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 177, height: 52)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5)
                }
                .frame(maxWidth: 952)
//                success
                VStack (alignment: .leading){
                    Text("Indicadores de Sucesso")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.top, 60)
                
                    LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0...(successParameters.count - 1), id: \.self) { i in
                                HStack{
                                    ZStack{
                                        Rectangle()
                                            .frame(height: 52)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                        //                    .border(Color.white, width: 1)
                                            .opacity(0.6)
                                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                                        
                                        HStack{
                                            Text("🎯")
                                                .font(.largeTitle)
                                                .padding(.leading, 24)
                                            
                                            TextField("Indicador de sucesso", text: $successParameters[i].name)
                                                .textFieldStyle(.plain)
                                            //                                        .font(.system(size: 20))
                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                }
                                .padding(.trailing)
                            }
                        
                            Button(action: {
                                successParameters.append(successParameter(name: "Indicador de sucesso"))
                            }) {
                                Text("􀅼  Criar novo")
                                    .font(.system(size: 20))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 177, height: 52)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                            Spacer()
                        
                    }
                    .frame(maxWidth: 952)
                }
                
                //                progress
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
                                        .frame(width: 40, height: 6)
                                    Circle()
                                        .foregroundColor(barColor)
                                        .frame(width: 20, height: 20)
                                } else if i <= completed && i == total {
                                    Rectangle()
                                        .foregroundColor(barColor)
                                        .frame(width: 40, height: 6)
                                    Circle()
                                        .foregroundColor(barColor)
                                        .frame(width: 20, height: 20)
                                } else if i > completed && i < total{
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .opacity(0.1)
                                        .frame(width: 40, height: 6)
                                    Circle()
                                        .foregroundColor(.black)
                                        .opacity(0.1)
                                        .frame(width: 20, height: 20)
                                } else if i > completed && i == total{
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .opacity(0.1)
                                        .frame(width: 40, height: 6)
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
                cardsview
                Spacer()
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
                        DataController().addOA(title: textFields1, subtitle: textFields2, icon: randomEmoji, context: managedObjContext, subOAs: items, ceprs: cardsview.ceprItems, evidences: successParameters)
                        dismiss()
                    }, label: {
                        Image("Criar")
                            .resizable()
                            .scaledToFit()
                    }).buttonStyle(PlainButtonStyle())
                        .frame(width: 170, height: 80)
                }
                .frame(width: 952, height: 202)
                .onAppear {
                    
                    print(items.filter{$0.done}.count)
                    print(items.count)
                }
            }
            
        }
    }
}

struct EditingDetailView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    var oa : FetchedResults<OA>.Element
    
    //    var oaname : EditingOAname
    let emojis = ["🖌️", "👩‍🎨", "🧑‍🎨", "🧑‍💻", "👩‍💻", "🎯", "🧩", "🥇", "🏆", "🥈", "🏅", "🎖️", "🥉", "🎲", "💰", "💸", "💡", "🕯️", "⏰", "📈", "📅", "📁", "🧷", "📎", "📌", "📏", "📒", "🔍", "📝", "✏️", "🗳️", "❤️‍🔥", "🩷", "💘", "💖", "💝", "💚", "💛", "🧡", "❤️", "🩵", "💙", "💜", "🖤", "🩶", "🤍", "🤎", "✅", "🔊", "💬", "🕐", "🥰", "😍", "😌", "😘", "🤫", "😬", "😀", "😄", "😊", "😃", "😉", "🙂", "😅", "🥰", "😍", "🤩", "😎", "🤗", "😘", "😚", "😋", "🤪", "😜", "🤓", "😛", "🥳", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🦆", "🦉", "🐝", "📚", "🎓", "🖊", "✏️", "📝", "📖", "📓", "📔", "📒", "📕", "📗", "📘", "📙", "🎒", "🧮", "📏", "📐", "📚", "📝", "🔍", "📚", "🎓", "🖊", "✏️", "📝", "📖", "📓", "📔", "📒", "📕", "📗", "📘", "📙", "🎒", "🧮", "📏", "📐", "💼", "💻", "📎", "📋", "📁", "📂", "📌", "📚", "📝"]
    
    
    @State var randomEmoji : String = ""
    @State var textFields1 : String = ""
    @State var textFields2 : String = ""
    //    var suboaitems = SubOAItems()
    @State var items: [SubOAItem] = [
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 250))
    ]
    //    var success : EditingSuccess
    @State var successParameters : [successParameter] = []
    //    var progress = Progress(isCompleted: true)
    @State var barColor: Color = .theme.customBlue
    
    var cardsview = CardsView()
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .center){
                //                oaname
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 952, height: 202)
                        .cornerRadius(16)
                    
                    
                    
                    
                    
                    
                    VStack(alignment: .leading){
                        HStack(alignment: .bottom) {
                            Text(randomEmoji)
                                .font(.system(size: 68))
                            
                            Button(action: {
                                randomEmoji = emojis.randomElement() ?? ""
                            }) {
                                Image("button random")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 34,height:34)
                                
                            }
                            .padding(.bottom, 3)
                            .buttonStyle(PlainButtonStyle())
                        }
                        Spacer()
                        TextField("Nome da OA", text: $textFields1)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.system(size: 32))
                            .foregroundColor(.black)
                        TextField("Descrição do objetivo de aprendizado", text: $textFields2)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.bottom, 26)
                        
                    }
                    .padding(.leading, 26)
                    
                    
                }
                .frame(width: 952, height: 202)
                .padding(.top, 84)
                .shadow(color: Color.black.opacity(0.1), radius: 5)
                //                suboaitems
                LazyVGrid(columns: columns, spacing: 20) {
                    if items.count > 0 {
                        ForEach(0...(items.count - 1), id: \.self) { i in
                            
                            HStack {
                                
                                Image(items[i].done ? "checkedsquare" : "square")
                                    .onTapGesture {
                                        items[i].done = changeValue(val: items[i].done)
                                        if ((items.count) == (items.filter{ $0.done }.count) && (items.count != 0)) {
                                            barColor = .theme.customGreen
                                        } else {
                                            barColor = .theme.customBlue
                                        }
                                        
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
                    
                    Button(action: {
                        items.append(SubOAItem(descript: "Insira o nome da task", done: false))
                    }) {
                        Text("􀅼  Criar novo")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 177, height: 52)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5)
                }
                .frame(maxWidth: 952)
                //                success
                VStack (alignment: .leading){
                    Text("Indicadores de Sucesso")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.top, 60)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        if successParameters.count > 0 {
                            ForEach(0...(successParameters.count - 1), id: \.self) { i in
                                HStack{
                                    ZStack{
                                        Rectangle()
                                            .frame(height: 52)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                        //                    .border(Color.white, width: 1)
                                            .opacity(0.6)
                                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                                        
                                        HStack{
                                            Text("🎯")
                                                .font(.largeTitle)
                                                .padding(.leading, 24)
                                            
                                            TextField("Indicador de sucesso", text: $successParameters[i].name)
                                                .textFieldStyle(.plain)
                                            //                                        .font(.system(size: 20))
                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                }
                                .padding(.trailing)
                            }
                        }
                        
                        Button(action: {
                            successParameters.append(successParameter(name: "Indicador de sucesso"))
                        }) {
                            Text("􀅼  Criar novo")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 177, height: 52)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5)
                        Spacer()
                        
                    }
                    .frame(maxWidth: 952)
                }
                //        .frame(width: 952)
                
                //                progress
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
                            if items.count > 0 {
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
                                            .frame(width: 40, height: 6)
                                        Circle()
                                            .foregroundColor(barColor)
                                            .frame(width: 20, height: 20)
                                    } else if i <= completed && i == total {
                                        Rectangle()
                                            .foregroundColor(barColor)
                                            .frame(width: 40, height: 6)
                                        Circle()
                                            .foregroundColor(barColor)
                                            .frame(width: 20, height: 20)
                                    } else if i > completed && i < total{
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                            .frame(width: 40, height: 6)
                                        Circle()
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                            .frame(width: 20, height: 20)
                                    } else if i > completed && i == total{
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                            .frame(width: 40, height: 6)
                                        Circle()
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                            .frame(width: 20, height: 20)
                                    }
                                }
                            }
                        }
                        .frame(width: 900, height: 40)
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                    }
                    
                    
                }
                .frame(width: 952, height: 202)
                cardsview
                Spacer()
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
                        DataController().editOA(oa: oa, title: textFields1, subtitle: textFields2, icon: randomEmoji, context: managedObjContext, subOAs: items, ceprs: cardsview.ceprItems, evidences: successParameters)
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
            .onAppear {
                self.randomEmoji = oa.icon!
                self.textFields1 = oa.title ?? ""
                self.textFields2 = oa.subtitle ?? ""
                if let success = oa.evidencies?.allObjects as? [Evidence] {
                    for evidence in success {
                        self.successParameters.append(successParameter(name: evidence.name ?? ""))
                    }
                }
                if self.successParameters.count == 0 {
                    self.successParameters.append(successParameter(name: "Indicador de sucesso"))
                }
                if let suboaitems = oa.subOAs?.allObjects as? [SubOA] {
                    for subOA in suboaitems {
                        items.append(SubOAItem(descript: subOA.name ?? "", done: subOA.isCompleted))
                    }
                }
                if self.items.count == 0 {
                    items.append(SubOAItem(descript: "Insira o nome da task", done: false))
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
