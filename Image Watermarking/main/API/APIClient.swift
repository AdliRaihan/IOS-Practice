//
//  APIClient.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 13/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation

typealias getAPIJSON = [String : Any?]
class APIClient{

    static func initJSON(iteration:Int) -> String{
        print("Hello JSON")
        let apiMeme = "http://version1.api.memegenerator.net/Generators_Select_ByPopular"

        let apiGenerator = URL(string: apiMeme)
        var StringURLImages = ""
        if let unwrappedurl = apiGenerator{
        }

        
        return StringURLImages
    }
}
