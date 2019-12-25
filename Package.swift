// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "SwiftString",
	products: [
		.library(name: "SwiftString", targets: ["SwiftString"])
	],
	dependencies: [],
	targets: [
		.target(
			name: "SwiftString",
			dependencies: []
		),
		.testTarget(
			name: "SwiftStringTests",
			dependencies: [],
			path: "./Tests/SwiftStringTests/"
		),
		]
)
