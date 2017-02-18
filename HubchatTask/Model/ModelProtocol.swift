//
//  ModelProtocol.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/17/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ModelProtocol {

    weak var delegate: ModelDelegate? { get set }
    func getPhotographyForumData() -> Void
    //func getPhotographyForumPosts(completion: @escaping (JSON) -> Void) -> Void
    //func getPhotographyForumHeader(completion: @escaping (JSON) -> Void)
    func setImageWithCompletion(withURL url: String, completion: @escaping (Data?, Error?) -> Void)
    
}

protocol ModelDelegate: class {
    
    func photographyForumDataReceived(headerData: PhotographForumHeader) -> Void
}
