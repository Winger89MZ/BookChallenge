//
//  BookView.swift
//  BooksChallenge
//
//  Created by Laurence Stone on 5/8/23.
//

import SwiftUI

struct BookView: View {
    @EnvironmentObject var myBooks: BookModel
    //myBooks.books is the array of books
    var bookIndex: Int
    
    var body: some View {
        VStack() {
            Text(myBooks.books[bookIndex].title)
                .font(.largeTitle.bold())
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Read Now!")
                    .font(.headline)
                    .foregroundColor(.black)
            })
            Image("cover\(bookIndex)")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 40)
                .shadow(radius: 10, x: -5, y: 5)
            VStack() {
                Text("Mark for Later")
                Button(action: {
                    myBooks.books[bookIndex].isFavourite.toggle()
                }, label: {
                    Image(systemName: myBooks.books[bookIndex].isFavourite ? "star.fill" : "star")
                        .font(.system(size: 33))
                })

            }
            Spacer()
            VStack() {
                Text("Rate this book")
                Picker("number stars", selection: $myBooks.books[bookIndex].rating) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
            }
            
        }
        .background(Color.mint).grayscale(0.25)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(bookIndex: 3)
            .environmentObject(BookModel())
    }
}
