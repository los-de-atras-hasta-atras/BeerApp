//
//  Product.swift
//  BeerApp
//
//  Created by José Gil Ramírez S on 27/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import Foundation


struct Product: Codable {
    let id, businessID: Int
    let name, description: String
    let category: String
    let type: String
    let meta: Meta
    let createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case businessID = "business_id"
        case name, description, category, type, meta
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct Meta: Codable {
    let id: String
    let abv: String?
    let name: String
    let style: Style
    let status: String
    let styleID: Int
    let breweries: [Brewery]
    let isOrganic: String
    let createDate, updateDate, nameDisplay: String
    let statusDisplay: String
    let ibu: String?
    let labels: Labels?
    let description: String?
    let srm: Srm?
    let year: Int?
    let glass: Glass?
    let srmID: Int?
    let available: Available?
    let availableID, glasswareID: Int?
    let servingTemperature, servingTemperatureDisplay, foodPairings, originalGravity: String?
    
    enum CodingKeys: String, CodingKey {
        case id, abv, name, style, status
        case styleID = "style_id"
        case breweries
        case isOrganic = "is_organic"
        case createDate = "create_date"
        case updateDate = "update_date"
        case nameDisplay = "name_display"
        case statusDisplay = "status_display"
        case ibu, labels, description, srm, year, glass
        case srmID = "srm_id"
        case available
        case availableID = "available_id"
        case glasswareID = "glassware_id"
        case servingTemperature = "serving_temperature"
        case servingTemperatureDisplay = "serving_temperature_display"
        case foodPairings = "food_pairings"
        case originalGravity = "original_gravity"
    }
}

struct Available: Codable {
    let id: Int
    let name: String
    let description: String
}


struct Brewery: Codable {
    let id, name: String
    let images: Images?
    let status: String
    let website: String?
    let locations: [Location]
    let isOrganic: String
    let createDate: String
    let description, established: String?
    let updateDate: String
    let isMassOwned: String
    let statusDisplay: String
    let nameShortDisplay: String
    let brandClassification: String
    let mailingListURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, images, status, website, locations
        case isOrganic = "is_organic"
        case createDate = "create_date"
        case description, established
        case updateDate = "update_date"
        case isMassOwned = "is_mass_owned"
        case statusDisplay = "status_display"
        case nameShortDisplay = "name_short_display"
        case brandClassification = "brand_classification"
        case mailingListURL = "mailing_list_url"
    }
}



struct Images: Codable {
    let icon, large, medium, squareLarge: String
    let squareMedium: String
    
    enum CodingKeys: String, CodingKey {
        case icon, large, medium
        case squareLarge = "square_large"
        case squareMedium = "square_medium"
    }
}


struct Location: Codable {
    let id, name: String
    let phone, region: String?
    let status: String
    let country: Country
    let website: String?
    let latitude: Double?
    let locality: String?
    let isClosed: String
    let longitude: Double?
    let isPrimary: String
    let createDate: String
    let inPlanning: String
    let postalCode: String?
    let updateDate: String
    let yearOpened: String?
    let locationType: String
    let openToPublic: String
    let statusDisplay: String
    let streetAddress: String?
    let countryISOCode: String
    let locationTypeDisplay: String
    let yearClosed, hoursOfOperation, extendedAddress: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, phone, region, status, country, website, latitude, locality
        case isClosed = "is_closed"
        case longitude
        case isPrimary = "is_primary"
        case createDate = "create_date"
        case inPlanning = "in_planning"
        case postalCode = "postal_code"
        case updateDate = "update_date"
        case yearOpened = "year_opened"
        case locationType = "location_type"
        case openToPublic = "open_to_public"
        case statusDisplay = "status_display"
        case streetAddress = "street_address"
        case countryISOCode = "country_iso_code"
        case locationTypeDisplay = "location_type_display"
        case yearClosed = "year_closed"
        case hoursOfOperation = "hours_of_operation"
        case extendedAddress = "extended_address"
    }
}

struct Country: Codable {
    let name: String
    let isoCode: String
    let isoThree: String
    let createDate:String
    let numberCode: Int
    let displayName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case isoCode = "iso_code"
        case isoThree = "iso_three"
        case createDate = "create_date"
        case numberCode = "number_code"
        case displayName = "display_name"
    }
}





struct Glass: Codable {
    let id: Int
    let name: String
    let createDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case createDate = "create_date"
    }
}



struct Labels: Codable {
    let icon, large, medium: String
}

struct Srm: Codable {
    let id: Int
    let hex, name: String
}

struct Style: Codable {
    let id: Int
    let name: StyleName
    let fgMax, fgMin, ogMin, abvMax: String
    let abvMin, ibuMax, ibuMin, srmMax: String
    let srmMin: String
    let category: Glass
    let shortName: ShortName
    let categoryID: Int
    let createDate: CreateDate
    let description: String
    let updateDate: UpdateDate
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case fgMax = "fg_max"
        case fgMin = "fg_min"
        case ogMin = "og_min"
        case abvMax = "abv_max"
        case abvMin = "abv_min"
        case ibuMax = "ibu_max"
        case ibuMin = "ibu_min"
        case srmMax = "srm_max"
        case srmMin = "srm_min"
        case category
        case shortName = "short_name"
        case categoryID = "category_id"
        case createDate = "create_date"
        case description
        case updateDate = "update_date"
    }
}
