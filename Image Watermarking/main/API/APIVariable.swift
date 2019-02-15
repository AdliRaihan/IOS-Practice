//
//  APIVariable.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 13/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation

struct popular : Decodable {
    let success:Bool
    let elapsedMS:Int
    let warning :String?
    let result : [result]
}
struct result : Decodable {
    let generatorID: Int?
    let imageID: Int?
    let displayName: String?
    let urlName: String?
    let totalVotesScore: Int?
    let instancesCount: Int?
    let ranking: Int?
    let imageUrl: String?
}

struct entityVotesSummary : Decodable {
    let entityName: String?
    let entityID: Int?
    let totalVotesSum: Int?
    let userID: Int?
    let userVoteScore: Int?
}
