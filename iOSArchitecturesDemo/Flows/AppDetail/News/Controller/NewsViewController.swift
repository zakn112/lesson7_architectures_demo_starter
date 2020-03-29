//
//  NewsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Закусов on 29.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class NewsViewController: UIViewController {
    private let app: ITunesApp
    
    private var newsView: NewsView {
        return self.view as! NewsView
    }
    
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
     
     override func loadView() {
         super.loadView()
         self.view = NewsView()
     }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.fillData()
     }
    
    // MARK: - Private
       
    private func fillData() {
        self.newsView.titileLabel.text = "Что нового"
        self.newsView.versionLabel.text = app.version
        self.newsView.releaseNotes.text = app.releaseNotes
    }
}

