//
//  ExploreService.swift
//  SaveSpot_final
//
//  Created by Ryota Fujitsuka on 2024/07/12.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
    
    func uploadImage(_ imageData: Data) async throws -> String {
        let url = URL(string: "https://example.com/upload")! // Replace with your actual upload URL
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.upload(for: request, from: imageData)
            
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        guard let responseString = String(data: data, encoding: .utf8) else {
            throw URLError(.cannotDecodeRawData)
        }

        return responseString // Assuming the responseString is the image URL
    }
}
