//
//  HCModel.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/17/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HCModel: ModelProtocol {
    
    weak var delegate: ModelDelegate?
    
    func getPhotographyForumData() -> Void {
        self.getPhotographyForumHeader { (json) in
            var photographyForumHeaderData = PhotographForumHeader()
            
            photographyForumHeaderData.headerImage = json["headerImage"]["url"].stringValue
            photographyForumHeaderData.logoImage = json["image"]["url"].stringValue
            photographyForumHeaderData.title = json["title"].stringValue
            photographyForumHeaderData.description = json["description"].stringValue
            self.getPhotographyForumPosts { (postsJSON) in
                var posts: [PostData] = []
                
                for post in postsJSON["posts"].arrayValue {
                    var postData = PostData()
                    postData.postText = post["rawContent"].stringValue
                    postData.user = ProfileData(avatar: post["createdBy"]["avatar"]["url"].stringValue, username: post["createdBy"]["username"].stringValue)
                    for image in post["entities"]["images"].arrayValue {
                        postData.images.append(image["cdnUrl"].stringValue)
                    }
                    postData.upvotes = post["stats"]["upVotes"].intValue
                    posts.append(postData)
                }
                photographyForumHeaderData.posts = posts
                
                guard let delegate = self.delegate else {
                    return
                }
                delegate.photographyForumDataReceived(headerData: photographyForumHeaderData)
            }
        }
    }
    
    func getPhotographyForumHeader(completion: @escaping (JSON) -> Void) {
        Alamofire.request(URLs.headers).responseJSON { (response) in
            guard let json = response.result.value else {
                return
            }
            let JSONContent = JSON(json)
            let forum = JSONContent["forum"]
            completion(forum)

        }
    }
    
    func getPhotographyForumPosts(completion: @escaping (JSON) -> Void) -> Void {
        
        Alamofire.request(URLs.posts).responseJSON { (response) in
            guard let json = response.result.value else {
                return
            }
            let JSONContent = JSON(json)
            completion(JSONContent)
        }
    }

    func setImageWithCompletion(withURL url:String, completion: @escaping (Data?, Error?) -> Void) {
        Alamofire.request(url).responseData { (data) in
            completion(data.data, nil)
        }
    }
}
