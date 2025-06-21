//
//  LongPressGestureBootcamp.swift
//  swiftUIStudy
//
//  Created by 湯川昇平 on 2025/06/10.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    // @Stateでビューの状態を管理する変数を定義
    @State var isComplete: Bool = false
    
    var body: some View {
        Text(isComplete ? "COMPLETED" : "NOT COMPLETE") // isCompleteの値によって表示テキストを切り替え
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray) // isCompleteの値によって背景色を切り替え
            .cornerRadius(10)
        // onLongPressGestureモディファイアで長押しジェスチャーを検知
            .onLongPressGesture(minimumDuration: 1.0) { // 1秒間の長押しでアクションを実行
                isComplete.toggle() // isCompleteのtrue/falseを切り替える
            }
    }
}

#Preview {
    LongPressGestureBootcamp()
}
