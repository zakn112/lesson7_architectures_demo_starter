//
//  SearchSongInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Закусов on 05.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchSongsInteractorInput {
    
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

final class SearchSongsInteractor: SearchSongsInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        self.searchService.getSongs(forQuery: query, completion: completion)
    }
}
