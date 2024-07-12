//
//  ExploreViewModel.swift
//  SaveSpot_final
//
//  Created by Ryota Fujitsuka on 2024/07/12.
//

import Foundation
import UIKit

class ExploreViewModel: ObservableObject {
    
    @Published var listings = [Listing]()
    @Published var searchLocation = " "
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
    
    func uploadImage(_ image: UIImage) async {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("DEBUG: Failed to convert UIImage to JPEG data.")
            return
        }

        do {
            let response = try await service.uploadImage(imageData)
            print("DEBUG: Image uploaded successfully: \(response)")
            // Handle successful upload, e.g., update listings if necessary
        } catch {
            print("DEBUG: Failed to upload image: \(error.localizedDescription)")
        }
    }
    
    private func addImageURLToFirstListing(_ imageURL: String) {
        // Assuming you want to add the uploaded image URL to the first listing for simplicity
        if !listings.isEmpty {
            listings[0].imageURLs.append(imageURL)
        }
    }
}

