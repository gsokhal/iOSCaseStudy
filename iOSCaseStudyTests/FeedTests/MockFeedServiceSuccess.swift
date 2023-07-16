//
//  MockFeedService.swift
//  iOSCaseStudyTests
//
//  Created by Gaurav Sokhal on 13/07/23.
//

@testable import iOSCaseStudy

class MockFeedServiceSuccess: DataLoader, FeedServiceable {

    func getMostEmailed() async -> Result<Feeds.Response, RequestError> {
        return .success(loadJSON(filename: "MostEmailed", type: Feeds.Response.self))
    }

    func getMostShared() async -> Result<Feeds.Response, RequestError> {
        return .success(loadJSON(filename: "MostShared", type: Feeds.Response.self))
    }

    func getMostViewed() async -> Result<Feeds.Response, RequestError> {
        return .success(loadJSON(filename: "MostViewed", type: Feeds.Response.self))
    }
}
