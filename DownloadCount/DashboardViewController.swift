//
//  ViewController.swift
//  DownloadCount
//
//  Created by James Tang on 1/8/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit
import DownloadCountShared

class DashboardViewController : UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var refreshControl : UIRefreshControl!
    var presenter : DashboardPresenter?
    var sections : [DashboardSection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRefreshControl()
        self.presenter?.fetchSections()
    }

    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        self.tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: "refreshControlValueDidChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
    }

    func reloadData() {
        self.tableView.reloadData()
    }

    // MARK: Action

    @IBAction func refreshControlValueDidChange(sender: AnyObject) {
        self.presenter?.fetchSections()
    }
}

extension DashboardViewController : DashboardInterface {

    func reloadDataWithSections(sections: [DashboardSection]) {
        self.sections = sections
        self.reloadData()
    }

    func showError(error: DashboardInterfaceError) {
        self.sections = []
        self.reloadData()
    }

    func startLoading() {
        self.refreshControl?.beginRefreshing()
    }

    func stopLoading() {
        self.refreshControl.endRefreshing()
    }
}

extension DashboardViewController : UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sections.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! DashboardViewCell
        let item = self.sections[indexPath.section].items[indexPath.row]
        cell.dashboardItem = item
        return cell
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        return section.name
    }
}

