
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 基本的なGeometryReaderの使用例
                BasicGeometryReaderExample()
                
                // 相対的なサイズ設定
                RelativeSizeExample()
                
                // 座標系の理解
                CoordinateSystemExample()
                
                // 実用的な例：カードのパララックス効果
                ParallaxScrollExample()
            }
            .padding()
        }
    }
}

// MARK: - 基本的なGeometryReaderの使用例
struct BasicGeometryReaderExample: View {
    var body: some View {
        VStack {
            Text("基本的なGeometryReader")
                .font(.headline)
                .padding()
            
            GeometryReader { geometry in
                VStack {
                    Text("幅: \(Int(geometry.size.width))")
                    Text("高さ: \(Int(geometry.size.height))")
                    Text("SafeArea上端: \(Int(geometry.safeAreaInsets.top))")
                    Text("SafeArea下端: \(Int(geometry.safeAreaInsets.bottom))")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue.opacity(0.3))
                .cornerRadius(10)
            }
            .frame(height: 200)
        }
    }
}

// MARK: - 相対的なサイズ設定
struct RelativeSizeExample: View {
    var body: some View {
        VStack {
            Text("相対的なサイズ設定")
                .font(.headline)
                .padding()
            
            GeometryReader { geometry in
                HStack(spacing: 10) {
                    // 幅の1/3を使用
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: geometry.size.width * 0.3)
                    
                    // 幅の2/3を使用
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: geometry.size.width * 0.6)
                }
                .frame(maxHeight: .infinity)
            }
            .frame(height: 100)
        }
    }
}

// MARK: - 座標系の理解
struct CoordinateSystemExample: View {
    var body: some View {
        VStack {
            Text("座標系とframeの理解")
                .font(.headline)
                .padding()
            
            GeometryReader { geometry in
                ZStack {
                    // 背景
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                    
                    // 各コーナーに円を配置
                    Circle()
                        .fill(Color.red)
                        .frame(width: 20, height: 20)
                        .position(x: 0, y: 0) // 左上
                    
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .position(x: geometry.size.width, y: 0) // 右上
                    
                    Circle()
                        .fill(Color.green)
                        .frame(width: 20, height: 20)
                        .position(x: 0, y: geometry.size.height) // 左下
                    
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 20, height: 20)
                        .position(x: geometry.size.width, y: geometry.size.height) // 右下
                    
                    // 中央に情報表示
                    VStack {
                        Text("中央")
                        Text("x: \(Int(geometry.size.width/2))")
                        Text("y: \(Int(geometry.size.height/2))")
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(8)
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
                }
            }
            .frame(height: 200)
        }
    }
}

// MARK: - パララックス効果の例
struct ParallaxScrollExample: View {
    var body: some View {
        VStack {
            Text("パララックス効果")
                .font(.headline)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<10) { index in
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.blue,
                                            Color.purple
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .overlay(
                                    Text("Card \(index + 1)")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                )
                                // パララックス効果：スクロール位置に応じて回転
                                .rotation3DEffect(
                                    .degrees(geometry.frame(in: .global).midX - 200) / 10,
                                    axis: (x: 0, y: 1, z: 0)
                                )
                        }
                        .frame(width: 150, height: 200)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 220)
        }
    }
}

// MARK: - 高度な例：アダプティブレイアウト
struct AdaptiveLayoutExample: View {
    var body: some View {
        VStack {
            Text("アダプティブレイアウト")
                .font(.headline)
                .padding()
            
            GeometryReader { geometry in
                let columns = geometry.size.width > 600 ? 3 : 2
                let spacing: CGFloat = 10
                let itemWidth = (geometry.size.width - spacing * CGFloat(columns - 1)) / CGFloat(columns)
                
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(itemWidth)), count: columns), spacing: spacing) {
                    ForEach(0..<6) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.mint)
                            .frame(height: itemWidth * 0.8)
                            .overlay(
                                Text("Item \(index + 1)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
            .frame(height: 300)
        }
    }
}

// MARK: - プレビュー
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
