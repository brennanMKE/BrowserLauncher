import Foundation

public class ServiceDelegate: NSObject, NSXPCListenerDelegate {

    public func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        newConnection.exportedInterface = NSXPCInterface(with: BrowserLauncherService.self)
        newConnection.exportedObject = DefaultBrowserLauncherService()
        newConnection.resume()

        return true
    }

}
