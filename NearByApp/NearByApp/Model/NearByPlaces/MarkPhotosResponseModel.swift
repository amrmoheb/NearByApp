//
//  MarkPhotosResponseModel.swift
//  NearByApp
//
//  Created by developer on 10/07/2020.
//  Copyright © 2020 developer. All rights reserved.
//
// MarkPhotosResponseModel.swift

 
import Foundation
// MARK: - MarkPhotosResponseModel
public struct MarkPhotosResponseModel : Decodable {
    public var meta: PhotoMeta?
    public var response: PhotoResponse?

    public init() {
   
    }
}

// Meta.swift

 

// MARK: - Meta
public struct PhotoMeta : Decodable {
    public var code: Int?
    public var requestId: String?

    public init(code: Int?, requestId: String?) {
        self.code = code
        self.requestId = requestId
    }
}

// Response.swift

 

// MARK: - Response
public struct PhotoResponse : Decodable {
    public var photos: Photos?

    public init() {
        
    }
}

// Photos.swift

 

// MARK: - Photos
public struct Photos : Decodable {
    public var count: Int?
    public var items: [Item]?
    public var dupesRemoved: Int?

    public init() {

    }
}

// Item.swift

 

// MARK: - Item
public struct Item : Decodable {
    public var id: String?
    public var createdAt: Int?
    public var source: Source?
    public var prefix: String?
    public var suffix: String?
    public var width: Int?
    public var height: Int?
    public var user: User?
    public var checkin: Checkin?
    public var visibility: String?

    public init() {
       
    }
}

// Checkin.swift

 

// MARK: - Checkin
public struct Checkin : Decodable {
    public var id: String?
    public var createdAt: Int?
    public var type: String?
    public var timeZoneOffset: Int?

    public init(id: String?, createdAt: Int?, type: String?, timeZoneOffset: Int?) {
        self.id = id
        self.createdAt = createdAt
        self.type = type
        self.timeZoneOffset = timeZoneOffset
    }
}

// Source.swift

 

// MARK: - Source
public struct Source : Decodable {
    public var name: String?
    public var url: String?

    public init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}

// User.swift

 

// MARK: - User
public struct User : Decodable {
    public var id: String?
    public var firstName: String?
    public var lastName: String?
    public var photo: Photo?

    public init(id: String?, firstName: String?, lastName: String?, photo: Photo?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.photo = photo
    }
}

// Photo.swift

 

// MARK: - Photo
public struct Photo : Decodable {
    public var photoPrefix: String?
    public var suffix: String?

    public init(photoPrefix: String?, suffix: String?) {
        self.photoPrefix = photoPrefix
        self.suffix = suffix
    }
}
