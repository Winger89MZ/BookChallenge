//
//  ReadingView.swift
//  BooksChallenge
//
//  Created by Laurence Stone on 5/8/23.
//

import SwiftUI

struct ReadingView: View {
    @EnvironmentObject var myBooks: BookModel
    var bookTitle: String
    var bookContent: [String]
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 5) {
                Text(bookTitle)
                    .font(.largeTitle)
                    .padding(.top)
                ScrollViewReader { scrollViewProxy in
                    ScrollView(.horizontal) {
                        HStack() {
                            ForEach(1..<bookContent.count, id: \.self) { j in
                                ZStack(alignment: .top){
                                    Rectangle()
                                        .frame(width: 380, height: 700)
                                        .foregroundColor(Color("offWhite"))
                                    VStack(spacing: 0) {
                                        Text(bookContent[j]).foregroundColor(.black)
                                            .frame(width: 360)
                                            .padding(.top)
                                        Spacer()
                                        Text("\(j)")
                                            .foregroundColor(.black)
                                            .padding(.bottom)
//                                            .onAppear(perform: {
//                                                let k = myBooks.books.firstIndex( where: {$0.title == bookTitle })!
//                                                myBooks.books[k].savedPage = j
//                                                print(" j = \(j)")
//                                            })
                                    }
                                }.tag(j)
                                
                            }
                        }
                    }.onAppear(perform: {
                        let k = myBooks.books.firstIndex( where: {$0.title == bookTitle })!
                        print("k = \(k)")
                        scrollViewProxy.scrollTo(k)  //incorporate myBooks.books[k].savedPage storage?
                    })
                }
                
            }
        }.background(Color.mint).grayscale(0.25)
            .padding(.top)

    }

}

struct ReadingView_Previews: PreviewProvider {
    static let myBooks = BookModel()
    static var previews: some View {
        ReadingView(bookTitle: myBooks.books[3].title, bookContent: myBooks.books[3].content)
            .environmentObject(myBooks)
    }
}
