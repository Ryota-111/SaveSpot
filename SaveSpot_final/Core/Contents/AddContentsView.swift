//
//  AddContentsView.swift
//  SaveSpot_final
//
//  Created by Ryota Fujitsuka on 2024/07/12.
//

import SwiftUI
import PhotosUI

struct AddContentsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var contentsTitlePlace: String = " "
    @State private var contentsTitleRate: String = " "
    @State private var contentsTitleMoney: String = " "
    @State private var contentsTitleTime: String = " "
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImagesData: [Data] = []
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("東京都　渋谷区", text: $contentsTitlePlace)
                } header: {
                    Text("場所")
                        .font(.title3)
                        .bold()
                }
                Section {
                    TextField("3.15", text: $contentsTitleRate)
                } header: {
                    Text("評価")
                        .font(.subheadline)
                        .bold()
                }
                Section {
                    TextField("3150", text: $contentsTitleMoney)
                } header: {
                    Text("金額")
                        .font(.subheadline)
                        .bold()
                }
                Section {
                    TextField("AM 10:00 - PM 10:00", text: $contentsTitleTime)
                } header: {
                    Text("営業時間")
                        .font(.subheadline)
                        .bold()
                }
                
                // ここに写真のアップロード機能の追加
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(selectedImagesData, id: \.self) { imageData in
                            if let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .padding(4)
                            }
                        }
                    }
                }
                .frame(height: 120)
                
                PhotosPicker(
                    selection: $selectedItems,
                    maxSelectionCount: 5,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text("写真を選択")
                }
                .onChange(of: selectedItems) { oldItems, newItems in
                    Task {
                        selectedImagesData = []
                        for item in newItems {
                            if let data = try? await item.loadTransferable(type: Data.self) {
                                selectedImagesData.append(data)
                            }
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("新規登録")
            .navigationBarTitleDisplayMode(.automatic)
            .interactiveDismissDisabled()
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("保存") {
                        
                    }
                    .disabled(contentsTitlePlace == " " || contentsTitleRate == " " || contentsTitleMoney == " " || contentsTitleTime == " ")
                    .padding()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("削除") {
                        dismiss()
                    }
                    .foregroundColor(.red)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    AddContentsView()
}
