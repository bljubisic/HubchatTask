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

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.avatarImage = UIImageView()
        
        contentView.addSubview(avatarImage)
        
        self.avatarImage.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView).inset(5)
            make.top.equalTo(contentView).inset(5)
            make.left.equalTo(contentView).inset(8)
            make.width.equalTo(90)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
