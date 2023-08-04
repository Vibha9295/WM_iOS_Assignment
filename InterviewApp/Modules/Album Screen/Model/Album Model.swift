//
//  Album Model.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import Foundation
struct AlbumModel : Codable {
    let userId : Int?
    let id : Int?
    let title : String?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case id = "id"
        case title = "title"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }

}
