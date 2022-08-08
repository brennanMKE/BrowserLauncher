import Foundation
import BrowserLauncherService

struct Client {
    private let serviceName = "com.smallsharptools.BrowserLauncherService"

    func launch(url: URL) async {
        let service = getRemoteService()
        await service.launch(url)
    }

    private func getRemoteService() -> BrowserLauncherService {
        let connection = NSXPCConnection(serviceName: serviceName)
        connection.remoteObjectInterface = NSXPCInterface(with: BrowserLauncherService.self)
        connection.resume()
        guard let service = connection.remoteObjectProxy as? BrowserLauncherService else {
            fatalError("Service protocol not valid")
        }
        return service
    }
}
