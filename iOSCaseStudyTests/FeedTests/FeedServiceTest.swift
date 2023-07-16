//
//  FeedServiceTest.swift
//  iOSCaseStudyTests
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import XCTest
@testable import iOSCaseStudy

final class FeedServiceTest: XCTestCase {

    var service: FeedServiceable?

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        service = nil
    }

    // MARK: - Most emailed cases
    func testMostEmailedSuccess() async throws {
        service = MockFeedServiceSuccess()
        let result = await service?.getMostEmailed()

        verifySuccessResults(result: result)
    }

    func testMostEmailedFailure() async throws {
        service = MockFeedServiceFailure()
        let result = await service?.getMostEmailed()

        verifyFailureResults(result: result)
    }

    func testMostEmailedEmpty() async throws {
        service = MockFeedServiceEmpty()
        let result = await service?.getMostEmailed()

        verifyEmptyResults(result: result)
    }

    // MARK: - Most shared cases
    func testMostSharedSuccess() async throws {
        service = MockFeedServiceSuccess()
        let result = await service?.getMostShared()

        verifySuccessResults(result: result)
    }

    func testMostSharedFailure() async throws {
        service = MockFeedServiceFailure()
        let result = await service?.getMostShared()

        verifyFailureResults(result: result)
    }

    func testMostSharedEmpty() async throws {
        service = MockFeedServiceEmpty()
        let result = await service?.getMostShared()

        verifyEmptyResults(result: result)
    }

    // MARK: - Most viewed cases
    func testMostViewedSuccess() async throws {
        service = MockFeedServiceSuccess()
        let result = await service?.getMostViewed()

        verifySuccessResults(result: result)
    }

    func testMostViewedFailure() async throws {
        service = MockFeedServiceFailure()
        let result = await service?.getMostViewed()

        verifyFailureResults(result: result)
    }

    func testMostViewedEmpty() async throws {
        service = MockFeedServiceEmpty()
        let result = await service?.getMostViewed()

        verifyEmptyResults(result: result)
    }

    // MARK: - Helper Methods
    private func verifySuccessResults(result: Result<Feeds.Response, RequestError>?) {
        switch result {
        case .success(let feeds):
            XCTAssertEqual(feeds.results?.count, 20)
            XCTAssertEqual(feeds.results?.first?.title, "Test Title")
        case .failure:
            XCTFail("The request should not fail")
        case .none:
            XCTFail("The request should not call this case")
        }
    }

    private func verifyFailureResults(result: Result<Feeds.Response, RequestError>?) {
        switch result {
        case .success:
            XCTFail("The request should not fail")
        case .failure(let error):
            XCTAssertEqual(error, .noResponse)
        case .none:
            XCTFail("The request should not call this case")
        }
    }

    private func verifyEmptyResults(result: Result<Feeds.Response, RequestError>?) {
        switch result {
        case .success(let feeds):
            XCTAssertEqual(feeds.results?.count, 0)
            XCTAssertEqual(feeds.status, "OK")
        case .failure:
            XCTFail("The request should not fail")
        case .none:
            XCTFail("The request should not call this case")
        }
    }
}
