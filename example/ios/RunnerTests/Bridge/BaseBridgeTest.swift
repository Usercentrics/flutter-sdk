//
//  BaseBridgeTest.swift
//  RunnerTests
//
//  Created by Pedro Araujo on 13/10/2021.
//

import Foundation
import XCTest

@testable import usercentrics_sdk

protocol BaseBridgeTestProtocol: XCTestCase {
    var bridgeName: String! { get }
    var bridge: MethodBridge! { get }
}

extension BaseBridgeTestProtocol {
    func testNameProtocol() {
        XCTAssertEqual(bridgeName, bridge.name)
    }

    func testInvokeWithOtherNameProtocol() {
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in
            XCTAssertEqual(result as! NSObject, FlutterMethodNotImplemented)
            expectation.fulfill()
        }
        bridge.invoke(FakeFlutterMethodCall(methodName: "otherName"), resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
