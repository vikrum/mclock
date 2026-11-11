// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "mclock",
    platforms: [.macOS("26.6")],
    targets: [.executableTarget(name: "mclock")]
)
