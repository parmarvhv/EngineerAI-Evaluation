//
//  PostsViewController.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import UIKit
import PaginationUIManager

class PostsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var paginationManager: PaginationUIManager?
    var presenter = PostsPresenter()
    var currentPage: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }

    private func initialSetup() {
        self.presenter.delegate = self
        self.setupTableView()
        self.setupPagination()
        self.paginationManager?.load {
        }
    }

}

//MARK: UITableViewDataSource
extension PostsViewController: UITableViewDataSource {
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerCell(PostTableCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count: \(self.presenter.itemCount)")
        return self.presenter.itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableCell.reuseIdentifier) as! TableViewCell
        cell.item = self.presenter.cellModel(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 2
    }
    
}


//MARK: UITableViewDelegate
extension PostsViewController: UITableViewDelegate {
    
}

//MARK: PaginationUIManagerDelegate
extension PostsViewController: PaginationUIManagerDelegate {
    
    private func setupPagination() {
        self.paginationManager = PaginationUIManager(scrollView: self.tableView,
                                                     pullToRefreshType: .basic)
        self.paginationManager?.delegate = self
    }

    func refreshAll(completion: @escaping (Bool) -> Void) {
        self.currentPage = 1
        self.presenter.fetchPosts(canLoadMore: false, page: self.currentPage)
        completion(true)
    }
    
    func loadMore(completion: @escaping (Bool) -> Void) {
        self.currentPage += 1
        self.presenter.fetchPosts(canLoadMore: true, page: self.currentPage)
        completion(self.currentPage < self.presenter.nbPage)
    }
    
}

//MARK: PostsPresenterDelegate
extension PostsViewController: PostsPresenterDelegate {
    
    func reloadTableView() {
        self.title = "Number of Displaying Post: \(self.presenter.itemCount)"
        self.tableView.reloadData()
    }
    
    func postsViewModel(handle error: Error) {
        //TODO: Show Alert
    }
    
}
