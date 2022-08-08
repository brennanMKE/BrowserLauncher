import Foundation

@main
struct Service {
    static let delegate = ServiceDelegate()

    static func main() {
        let listener = NSXPCListener.service()
        listener.delegate = delegate
        listener.resume()
    }

}
