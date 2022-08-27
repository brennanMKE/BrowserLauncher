import Foundation

@objc public protocol BrowserLauncherService {
    func launch(_ url: URL) async
}
