//
//  PostsPresenter.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation

protocol PostsPresenterDelegate: class {
    func reloadTableView()
    func postsViewModel(handle error: Error)
}

class PostsPresenter {
    
    var sectionModel = SectionModel()
    weak var delegate: PostsPresenterDelegate?
    var nbPage: Int = 0
    
    var posts: [Post] = [] {
        didSet {
            self.preparePostsModel()
        }
    }
    
    //TODO: Naming
    private func preparePostsModel() {
        let cellModels = self.posts.map {
            PostTableCellModel(createdAt: $0.createdAt, title: $0.title)
        }
        self.sectionModel = SectionModel.init(cellModels: cellModels)
        self.delegate?.reloadTableView()
    }
    
    var error: Error? {
        didSet {
            if let error = error {
                self.delegate?.postsViewModel(handle: error)
            }
        }
    }
    
}

extension PostsPresenter {
    
    var itemCount: Int {
        return self.sectionModel.cellModels.count
    }
    
    func cellModel(at indexPath: IndexPath) -> Any {
        return self.sectionModel.cellModels[indexPath.item]
    }
    
}

extension PostsPresenter {
    
    func fetchPosts(canLoadMore: Bool, page: Int) {
        Post.fetchPosts(page: page) { response in
            switch response {
            case.success(let postResponse):
                self.nbPage = postResponse.nbPages
                if canLoadMore {
                    self.posts.append(contentsOf: postResponse.posts)
                    return
                }
                self.posts = postResponse.posts
            case .failure(let error):
                self.error = error
            }
        }
    }
}
