//
//  ContentTableViewCell.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/18/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    var avatarImage: UIImageView!
    var contentTextLabel: UILabel!
    var usernameLabel: UILabel!
    var imagesView: UIView!
    var firstImage: UIImageView!
    var secondImage: UIImageView!
    var thirdImage: UIImageView!
    var fourthImage: UIImageView!
    var moreImagesLabel: UILabel!
    var upVotesLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.avatarImage = UIImageView()
        self.contentTextLabel = UILabel()
        self.usernameLabel = UILabel()
        self.imagesView = UIView(frame: CGRect(x: 0, y: 0, width: 330, height: 70))
        self.contentTextLabel.lineBreakMode = .byWordWrapping
        self.contentTextLabel.numberOfLines = 5
        self.contentTextLabel.font = UIFont.systemFont(ofSize: 12)

        self.firstImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        self.secondImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        self.thirdImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        self.fourthImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        self.moreImagesLabel = UILabel()
        self.moreImagesLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.moreImagesLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.upVotesLabel = UILabel()
        
        contentView.addSubview(avatarImage)
        contentView.addSubview(contentTextLabel)
        contentView.addSubview(usernameLabel)
        imagesView.addSubview(firstImage)
        imagesView.addSubview(secondImage)
        imagesView.addSubview(thirdImage)
        imagesView.addSubview(fourthImage)
        imagesView.addSubview(moreImagesLabel)
        contentView.addSubview(imagesView)
        contentView.addSubview(upVotesLabel)
        
        self.avatarImage.snp.makeConstraints { (make) in
            make.bottom.equalTo(usernameLabel).inset(0)
            make.top.equalTo(contentView).inset(5)
            make.left.equalTo(contentView).inset(8)
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        
        self.contentTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).inset(0)
            make.left.equalTo(avatarImage.snp.right).inset(-8)
            make.width.equalTo(260)
        }
        
        self.usernameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(avatarImage).inset(0)
            make.left.equalTo(avatarImage.snp.right).inset(-8)
            make.width.equalTo(260)
        }
        
        self.imagesView.snp.makeConstraints { (make) in
            make.top.equalTo(avatarImage.snp.bottom).inset(-5)
            make.centerX.equalTo(contentView)
            make.height.equalTo(69)
            make.width.equalTo(330)
        }
        
        self.firstImage.snp.makeConstraints { (make) in
            make.left.equalTo(imagesView).inset(10)
            make.right.equalTo(secondImage.snp.left).inset(-10)
            make.bottom.equalTo(imagesView.snp.bottom).inset(2)
            make.top.equalTo(imagesView).inset(2)
            make.width.equalTo(65)
            make.height.equalTo(65)
        }
        self.secondImage.snp.makeConstraints { (make) in
            make.right.equalTo(thirdImage.snp.left).inset(-10)
            make.bottom.equalTo(imagesView.snp.bottom).inset(2)
            make.top.equalTo(imagesView).inset(2)
            make.width.equalTo(65)
            make.height.equalTo(65)
        }
        self.thirdImage.snp.makeConstraints { (make) in
            make.right.equalTo(fourthImage.snp.left).inset(-10)
            make.bottom.equalTo(imagesView.snp.bottom).inset(2)
            make.top.equalTo(imagesView).inset(2)
            make.width.equalTo(65)
            make.height.equalTo(65)
        }
        self.fourthImage.snp.makeConstraints { (make) in
            make.right.equalTo(imagesView.snp.right).inset(10)
            make.bottom.equalTo(imagesView.snp.bottom).inset(2)
            make.top.equalTo(imagesView).inset(2)
            make.width.equalTo(65)
            make.height.equalTo(65)
        }
        self.moreImagesLabel.snp.makeConstraints { (make) in
            make.left.equalTo(fourthImage).inset(30)
            make.top.equalTo(fourthImage).inset(10)
            make.bottom.equalTo(fourthImage).inset(2)
        }
        self.upVotesLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(5)
            make.width.equalTo(100)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
