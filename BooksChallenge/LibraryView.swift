//
//  LibraryView.swift
//  BooksChallenge
//
//  Created by Laurence Stone on 5/8/23.
//

import SwiftUI

struct LibraryView: View {
    let myBooks = BookModel()
    //myBooks.books is the array of books
    
    var body: some View {
        GeometryReader { g in
        VStack(alignment: .leading) {
            Text("My Library")
                .font(.largeTitle).foregroundColor(.mint).grayscale(0.5)
            ScrollView {

                ForEach(1..<myBooks.books.count+1, id: \.self) { b in
                        ZStack {
                                Rectangle()
                                    .fill(Color.mint).grayscale(0.5)
                                    .frame(width: g.size.width - 20, height: g.size.width * 1.6)
                                    .cornerRadius(10)
                                    .blur(radius: 5)
                                    .onAppear(perform: {
                                        print(myBooks.books.count)
                                    })

                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(myBooks.books[b-1].title).font(.title.bold()).foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "star").foregroundColor(.black)
                                            .font(.system(size: 30).bold())
                                    }.padding(.horizontal)
                                    Text(myBooks.books[b-1].author).font(.title3).foregroundColor(.black)
                                        .padding(.horizontal).padding(.bottom)
                                    Image("cover\(b)")
                                        .resizable().scaledToFit().clipped()
                                        .padding(.horizontal)
                                }.padding(.horizontal)
                                
                                
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
