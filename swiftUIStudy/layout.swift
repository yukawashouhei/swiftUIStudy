//
//  layout.swift
//  swiftUIStudy
//
//  Created by 湯川昇平 on 2025/06/09.
//

import SwiftUI

struct layout: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Text("おすすめの観光地")
                .font(.largeTitle)
            Text("東京タワー")
                .font(.title2)
            Text("浅草寺")
                .font(.title2)
        }
    }
}

#Preview {
    layout()
}
