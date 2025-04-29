//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Deblyn Prado on 26/02/25.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmakrs")
        } detail: {
            Text("Select a Landmar")
        }
    }
}

#Preview {
    LandmarkList()
}
