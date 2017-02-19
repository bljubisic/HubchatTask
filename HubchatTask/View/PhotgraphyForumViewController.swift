//
//  PhotgraphyForumTableViewController.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 2/18/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import UIKit
import SnapKit

class PhotgraphyForumViewController: UIViewController {

    var viewModel: ViewModelProtocol!
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getPhotographyForumHeaderData()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tableView = UITableView()
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: "sectionHeader")
        self.tableView.register(ContentTableViewCell.self, forCellReuseIdentifier: "contentCell")
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(20, 5, 5, 0))
        }
    }
}

extension PhotgraphyForumViewController: ViewModelDelegate {
    func photographyForumDataReceived(photographyStruct: PhotographForumHeader) -> Void {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.setContentOffset(CGPoint.zero, animated:true)
        }
    }
}

extension PhotgraphyForumViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let posts = viewModel.posts else {
            return 0
        }
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "contentCell"
        let cell: ContentTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ContentTableViewCell
        guard let posts = viewModel.posts else {
            return cell
        }
        cell.contentTextLabel.text = posts[indexPath.row].postText
        cell.usernameLabel.text = posts[indexPath.row].user.username
        cell.upVotesLabel.text = "Up Votes: \(posts[indexPath.row].upvotes)"
        viewModel.setImageFrom(url: posts[indexPath.row].user.avatar, toImageView: cell.avatarImage)
       
        let images = posts[indexPath.row].images
        if images.count > 0 {
            var i = 0
            while (i < 4 && images.count > 4) || (i < images.count && images.count <= 4) {

                viewModel.setImageFrom(url: images[i], toImageView: cell.imagesView.subviews[i] as! UIImageView)
                i = i + 1
            }
        }
        else {
            cell.firstImage.image = nil
            cell.secondImage.image = nil
            cell.thirdImage.image = nil
            cell.fourthImage.image = nil
        }
        if images.count > 4 {
            let res = images.count - 4
            cell.moreImagesLabel.text = "+\(res)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension PhotgraphyForumViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(integerLiteral: 100)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cellIdentifier = "sectionHeader"
        let cell: HeaderTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! HeaderTableViewCell
        guard let header = viewModel.header else {
            return nil
        }
        cell.titleLabel.text = header.title
        cell.descriptionLabel.text = header.description
        viewModel.setImageFrom(url: header.headerImage, toImageView: cell.headerImage)
        viewModel.setImageFrom(url: header.logoImage, toImageView: cell.logoImage)
        return cell
    }
    

}
