//
//  LongTapGesture2.swift
//  swiftUIStudy
//
//  Created by 湯川昇平 on 2025/06/16.
//

import SwiftUI

struct LongTapGesture2: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        VStack { // VStackの開始
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
                .animation(.easeInOut, value: isComplete)
                // .onLongPressGestureの処理を {} で囲み、閉じる
                .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                    isComplete.toggle()
                } // <--- 1. onLongPressGestureの閉じ括弧を追加
            
            Text("長押しで上のバーが伸びます")
            
            Button("isSuccessを切り替え") {
                // Rectangleのfillの色を切り替える
                isSuccess.toggle()
            }
            .padding()
            
            // ... 他のビュー
            
        } // <--- 2. VStackの閉じ括弧を追加
    }
}

#Preview {
    LongTapGesture2()
}
