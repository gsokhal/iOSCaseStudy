//
//  FeedViewController.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import UIKit
import Kingfisher

class FeedViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var noFeedsLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var feedsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Variable
    private let viewModel: FeedViewModel = FeedViewModel(service: FeedService())
    private let refreshControl = UIRefreshControl()
    private var topFeeds: [TopFeeds] = []

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        doInitialSetup()
    }
}

// MARK: - Helper Methods
extension FeedViewController: ShowAlertProtocol {
    // This function performs all initial setup
    private func doInitialSetup() {
        setupTableView()
        showHideLoader(show: true)
        addRefreshControl()
        updateStringsOnScreen()
        // fetch data from server
        fetchData()
    }

    // Handling error from viewModel
    private func handleError() {
        viewModel.showError = { [weak self] message in
            guard let self else {
                return
            }
            self.showAlert(
                title: Constants.alertTitleError.localize(),
                message: message,
                view: self
            )
        }
    }

    private func setupTableView() {
        feedsTableView.estimatedRowHeight = 108
        feedsTableView.rowHeight = UITableView.automaticDimension
        feedsTableView.tableFooterView = UIView(frame: .zero)
    }

    // This function show/hide the indicator
    private func showHideLoader(show: Bool) {
        activityIndicator.isHidden = !show
    }

    // This function adds refresh control to table view
    private func addRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        feedsTableView.refreshControl = refreshControl
    }

    // This function add localised text on screen
    private func updateStringsOnScreen() {
        titleLabel.text = Constants.feeds.localize()
        noFeedsLabel.text = Constants.noFeeds.localize()
    }

    // This function is called on pullToRefresh
    @objc private func refreshData(_ sender: Any) {
        fetchData()
    }

    // This function is for fetching data
    private func fetchData() {
        Task(priority: .background) {
            topFeeds = await viewModel.getFeedData()

            DispatchQueue.main.async { [weak self] in
                self?.showHideLoader(show: false)
                self?.refreshControl.endRefreshing()
                self?.feedsTableView.reloadData()
            }
        }
    }

}

// MARK: - Button Actions
extension FeedViewController {

    @IBAction private func backbuttonAction(_ sender: Any) {
        dismiss(animated: true)
    }

}

// MARK: - Tableview datasource methods
extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return topFeeds.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topFeeds[section].topThreeFeeds.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(FeedTableViewCell.self)") as? FeedTableViewCell  else {
            
            return UITableViewCell()
        }
        let feed: FeedData = topFeeds[indexPath.section].topThreeFeeds[indexPath.row]

        cell.feedTitleLabel.text = feed.title
        // Get image url from model
        if let media = feed.media?.first,
            let mediaData = media.mediaMetadata?.first,
            let url = mediaData.url {
            cell.feedImageView.kf.setImage(with: URL(string: url))
        }

        return cell
    }
}

// MARK: - Tableview delegate methods
extension FeedViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return topFeeds[section].sectionTitle
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
