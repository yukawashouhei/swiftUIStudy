
import SwiftUI

struct GeometryReaderBootcamp: View {

    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2 // 画面幅の半分を最大距離とする
        let currentX = geo.frame(in: .global).midX // 要素の中心のX座標を取得
        return Double(1 - (currentX / maxDistance)) // 中心からの距離の割合を計算 (0.0 ~ 1.0)
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { // 横方向のScrollView
            HStack {
                ForEach(0..<20) { index in // 20個の要素を生成
                    GeometryReader { geometry in // 各要素をGeometryReaderでラップ
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40), // 割合に応じて回転角度を変化させる
                                axis: (x: 0.0, y: 1.0, z: 0.0) // Y軸を中心に回転
                            )
                    }
                    .frame(width: 300, height: 250) // 要素のサイズを指定
                    .padding() // 要素間に余白を追加
                }
            }
        }
    }
}

#Preview {
    GeometryReaderBootcamp()
}
