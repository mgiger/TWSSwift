// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "TWSSwift",
	platforms: [
		.macOS(.v11)
	],
	products: [
		.library(
			name: "TWSSwift",
			targets: ["TWSSwift", "TWScpp"]),
	],
	targets: [
		.target(
			name: "TWSSwift",
			dependencies: ["TWScpp"],
			path: "Sources/ObjC",
			cxxSettings: [
				.headerSearchPath("../cpp/")
			]
		),
		.target(
			name: "TWScpp",
			path: "Sources/CPP",
			cSettings: [
//				.unsafeFlags(["-Wconversion", "-Wshorten-64-to-32", "-Wshadow"])
			]
		),
		.testTarget(
			name: "TWSTests",
			dependencies: ["TWSSwift", "TWScpp"]
		),
	],
	cxxLanguageStandard: .gnucxx17
)
