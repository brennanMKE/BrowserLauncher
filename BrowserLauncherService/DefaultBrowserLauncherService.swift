import Foundation
import AppKit
import os.log

import BrowserLauncherKit

@objc class DefaultBrowserLauncherService: NSObject, BrowserLauncherService {
    let log  = OSLog(subsystem: "com.smallsharptools.BrowserLauncherService", category: "service")

    func launch(_ url: URL) async {
        // Note: Open Console and use Action menu to Include Info Messages
        os_log("Opening URL: %{public}@", log: log, type: .info, url.absoluteString)

        Task {
            NSWorkspace.shared.open(url)
        }
    }

}
