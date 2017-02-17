//
//  ModelProtocol.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/17/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import Foundation

protocol ModelProtocol {
    
    func getPhotographyForumHeader()
    func getPhotographyPostsFor(PhotographyHeader photoForumStruct: PhotographForumHeader)
    
    var photographyForumStruct: PhotographForumHeader? { get }
    
    weak var delegate: ModelDelegate? { get set }
    
    func setImageWithCompletion(completion: (Data, Error) -> Void)
    
}

protocol ModelDelegate: class {
    
}
