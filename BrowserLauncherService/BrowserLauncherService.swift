import Foundation
import os.log

#if canImport(AppKit)
import AppKit
#endif

@objc public protocol BrowserLauncherService {
    func launch(_ url: URL) async
}

@objc class DefaultBrowserLauncherService: NSObject, BrowserLauncherService {
    let log  = OSLog(subsystem: "com.smallsharptools.BrowserLauncherService", category: "service")

    func launch(_ url: URL) async {
        // Note: Open Console and use Action menu to Include Info Messages
        os_log("Opening URL: %{public}@", log: log, type: .info, url.absoluteString)

#if canImport(AppKit)
        Task {
            NSWorkspace.shared.open(url)
        }
#endif
    }

}
