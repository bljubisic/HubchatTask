//
//  HeaderTableViewCell.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/18/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import UIKit
import SnapKit

class HeaderTableViewCell: UITableViewCell {

    var headerImage: UIImageView!
    var logoImage: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.headerImage = UIImageView()
        self.logoImage = UIImageView()
        self.titleLabel = UILabel()
        self.descriptionLabel = UILabel()
        self.titleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.descriptionLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.descriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        contentView.addSubview(headerImage)
        contentView.addSubview(logoImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        self.headerImage.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(UIEdgeInsetsMake(0, 8, 0, 8))
        }
        
        self.logoImage.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView).inset(0)
            make.top.equalTo(contentView).inset(16)
            make.left.equalTo(contentView).inset(14)
            make.width.equalTo(90)
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).inset(16)
            make.left.equalTo(self.logoImage).inset(125)
            make.bottom.equalTo(contentView).inset(46)
            make.width.equalTo(220)
        }
        
        self.descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel).inset(16)
            make.left.equalTo(self.logoImage).inset(125)
            make.bottom.equalTo(contentView).inset(9)
            make.width.equalTo(220)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup() -> Void {
        
    }

}
