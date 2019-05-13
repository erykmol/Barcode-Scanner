//
//  Product.swift
//  Scanner
//
//  Created by Eryk Mól on 22.03.19.
//  Copyright © 2019 Eryk Mól. All rights reserved.
//

import Foundation
import UIKit

class HistoryCell: UITableViewCell {
    var name : String?
    var cellImage : UIImage?
    var code : String?
    
    var nameLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var codeLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cellImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(cellImageView)
        self.addSubview(nameLabel)
        self.addSubview(codeLabel)
        
        
        cellImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        cellImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        //cellImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).priority = UILayoutPriority(999);
        cellImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        //cellImageView.widthAnchor.constraint(equalToConstant: 100).priority = UILayoutPriority(999);
        cellImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //cellImageView.heightAnchor.constraint(equalToConstant: 100).priority = UILayoutPriority(999);
        cellImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: self.cellImageView.rightAnchor, constant: 4).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        
        codeLabel.leftAnchor.constraint(equalTo: self.cellImageView.rightAnchor, constant: 4).isActive = true
        codeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
        codeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        codeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cellImageView.layer.cornerRadius = cellImageView.bounds.size.height / 2.0
        cellImageView.clipsToBounds = true
        
        codeLabel.font = codeLabel.font.withSize(14)
        codeLabel.textColor = UIColor.lightGray
        
        //codeLabel.font = codeLabel.font.withSize(18)
        nameLabel.textColor = UIColor.white
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.numberOfLines = 2
        
        if let name = name {
            nameLabel.text = name
        }
        if let image = cellImage {
            
            cellImageView.image = image
        }
        if let code = code {
            codeLabel.text = code
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been impemented")
    }
}
