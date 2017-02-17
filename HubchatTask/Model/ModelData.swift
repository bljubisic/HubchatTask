//
//  ModelData.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/17/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import Foundation


struct PhotographForumHeader {
    let headerImage: String
    let logoImage: String
    let title: String
    let description: String
    let posts: [PostData]
}

struct PostData {
    let postText: String
    let user: ProfileData
    let images: [String]
    let upvotes: Int
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
