import Foundation
import UIKit

@objc public class BackgroundTask: NSObject {
    var taskIds: [String: UIBackgroundTaskIdentifier] = [:]

    @objc public func beforeExit(_ callbackId: String) {
        var taskId = UIBackgroundTaskIdentifier.invalid
        taskId = UIApplication.shared.beginBackgroundTask {
            // Finish the task if time expires.
            self.finish(callbackId)
        }
        self.taskIds[callbackId] = taskId
    }

    @objc public func finish(_ callbackId: String) {
        guard let taskId = self.taskIds[callbackId] else {
            return
        }
        self.taskIds.removeValue(forKey: callbackId)
        UIApplication.shared.endBackgroundTask(taskId)
    }
}
