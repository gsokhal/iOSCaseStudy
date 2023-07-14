//
//  FeedViewModel.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import Foundation

protocol FeedViewModelProtocol {
    var showError: ((String) -> Void)? { get }
    func getFeedData() async -> [TopFeeds]
}

class FeedViewModel: FeedViewModelProtocol {
    var showError: ((String) -> Void)?
    var service: FeedServiceable!

    init(service: FeedServiceable) {
        self.service = service
    }

    // This function gets data from all three API's and append them in model.
    func getFeedData() async -> [TopFeeds] {
        var topFeeds: [TopFeeds] = []

        if let emailed = await getMostEmailedData(), let results = emailed.results {
            topFeeds.append(TopFeeds.mostEmailed(
                Constants.sectionEmailedTitle.localize(),
                results)
            )
        }
        if let shared = await getMostSharedData(), let results = shared.results {
            topFeeds.append(TopFeeds.mostShared(
                Constants.sectionSharedTitle.localize(),
                results)
            )
        }
        if let viewed = await getMostViewedData(), let results = viewed.results {
            topFeeds.append(TopFeeds.mostViewed(
                Constants.sectionViewedTitle.localize(),
                results)
            )
        }

        return topFeeds
    }

    // Get most emailed data
    private func getMostEmailedData() async -> Feeds.Response? {
        let mostEmailedResult = await service.getMostEmailed()
        switch mostEmailedResult {
        case .success(let emailed):
            return emailed
        case .failure:
            self.showError?(Constants.errorFectingEmail.localize())
        }

        return nil
    }

    // Get most shared data
    private func getMostSharedData() async -> Feeds.Response? {
        let mostEmailedResult = await service.getMostShared()
        switch mostEmailedResult {
        case .success(let shared):
            return shared
        case .failure:
            self.showError?(Constants.errorFetchingShared.localize())
        }

        return nil
    }

    // Get most viewed data
    private func getMostViewedData() async -> Feeds.Response? {
        let mostEmailedResult = await service.getMostViewed()
        switch mostEmailedResult {
        case .success(let viewed):
            return viewed
        case .failure:
            self.showError?(Constants.errorFetchingViewed.localize())
        }

        return nil
    }
}
