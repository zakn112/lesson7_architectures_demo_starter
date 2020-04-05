//
//  SearchSongRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Закусов on 05.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongsRouterInput {
    
    func openDetails(for app: ITunesSong)
    
}

final class SearchSongsRouter: SearchSongsRouterInput {
    
    weak var viewController: UIViewController?
    
    func openDetails(for song: ITunesSong) {
//        let appDetaillViewController = AppDetailViewController(app: app)
//        self.viewController?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
    
}

