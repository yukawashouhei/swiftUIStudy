
import SwiftUI

struct GeometryReaderBootcamp: View {
    
    /// 各アイテムのジオメトリ情報（位置やサイズ）を元に、アニメーションの進行度（-1.0 〜 1.0 の範囲）を計算する関数
    /// - Parameter geo: 各アイテムのGeometryProxy
    /// - Returns: 画面中央を0としたきの、アイテムの位置の割合
    func getPercentage(geo: GeometryProxy) -> Double {
        // 画面の横幅の中心座標を最大距離とする
        let maxDistance = UIScreen.main.bounds.width / 2
        
        // スクリーン全体における、アイテムの中央のX座標を取得
        let currentX = geo.frame(in: .global).midX
        
        // 中央からの距離の割合を計算し、1.0から引くことで、
        // 中央で0、左端で1.0、右端で-1.0になるように値を調整する
        return 2.0 - (currentX / maxDistance)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<50) { index in
                    // ForEachの各アイテムをGeometryReaderでラップする
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            // 3D回転エフェクトを適用
                            .rotation3DEffect(
                                // getPercentage関数から得た値に応じて回転角度を決定
                                .degrees(getPercentage(geo: geometry) * 40),
                                // Y軸を中心に回転
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    // GeometryReader自体にフレームサイズを指定することが重要
                    .frame(width: 300, height: 300)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    GeometryReaderBootcamp()
}
