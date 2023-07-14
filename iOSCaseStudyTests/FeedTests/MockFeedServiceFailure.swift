//
//  MockFeedServiceFailure.swift
//  iOSCaseStudyTests
//
//  Created by Gaurav Sokhal on 13/07/23.
//

@testable import iOSCaseStudy

class MockFeedServiceFailure: DataLoader, FeedServiceable {

    func getMostEmailed() async -> Result<Feeds.Response, RequestError> {
        return .failure(.noResponse)
    }

    func getMostShared() async -> Result<Feeds.Response, RequestError> {
        return .failure(.noResponse)
    }

    func getMostViewed() async -> Result<Feeds.Response, RequestError> {
        return .failure(.noResponse)
    }

}
