//
//  Book.swift
//  BooksChallenge
//
//  Created by Laurence Stone on 5/8/23.
//

import Foundation

struct Book: Identifiable, Decodable {
    let title: String
    let author: String
    var isFavourite: Bool
    var currentPage: Int
    var rating: Int
    let id: Int
    let content: [String]
    var savedPage: Int
}
