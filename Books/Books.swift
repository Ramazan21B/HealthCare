//
//  Books.swift
//  Books
//
//  Created by Aitzhan Ramazan on 17.07.2024.
//

import Foundation
import SwiftyJSON
struct Books{
    var title = ""
    var bite = ""
    init(){
        
    }
    init(json: JSON){
        if let item = json["bite"].string{
            bite = item
        }
        if let item = json["title"].string{
            title = item
        }
    }
}

