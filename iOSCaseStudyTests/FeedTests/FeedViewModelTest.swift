//
//  FeedViewModelTest.swift
//  iOSCaseStudyTests
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import XCTest
@testable import iOSCaseStudy

final class FeedViewModelTest: XCTestCase {

    var viewModel: FeedViewModel?
    var service: FeedServiceable?

    override func setUpWithError() throws {
        service = MockFeedServiceSuccess()
        viewModel = FeedViewModel(service: service!)
    }

    override func tearDownWithError() throws {
        service = nil
        viewModel = nil
    }

    func testGetData() async {
        let result: [TopFeeds]? = await viewModel?.getFeedData()

        if let result {
            XCTAssertEqual(result.count, 3)
            // verifying section titles
            XCTAssertEqual(result[0].sectionTitle, Constants.sectionEmailedTitle.localize())
            XCTAssertEqual(result[1].sectionTitle, Constants.sectionSharedTitle.localize())
            XCTAssertEqual(result[2].sectionTitle, Constants.sectionViewedTitle.localize())

            // verifying topthree
            XCTAssertEqual(result[0].topThreeFeeds.count, 3)
            XCTAssertEqual(result[1].topThreeFeeds.count, 3)
            XCTAssertEqual(result[2].topThreeFeeds.count, 3)

            // verifying other properties in model
            XCTAssertEqual(result[0].topThreeFeeds[0].title, "Test Title")
            XCTAssertEqual(result[1].topThreeFeeds[0].title, "Test Title")
            XCTAssertEqual(result[2].topThreeFeeds[0].title, "Test Title")
        }
    }
}
