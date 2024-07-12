//
//  DeveloperPreview.swift
//  SaveSpot_final
//
//  Created by Ryota Fujitsuka on 2024/07/12.
//

import Foundation

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            imageURLs: ["listing-2","listing-1","listing-3","listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title:"Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Ryota Fujitsuka",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7706,
            longitude: -80.1340,
            imageURLs: ["listing-3","listing-4","listing-1","listing-2"],
            address: "124 Main St",
            city: "Los Angeles",
            state: "California",
            title:"Los Angeles Villa",
            rating: 4.96,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .tv, .kitchen, .office],
            type: .house
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7650,
            longitude: -80.1936,
            imageURLs: ["listing-2","listing-1","listing-3","listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title:"Miami Villa",
            rating: 4.32,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 34.1,
            longitude: -118.1936,
            imageURLs: ["listing-2","listing-1","listing-3","listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title:"Miami Villa",
            rating: 4.97,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .pool],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 34.1,
            longitude: -118.1936,
            imageURLs: ["listing-2","listing-1","listing-3","listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title:"Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .apartment
        ),
    ]
}
