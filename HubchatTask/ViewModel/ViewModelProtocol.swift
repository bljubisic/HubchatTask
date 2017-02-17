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
    
    weak var delegate: ViewModelDelegate? {get set}
    var posts:[PostData]? { get }
    var model: ModelProtocol? { get }
    
    func getPhotographyForumHeaderData() -> Void
    func setImageFrom(url:String, toImageView image: UIImageView) -> Void
}

protocol ViewModelDelegate: class {
    func photographyForumHeaderDataReceived(photographyStruct: PhotographForumHeader) -> Void
    func photographyForumPostsReceived(posts: [PostData]) -> Void
}
