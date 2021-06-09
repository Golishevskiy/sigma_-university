//
//  Repositories.swift
//  HW22
//
//  Created by Petro Golishevskiy on 03.06.2021.
//

import Foundation

struct Repositories: Codable {
    let totalCount: Int
//    let incompleteResults: Bool
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
//        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Item: Codable {
    let id: Int
    let name: String
    let fullName: String
    let owner: Owner
    let itemDescription: String?
    let stars: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case itemDescription = "description"
        case stars = "stargazers_count"
    }
}

struct Owner: Codable {
    let avatarURL: String
    let htmlURL: String

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
    }
}
