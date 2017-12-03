//
//  Beer.swift
//  RM30902
//
//  Created by Rodrigo on 30/11/17.
//  Copyright © 2017 Rodrigo Cocate. All rights reserved.
//

import Foundation

class Beer {
    
    var _id: Int?
    var _name: String?
    var _tagline: String?
    var _description: String?
    var _abv: Double?
    var _ibu: Double?
    var _image_url: String?
    
    init(name: String, tagline: String, description: String, abv: Double, ibu: Double, image_url: String) {
        self._name = name
        self._tagline = tagline
        self._description = description
        self._abv = abv
        self._ibu = ibu
        self._image_url = image_url
    }
}
