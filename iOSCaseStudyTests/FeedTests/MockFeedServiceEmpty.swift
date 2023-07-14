//
//  MockFeedServiceEmpty.swift
//  iOSCaseStudyTests
//
//  Created by Gaurav Sokhal on 14/07/23.
//

@testable import iOSCaseStudy

class MockFeedServiceEmpty: DataLoader, FeedServiceable {

    let jsonString = """
        {
        "status": "OK",
        "copyright": "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.\", "num_results": 0,
        "results": []

        }
    """
    
    func getMostEmailed() async -> Result<Feeds.Response, RequestError> {
        return .success(loadJSON(jsonStr: jsonString, type: Feeds.Response.self))
    }

    func getMostShared() async -> Result<Feeds.Response, RequestError> {
        return .success(loadJSON(jsonStr: jsonString, type: Feeds.Response.self))
    }

    func getMostViewed() async -> Result<Feeds.Response, RequestError> {
        return .success(loadJSON(jsonStr: jsonString, type: Feeds.Response.self))
    }
}
