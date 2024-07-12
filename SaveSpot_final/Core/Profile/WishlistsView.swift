//
//  WishlistsView.swift
//  SaveSpot_final
//
//  Created by Ryota Fujitsuka on 2024/07/12.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    
                    Text("You can create, view or wishlists once you've logged in")
                        .font(.footnote)
                }
                
                Button {
                    print("Log in")
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistsView()
}
