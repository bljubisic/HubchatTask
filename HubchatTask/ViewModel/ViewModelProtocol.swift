//
//  ViewModelProtocol.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/17/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelProtocol {
    
    
    func getPhotographyForumHeaderData() -> Void
    func getPhotographyForumPosts() -> Void
    func setImageWithCompletion(completion: (UIImage) -> Void)
}

protocol ViewModelDelegate {
    func photographyForumHeaderDataReceived(photographyStruct: PhotographForumHeader) -> Void
    func photographyForumPostsReceived(posts: [PostData]) -> Void
}
