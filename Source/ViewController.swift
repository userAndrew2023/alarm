import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            print("permission:", granted)
        }

        sendAlert()
    }

    func sendAlert() {

        let content = UNMutableNotificationContent()
        content.title = "⚠️ ВНИМАНИЕ"
        content.body = "Emergency alert"
        content.sound = UNNotificationSound(named: UNNotificationSoundName("alarm.wav"))

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(
            identifier: "alert",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
}