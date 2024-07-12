//
//  ExploreView.swift
//  SaveSpot_final
//
//  Created by Ryota Fujitsuka on 2024/07/12.
//

import SwiftUI
import PhotosUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    @State private var showPhotoPicker = false
        
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
                .navigationTitle("Where To Go??")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                showPhotoPicker.toggle()
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .frame(width: 50)
                                    .padding()
                            }
                        }
                    }
                    .sheet(isPresented: $showPhotoPicker) {
                        AddContentsView()
                    }
            }
        }
    }
}

#Preview {
    ExploreView()
}
