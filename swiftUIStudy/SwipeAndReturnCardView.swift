//
//  DragGestureBootcamp.swift
//  swiftUIStudy
//
//  Created by 湯川昇平 on 2025/06/17.
//

import SwiftUI

struct SwipeAndReturnCardView: View {
    
    // カードの移動量を保持する変数
    @State private var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            // 背景を薄い青色に変更
            Color(red: 0.85, green: 0.9, blue: 1.0)
                .ignoresSafeArea()
            
            // スワイプするカード
            VStack(spacing: 20) {
                Image(systemName: "swift")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                Text("SwiftUI Card")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(40)
            .background(.blue) // カードの色を青に変更
            .cornerRadius(20)
            .shadow(radius: 10)
            // offsetの値に応じてビューの位置を動かす
            .offset(offset)
            // getRotationAmount()の結果に応じてビューを回転させる
            .rotationEffect(Angle(degrees: getRotationAmount()))
            // ジェスチャーを追加
            .gesture(
                DragGesture()
                    // ドラッグ中に呼ばれる処理
                    .onChanged { value in
                        offset = value.translation
                    }
                    // ドラッグ終了時に呼ばれる処理
                    .onEnded { value in
                        // 水平方向のスワイプ距離
                        let swipeDistance = value.translation.width
                        
                        // スワイプ距離がしきい値を超えたかチェック
                        if abs(swipeDistance) > 150 {
                            // --- ここからが新しいロジック ---
                            
                            // 1. カードを画面外へ飛ばすアニメーション
                            // スワイプした方向（右なら1, 左なら-1）を取得
                            let swipeDirection = swipeDistance > 0 ? 1.0 : -1.0
                            // 画面外（600ポイント先）へアニメーションしながら移動
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                offset.width = 600 * swipeDirection
                            }
                            
                            // 2. カードを反対側から呼び戻す処理
                            // カードが画面外に移動するアニメーション（約0.4秒）が終わるのを待つ
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                // アニメーションなしで、カードを反対側の画面外に一瞬で移動させる
                                offset.width = -600 * swipeDirection
                                
                                // 反対側の画面外から中央へ、バネのようなアニメーションで戻す
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    offset = .zero
                                }
                            }
                            
                        } else {
                            // スワイプ距離が短ければ、中央にスッと戻る
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
                    }
            )
        }
    }
    
    // MARK: - 関数
    
    // ドラッグ量に応じてビューの回転角度を計算する関数
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let maxAngle: Double = 10 // 最大回転角度は10度
        return Double(percentage) * maxAngle
    }
}

#Preview {
    SwipeAndReturnCardView()
}
