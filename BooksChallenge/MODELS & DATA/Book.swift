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
    let isFavourite: Bool
    let currentPage: Int
    let rating: Int
    let id: Int
    let content: [String]
}
