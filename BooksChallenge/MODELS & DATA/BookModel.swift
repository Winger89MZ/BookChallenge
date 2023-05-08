//
//  BookModel.swift
//  BooksChallenge
//
//  Created by Laurence Stone on 5/8/23.
//

import Foundation

class BookModel {
    var books = [Book]()
    
    init() {
        print("now trying to init")
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        if let path = pathString {
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                do {
                    let bookData = try decoder.decode([Book].self, from: data)
                    self.books = bookData
                } catch {
                    print(error)
                }
            } catch {
                print(error)
            }
        }
    }
}
