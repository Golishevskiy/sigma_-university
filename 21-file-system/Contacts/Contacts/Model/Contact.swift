//
//  Contact.swift
//  Contacts
//
//  Created by Petro Golishevskiy on 02.06.2021.
//

import Foundation

struct Contact: Codable {
    var firstName: String
    var secondName: String
    var phone: String?
    var image: String?
    var url: URL?
}
