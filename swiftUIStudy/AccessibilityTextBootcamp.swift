//
//  AccessibilityTextBootcamp.swift
//  swiftUIStudy
//
//  Created by 湯川昇平 on 2025/06/21.
//

import SwiftUI

//Dynamic Text

struct AccessibilityTextBootcamp: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing:9){
                        HStack{
                            Image(systemName: "heart.fill")
                            Text("Welcome to my app")
                        }
                        .font(.title)
                        
                        Text("This is some longer text than expands to multiple lines")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .truncationMode(.head)
                            .lineLimit(3)
                            .minimumScaleFactor(sizeCategory == .accessibilityExtraLarge ? 0.8 : 1.0)
                    }
                    //                    .frame(height: 100)
                    .background(Color.red)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Accessibility Text")
        }
    }
}

extension ContentSizeCategory {
    
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            return 1.0
            
        case .large, .extraLarge, .extraExtraLarge:
            return 0.8
            
        default :
            return  0.6
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}
