//
//  NewsView.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Закусов on 29.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class NewsView: UIView {
    // MARK: - Subviews

   private(set) lazy var titileLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.textColor = .lightGray
          label.font = UIFont.boldSystemFont(ofSize: 30.0)
          label.numberOfLines = 1
          return label
      }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        return label
    }()

    private(set) lazy var releaseNotes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        return label
    }()

   
    // MARK: - Init
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           self.setupLayout()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           self.setupLayout()
       }
       
       // MARK: - UI
       
    private func setupLayout() {
        self.addSubview(self.titileLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.releaseNotes)
        
        NSLayoutConstraint.activate([
            self.titileLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.titileLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.titileLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            self.titileLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            self.versionLabel.topAnchor.constraint(equalTo: self.titileLabel.bottomAnchor, constant: 12.0),
            self.versionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.versionLabel.widthAnchor.constraint(equalToConstant: 120.0),
            self.versionLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
            self.releaseNotes.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 12.0),
            self.releaseNotes.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.releaseNotes.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0)
            
        ])
    }
}
