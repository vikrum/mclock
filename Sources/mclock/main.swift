import AppKit

let formatter = DateFormatter()
formatter.timeZone = TimeZone(identifier: "UTC")
formatter.dateFormat = "'UTC' EEE MMM d  HH:mm:ss"

let app = NSApplication.shared
app.setActivationPolicy(.accessory)

let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
// Fixed-width digits keep neighbouring menu bar items from jittering each second.
statusItem.button?.font = .monospacedDigitSystemFont(
    ofSize: NSFont.menuBarFont(ofSize: 0).pointSize, weight: .regular)

let menu = NSMenu()
menu.addItem(withTitle: "Quit mclock", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
statusItem.menu = menu

let update = { statusItem.button?.title = formatter.string(from: Date()) }
update()

// Fire on whole-second boundaries; .common keeps it ticking while the menu is open.
let nextSecond = Date(timeIntervalSinceReferenceDate: Date().timeIntervalSinceReferenceDate.rounded(.down) + 1)
let timer = Timer(fire: nextSecond, interval: 1, repeats: true) { _ in
    MainActor.assumeIsolated { update() }
}
RunLoop.main.add(timer, forMode: .common)

app.run()
