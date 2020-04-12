//
//  SearchSongsPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Закусов on 29.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongsViewInput: class {
    
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
}

protocol SearchSongsViewOutput: class {
    
    func viewDidSearch(with query: String)
    
    func viewDidSelectApp(_ song: ITunesSong)
}

class SearchSongsPresenter {
    
    var viewInput: (UIViewController & SearchSongsViewInput)?
    
    let interactor: SearchSongsInteractorInput
    let router: SearchSongsRouterInput

    init(interactor: SearchSongsInteractorInput, router: SearchSongsRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestSongs(with query: String) {
        self.interactor.requestSongs(with: query) { [weak self]  results in
        guard let self = self else { return }
        self.viewInput?.throbber(show: false)
        results
            .withValue { songs in
                guard !songs.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = songs
            }
            .withError {
                self.viewInput?.showError(error: $0)
            }
            
        }
    }
   
}

extension SearchSongsPresenter: SearchSongsViewOutput {
    func viewDidSearch(with query: String) {
        self.requestSongs(with: query)
    }
    
    func viewDidSelectApp(_ song: ITunesSong) {
       self.router.openDetails(for: song)
    }
    
    
}
