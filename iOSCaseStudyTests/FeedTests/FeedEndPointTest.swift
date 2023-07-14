//
//  FeedEndPointTest.swift
//  iOSCaseStudyTests
//
//  Created by Gaurav Sokhal on 14/07/23.
//

import XCTest
@testable import iOSCaseStudy

final class FeedEndPointTest: XCTestCase {

    func testEmailedEndPoint() async {
        verifyEndpointData(endpoint: FeedEndpoint.mostEmailed)
    }

    func testSharedEndPoint() async {
        verifyEndpointData(endpoint: FeedEndpoint.mostShared)
    }

    func testViewedEndPoint() async {
        verifyEndpointData(endpoint: FeedEndpoint.mostViewed)
    }

    // Helper function to verify the details
    private func verifyEndpointData(endpoint: FeedEndpoint) {
        XCTAssertNotNil(endpoint)
        XCTAssertEqual(endpoint.scheme, "https")
        XCTAssertEqual(endpoint.host, "api.nytimes.com")
        XCTAssertEqual(endpoint.method, RequestMethod.get)
        XCTAssertEqual(endpoint.apiKeyQueryItem.name, "api-key")
        XCTAssertEqual(endpoint.header, ["Content-Type": "application/json;charset=utf-8"])
        XCTAssertNil(endpoint.body)

        switch endpoint {
        case .mostEmailed:
            XCTAssertEqual(endpoint.path, "/svc/mostpopular/v2/emailed/7.json")
        case .mostShared:
            XCTAssertEqual(endpoint.path, "/svc/mostpopular/v2/shared/1/facebook.json")
        case .mostViewed:
            XCTAssertEqual(endpoint.path, "/svc/mostpopular/v2/viewed/1.json")
        }
    }
}
