//
//  NearByPlacesResponseModel.swift
//  NearByApp
//
//  Created by developer on 10/07/2020.
//  Copyright © 2020 developer. All rights reserved.
//
import Foundation
 
// NearByPlacesResponseModel.swift

 

// MARK: - NearByPlacesResponseModel
public struct NearByPlacesResponseModel : Decodable {
    public var meta: Meta?
    public var response: Response?

    public init() {
   
    }
}

// Meta.swift

 

// MARK: - Meta
public struct Meta : Decodable {
    public var code: Int?
    public var requestId: String?

    public init(code: Int?, requestId: String?) {
        self.code = code
        self.requestId = requestId
    }
}

// Response.swift

 

// MARK: - Response
public struct Response : Decodable {
    public var warning: Warning?
    public var suggestedRadius: Int?
    public var headerLocation: String?
    public var headerFullLocation: String?
    public var headerLocationGranularity: String?
    public var totalResults: Int?
    public var suggestedBounds: SuggestedBounds?
    public var groups: [Group]?

    public init() {
       
    }
}

// Group.swift

 

// MARK: - Group
public struct Group : Decodable {
    public var type: String?
    public var name: String?
    public var items: [GroupItem]?

    public init(type: String?, name: String?, items: [GroupItem]?) {
        self.type = type
        self.name = name
        self.items = items
    }
}

// GroupItem.swift

 

// MARK: - GroupItem
public struct GroupItem : Decodable {
    public var reasons: Reasons?
    public var venue: Venue?

    public init(reasons: Reasons?, venue: Venue?) {
        self.reasons = reasons
        self.venue = venue
    }
}

// Reasons.swift

 

// MARK: - Reasons
public struct Reasons : Decodable {
    public var count: Int?
    public var items: [ReasonsItem]?

    public init(count: Int?, items: [ReasonsItem]?) {
        self.count = count
        self.items = items
    }
}

// ReasonsItem.swift

 

// MARK: - ReasonsItem
public struct ReasonsItem : Decodable {
    public var summary: String?
    public var type: String?
    public var reasonName: String?

    public init(summary: String?, type: String?, reasonName: String?) {
        self.summary = summary
        self.type = type
        self.reasonName = reasonName
    }
}

// Venue.swift

 

// MARK: - Venue
public struct Venue : Decodable {
    public var id: String?
    public var name: String?
    public var location: Location?
    public var categories: [Category]?
    public var popularityByGeo: Double?
    public var venuePage: VenuePage?

    public init(id: String?, name: String?, location: Location?, categories: [Category]?, popularityByGeo: Double?, venuePage: VenuePage?) {
        self.id = id
        self.name = name
        self.location = location
        self.categories = categories
        self.popularityByGeo = popularityByGeo
        self.venuePage = venuePage
    }
}

// Category.swift

 

// MARK: - Category
public struct Category : Decodable {
    public var id: String?
    public var name: String?
    public var pluralName: String?
    public var shortName: String?
    public var icon: Icon?
    public var primary: Bool?

    public init(id: String?, name: String?, pluralName: String?, shortName: String?, icon: Icon?, primary: Bool?) {
        self.id = id
        self.name = name
        self.pluralName = pluralName
        self.shortName = shortName
        self.icon = icon
        self.primary = primary
    }
}

// Icon.swift

 

// MARK: - Icon
public struct Icon : Decodable {
    public var iconPrefix: String?
    public var suffix: String?

    public init(iconPrefix: String?, suffix: String?) {
        self.iconPrefix = iconPrefix
        self.suffix = suffix
    }
}

// Location.swift

 

// MARK: - Location
public struct Location : Decodable {
    public var address: String?
    public var crossStreet: String?
    public var lat: Double?
    public var lng: Double?
    public var labeledLatLngs: [LabeledLatLng]?
    public var distance: Int?
    public var postalCode: String?
    public var cc: String?
    public var city: String?
    public var state: String?
    public var country: String?
    public var formattedAddress: [String]?

    public init(address: String?, crossStreet: String?, lat: Double?, lng: Double?, labeledLatLngs: [LabeledLatLng]?, distance: Int?, postalCode: String?, cc: String?, city: String?, state: String?, country: String?, formattedAddress: [String]?) {
        self.address = address
        self.crossStreet = crossStreet
        self.lat = lat
        self.lng = lng
        self.labeledLatLngs = labeledLatLngs
        self.distance = distance
        self.postalCode = postalCode
        self.cc = cc
        self.city = city
        self.state = state
        self.country = country
        self.formattedAddress = formattedAddress
    }
}

// LabeledLatLng.swift

 

// MARK: - LabeledLatLng
public struct LabeledLatLng : Decodable {
    public var label: String?
    public var lat: Double?
    public var lng: Double?

    public init(label: String?, lat: Double?, lng: Double?) {
        self.label = label
        self.lat = lat
        self.lng = lng
    }
}

// VenuePage.swift

 

// MARK: - VenuePage
public struct VenuePage : Decodable {
    public var id: String?

    public init(id: String?) {
        self.id = id
    }
}

// SuggestedBounds.swift

 

// MARK: - SuggestedBounds
public struct SuggestedBounds : Decodable {
    public var ne: Ne?
    public var sw: Ne?

    public init(ne: Ne?, sw: Ne?) {
        self.ne = ne
        self.sw = sw
    }
}

// Ne.swift

 

// MARK: - Ne
public struct Ne : Decodable {
    public var lat: Double?
    public var lng: Double?

    public init(lat: Double?, lng: Double?) {
        self.lat = lat
        self.lng = lng
    }
}

// Warning.swift

 

// MARK: - Warning
public struct Warning : Decodable {
    public var text: String?

    public init(text: String?) {
        self.text = text
    }
}
