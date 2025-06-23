
import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            // 背景となる星のビュー
            starsView
            
            // 色を塗るためのオーバーレイビューを、背景の星の形でマスク（切り抜き）する
            overlayView
                .mask(starsView)
        }
    }
    
    // 背景となる5つの灰色の星を作成するビュー
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        // タップされた星に応じてratingを更新する
                        // withAnimationで囲むことで、変更がアニメーションになる
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
    
    // 評価に応じて色を塗るためのビュー
    private var overlayView: some View {
        // GeometryReaderで星全体の横幅を取得する
        GeometryReader { geometry in
            ZStack(alignment: .leading) { // .leadingで左揃えにする
                // 評価に応じて横幅が変わる長方形（Rectangle）
                Rectangle()
                    // .fillでグラデーションを適用することも可能
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    //.foregroundColor(.yellow) // 単色の場合
                
                    // (現在の評価 / 星の総数) * 全体の横幅 で塗りつぶす幅を計算
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        // このビューへのタップ操作を無効にし、下にあるstarsViewをタップできるようにする
        .allowsHitTesting(false)
    }
}


#Preview {
    MaskBootcamp()
}
