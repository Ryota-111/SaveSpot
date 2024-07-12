//
//  ListingImageCarouseView.swift
//  SaveSpot_final
//
//  Created by Ryota Fujitsuka on 2024/07/12.
//

import SwiftUI

struct ListingImageCarouseView: View {
    
    let listing: Listing
    
    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouseView(listing: DeveloperPreview.shared.listings[0])
}
