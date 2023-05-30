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
    var body: some View {
        VStack{
            Spacer()
        }
        .onAppear() {
            NotificationManager.instance.requestAuthorization()
            
            NotificationManager.instance.scheduleNotification(
                title: "Notificação 1",
                subtitle: "Esta é a primeira notificação",
                hour: 10,
                minute: 20
            )
            
            NotificationManager.instance.scheduleNotification(
                title: "Notificação 2",
                subtitle: "Esta é a segunda notificação",
                hour: 10,
                minute: 21
            )
            
            NotificationManager.instance.scheduleNotification(
                title: "Notificação 3",
                subtitle: "Esta é a terceira notificação",
                hour: 10,
                minute: 22
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
