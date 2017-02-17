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
    weak var delegate: ViewModelDelegate?
    var model: ModelProtocol?
    
    init(withModel model: ModelProtocol) {
        self.model = model
    }
    
    func getPhotographyForumHeaderData() {
        guard let model = self.model else {
            return
        }
        model.getPhotographyForumData()
    }
    
    func setImageFrom(url: String, toImageView image: UIImageView) {
        
    }
    
}

extension ViewModel: ModelDelegate {
    func photographyForumDataReceived(headerData: PhotographForumHeader) -> Void {
        
    }
}
