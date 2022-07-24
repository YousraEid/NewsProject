//
//  NewsModel.swift
//  News
//
//  Created by apple on 23/07/2022.
//

import Foundation

struct article:Codable {

    var author:String?
    var title:String
    var description:String?
    var urlToImage:String?
    var publishedAt:String
    var url : String?
    
}

struct News:Codable {
    var articles:[article]
}
