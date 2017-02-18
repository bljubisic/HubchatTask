//
//  ViewModel.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/17/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import Foundation
import UIKit

class ViewModel: ViewModelProtocol{
    
    var posts: [PostData]?
    var header: PhotographForumHeader?
    weak var delegate: ViewModelDelegate?
    var model: ModelProtocol?
    
    init(withModel model: ModelProtocol) {
        self.header = PhotographForumHeader()
        self.posts = []
        self.model = model
        self.model?.delegate = self
    }
    
    func getPhotographyForumHeaderData() {
        guard let model = self.model else {
            return
        }
        model.getPhotographyForumData()
    }
    
    func setImageFrom(url: String, toImageView image: UIImageView) {
        model?.setImageWithCompletion(withURL: url, completion: { (data, error) in
            guard let tmpData = data else {
                return
            }
            let tmpImage = UIImage(data: tmpData)
            
            DispatchQueue.main.async {
                image.image = tmpImage
            }
        })
    }
    
}

extension ViewModel: ModelDelegate {
    func photographyForumDataReceived(headerData: PhotographForumHeader) -> Void {
        guard let delegate = self.delegate else {
            return
        }
        self.header = headerData
        self.posts = headerData.posts
        delegate.photographyForumDataReceived(photographyStruct: headerData)
    }
}
