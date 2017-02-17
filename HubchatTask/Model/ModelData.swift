//
//  ModelData.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/17/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import Foundation

enum URLs {
    static let headers = "https://api.hubchat.com/v1/forum/photography"
    static let posts = "https://api.hubchat.com/v1/forum/photography/post"
}

struct PhotographForumHeader {
    var headerImage: String
    var logoImage: String
    var title: String
    var description: String
    var posts: [PostData]
}

struct PostData {
    var postText: String
    var user: ProfileData
    var images: [String]
    var upvotes: Int
}

struct ProfileData {
    let avatar: String
    let username: String
}

extension PhotographForumHeader {
    init() {
        headerImage = ""
        logoImage = ""
        title = ""
        description = ""
        posts = []
    }
}

extension PostData {
    init() {
        postText = ""
        user = ProfileData()
        images = []
        upvotes = 0
    }
}

extension ProfileData {
    init() {
        avatar = ""
        username = ""
    }
}
