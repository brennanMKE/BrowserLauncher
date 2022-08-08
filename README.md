# XPC Service with Swift

Running an XPC service with an app can support useful features with a lightweight process outside of the main process. One advantage is that a service can be started and stopped without having to restart the main app. It will allow for reducing the memory footprint and increasing stability. 

Special access to resources can also be implemented in XPC so critical features are not implemented in the main process which could potentially include a unnown compromise. Services are typically a small amount of code and can be safer because they can be hardened more than the main process and the limited amount of of code can be audited with less effort.

One key resource is the system keychain. Accessing credentials using a service which passes back what the main process needs is a good way to harden a Mac app. When a service has not been used after a timeout period it could be released. When needed again a new connection can be made to access the service.

## Swift Implementation

The default template provided with Xcode only offers Objective-C code. It is possible to do everything with Swift instead. This Gist shows how this can be done.

* [Service.swift](https://github.com/brennanMKE/BrowserLauncher/blob/main/BrowserLauncherService/Service.swift)
* [ServiceDelegate.swift](https://github.com/brennanMKE/BrowserLauncher/blob/main/BrowserLauncherService/ServiceDelegate.swift)
* [DefaultBrowserLauncherService.swift](https://github.com/brennanMKE/BrowserLauncher/blob/main/BrowserLauncherService/BrowserLauncherService.swift)
* [Client.swift](https://github.com/brennanMKE/BrowserLauncher/blob/main/BrowserLauncher/Client.swift)

The Mac app would include the `Client` while the rest is in the XPC service target.

## References

* [EvenBetterAuthorizationSample](https://developer.apple.com/library/archive/samplecode/EvenBetterAuthorizationSample/Introduction/Intro.html)
* [XPC Mach Services from App Bundle?](https://developer.apple.com/forums/thread/132912) (Apple Developer Forums)
