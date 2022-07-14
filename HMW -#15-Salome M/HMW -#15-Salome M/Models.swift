//
//  Models.swift
//  HMW -#15-Salome M
//
//  Created by Mcbook Pro on 12.07.22.
//

import Foundation
import UIKit


       enum Genre: String, CaseIterable {
           case all = "All"
           case comedy = "Comedy"
           case action = "Action"
           case drama = "Drama"
           
           private var sortOrder: Int {
               switch self {
                   case .all:
                       return 0
                   case .comedy:
                       return 1
                   case .action:
                       return 2
                 case .drama:
                   return 3
               }
           }
           
           static func ==(lhs: Genre, rhs: Genre) -> Bool {
              return lhs.sortOrder == rhs.sortOrder
          }

          static func <(lhs: Genre, rhs: Genre) -> Bool {
             return lhs.sortOrder < rhs.sortOrder
          }
       }

       
class Movie {
    
    static let movies =  [
        Movie(image: #imageLiteral(resourceName: "Avatar") ,genre: .action, title: "Avatar", releaseDate: "18 Dec 2009", imdb: 7.9, mainActor: "Zoe Saldana", seen: false, isFavourite: true),
        Movie(image: #imageLiteral(resourceName: "i am legend"),genre: .action, title: "I Am Legend", releaseDate: "14 Dec 2007", imdb: 7.3, mainActor: "Will Smith", seen: false, isFavourite: true),
        Movie(image: #imageLiteral(resourceName: "The Hangover"),genre: .comedy, title: "The Hangover", releaseDate: "04 May 2012", imdb: 8.1, mainActor: "Robert Downey Jr", seen: false, isFavourite: true),
        Movie(image: #imageLiteral(resourceName: "interstelar"),genre: .drama, title:  "Interstellar", releaseDate: "07 Nov 2014", imdb: 9.0, mainActor: "Matthew McConaughey", seen: true, isFavourite: true),
        Movie(image: #imageLiteral(resourceName: "Breaking Bad"),genre: .action, title: "Breaking Bad", releaseDate: "20 Jan 2008", imdb: 9.5, mainActor: "Bryan Cranston", seen: false, isFavourite: true),
        Movie(image: #imageLiteral(resourceName: "narcos"),genre: .action, title: "Narcos", releaseDate: "28 Aug 2015", imdb: 8.9, mainActor: "8.9", seen: true, isFavourite: true),
        Movie(image: #imageLiteral(resourceName: "Power"),genre: .action, title: "Power", releaseDate: "14 Dec 2007", imdb: 5.9, mainActor: "Omari Hardwick", seen: false, isFavourite: true ),
        Movie(image: #imageLiteral(resourceName: "Dumb and Dumber"),genre: .comedy, title: "Dumb and Dumber", releaseDate:  "28 Aug 2015", imdb: 8.9, mainActor: "Carlo Bernard", seen: false, isFavourite: false),
        Movie(image: #imageLiteral(resourceName: "ace-ventura"),genre: .comedy, title:  "Ace Ventura", releaseDate: "09 Mar 2007", imdb: 7.7, mainActor: "Zack Snyder", seen: true, isFavourite: false),
        Movie(image: #imageLiteral(resourceName: "Game Of Thrones"),genre: .drama, title:  "Game Of Thrones", releaseDate: "17 Apr 2011", imdb: 9.6, mainActor: "Peter Dinklage", seen: true, isFavourite: false),
        
    ]
    let image : UIImage
    let genre: Genre
    let title: String
    let releaseDate: String
    let imdb: Double
    let mainActor: String
    var seen: Bool?
    let isFavourite: Bool
    let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
    
    
    init(image : UIImage, genre: Genre,title: String,releaseDate: String,imdb: Double,mainActor: String, seen: Bool, isFavourite: Bool ){
        self.image = image
        self.genre = genre
        self.title = title
        self.releaseDate = releaseDate
        self.imdb = imdb
        self.mainActor = mainActor
        self.seen = seen
        self.isFavourite = isFavourite
    }
}
