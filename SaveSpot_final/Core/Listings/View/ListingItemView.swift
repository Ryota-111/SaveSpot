//
//  ListingItemView.swift
//  SaveSpot_final
//
//  Created by Ryota Fujitsuka on 2024/07/12.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            //Images
            
            ListingImageCarouseView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //listing details
            
            HStack(alignment: .top) {
                //details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("所要時間　約10分")
                        .foregroundStyle(.gray)
                    
                    Text("年中無休")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("￥\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                }
                
                Spacer()
                
                //rating
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("\(String(format: "%.2f", listing.rating))")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
