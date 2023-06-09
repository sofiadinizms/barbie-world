//
//  ContentView.swift
//  Barbie-world
//
//  Created by sofiadinizms on 08/05/23.
//

import SwiftUI
import UserNotifications
import UIKit

class NotificationManager {
    static let instance = NotificationManager()

    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }

    func scheduleNotification(title: String, subtitle: String, hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        content.badge = 1

        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct ContentView: View {
    
    @State var hasOA: Bool = true
    
    var body: some View {
        ZStack{
            
            if hasOA{
                
                Color(.windowBackgroundColor)
                
            } else {
                
                Color(red:255.0, green: 255.0, blue: 255.0)
            }
            
            ScrollView(.vertical, showsIndicators: false){
                
                if hasOA{
                    
                    FilledHomeView()
                    
                } else {
                    
                   EmptyHomeView()
                    
                }
            }

        }
        .onAppear() {
            NotificationManager.instance.requestAuthorization()
            
            NotificationManager.instance.scheduleNotification(
                title: "Um novo dia pra continuar trilhando!",
                subtitle: "Aproveite o começo do dia para continuar os estudos e progredir na sua jornada de aprendizado.",
                hour: 8,
                minute: 30
            )
            
            NotificationManager.instance.scheduleNotification(
                title: "Como está esse começo de tarde?",
                subtitle: "Aproveite o tempinho pós almoço para refletir sobre seus avanços até aqui. Não desista, continue trilhando!",
                hour: 13,
                minute: 30
            )
            
            NotificationManager.instance.scheduleNotification(
                title: "Que o dia tenha sido ótimo!",
                subtitle: "Parabéns por mais um dia trilhando a sua jornada de aprendizado. Lembre de registrar tudo que você fez hoje pra alcançar seu OA.",
                hour: 17,
                minute: 30
            )
            
            UIApplication.shared.applicationIconBadgeNumber = 0

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
