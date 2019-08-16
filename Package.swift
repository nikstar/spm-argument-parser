// swift-tools-version:4.2

/*
 This source file is part of the Swift.org open source project

 Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

import PackageDescription

let package = Package(
    name: "SwiftPM",
    products: [
        // Collection of general purpose utilities.
        //
        // NOTE: This product consists of *unsupported*, *unstable* API. These
        // APIs are implementation details of the package manager. Depend on it
        // at your own risk.
        .library(
            name: "SPMArgumentParser",
            targets: [
                "clibc",
                "SPMLibc",
                "Basic",
                "SPMUtility",
            ]
        ),
    ],
    targets: [
        // MARK: Support libraries
        .target(
            /** Shim target to import missing C headers in Darwin and Glibc modulemap. */
            name: "clibc",
            dependencies: []),
        .target(
            /** Cross-platform access to bare `libc` functionality. */
            name: "SPMLibc",
            dependencies: ["clibc"]),
        .target(
            /** Basic support library */
            name: "Basic",
            dependencies: ["SPMLibc"]),
        .target(
            /** Abstractions for common operations, should migrate to Basic */
            name: "SPMUtility",
            dependencies: ["Basic"]),
    ]
)
