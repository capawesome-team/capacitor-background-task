import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(BackgroundTaskPlugin)
public class BackgroundTaskPlugin: CAPPlugin {
    private let implementation = BackgroundTask()

    @objc func beforeExit(_ call: CAPPluginCall) {
        let taskId = UIApplication.shared.beginBackgroundTask {
            // End the task if time expires.
            UIApplication.shared.endBackgroundTask(taskId)
            taskId = UIBackgroundTaskInvalid
        }
        call.resolve()
    }

    @objc func finish(_ call: CAPPluginCall) {
        guard let taskId = call.getString("taskId") else {
            call.reject("No taskId was provided.")
        }
        UIApplication.shared.endBackgroundTask(taskId)
    }
}
