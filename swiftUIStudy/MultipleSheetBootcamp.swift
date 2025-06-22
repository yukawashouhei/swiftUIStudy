

import SwiftUI

// データモデル（Identifiableに準拠）
struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct NextScreen: View {
    let selectedModel: RandomModel // データを受け取るだけなので let にする
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp: View {
    // 状態変数をオプショナル（nil許容）にする
    @State private var selectedModel: RandomModel? = nil
    
    var body: some View {
        ScrollView { // 多数のボタンを配置するためにScrollViewを使用
            VStack(spacing: 20) {
                ForEach(1..<51) { index in
                    Button("Button \(index)") {
                        // ボタンが押されたら、対応するモデルをセットする
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
        }
        .font(.caption2)
        // isPresentedの代わりにitemを使用
        .sheet(item: $selectedModel) { model in
            // itemに値がセットされると、その値がクロージャに渡される
            NextScreen(selectedModel: model)
        }
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
