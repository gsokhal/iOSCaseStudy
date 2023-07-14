//
//  FeedService.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import Foundation

protocol FeedServiceable {
    func getMostEmailed() async -> Result<Feeds.Response, RequestError>
    func getMostShared() async -> Result<Feeds.Response, RequestError>
    func getMostViewed() async -> Result<Feeds.Response, RequestError>
}

struct FeedService: HTTPClient, FeedServiceable {

    func getMostEmailed() async -> Result<Feeds.Response, RequestError> {
        return await sendRequest(endpoint: FeedEndpoint.mostEmailed, responseModel: Feeds.Response.self)
    }

    func getMostShared() async -> Result<Feeds.Response, RequestError> {
        return await sendRequest(endpoint: FeedEndpoint.mostShared, responseModel: Feeds.Response.self)
    }

    func getMostViewed() async -> Result<Feeds.Response, RequestError> {
        return await sendRequest(endpoint: FeedEndpoint.mostViewed, responseModel: Feeds.Response.self)
    }
}
