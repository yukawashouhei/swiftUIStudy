import SwiftUI

/// VoiceOverの基本操作と主要なモディファイアを学ぶためのトレーニング用Viewです。
struct VoiceOverTrainingView: View {
    // 課題2と5で使用する状態変数
    @State private var volume: Double = 50
    @State private var isSubscribed: Bool = true

    var body: some View {
        NavigationStack {
            List {
                // --- 導入セクション ---
                Section {
                    Text("この画面でVoiceOverの基礎を学びます。\nまず、キーボードで`Command + F5`を押してVoiceOverをオンにしてください。")
                }

                // --- 課題1: ラベル ---
                Section("課題1：ラベルの指定 (.accessibilityLabel)") {
                    Text("下の歯車アイコンを1回タップして、「設定」と読み上げられるか確認しましょう。")
                    
                    Button(action: { /* 設定画面へ遷移する処理 */ }) {
                        Image(systemName: "gearshape.fill")
                            .font(.title)
                    }
                    // アイコンのみのボタンに、VoiceOverが読み上げるべき「名前」を与える
                    .accessibilityLabel("設定")
                }

                // --- 課題2: 値 ---
                Section("課題2：値の伝達 (.accessibilityValue)") {
                    Text("下のスライダーを操作し、「音量、50パーセント」のように現在の値が読み上げられるか確認しましょう。")
                    
                    Slider(value: $volume, in: 0...100)
                        // スライダーの現在の「状態」や「値」をVoiceOverに伝える
                        .accessibilityValue("\(Int(volume))パーセント")
                }

                // --- 課題3: 特性 ---
                Section("課題3：役割の付与 (.accessibilityAddTraits)") {
                    Text("見た目はただのテキストですが、VoiceOverでは「ボタン」として認識されます。1回タップして確認しましょう。")
                    
                    Text("利用規約に同意する")
                        .foregroundColor(.blue)
                        // このテキストが「ボタン」の役割を持つことをVoiceOverに教える
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture { /* 同意処理 */ }
                }
                
                // --- 課題4: ヒント ---
                Section("課題4：操作のヒント (.accessibilityHint)") {
                    Text("下のボタンを1回タップすると、ラベルの後に操作方法のヒントが読み上げられます。")

                    Button("古いメールをアーカイブ") { /* アーカイブ処理 */ }
                        // ユーザーに、このボタンを操作すると何が起きるかを補足説明する
                        .accessibilityHint("ダブルタップすると、受信箱から移動します。")
                }

                // --- 課題5: 要素のグループ化 ---
                Section("課題5：要素の組み合わせ") {
                    Text("下のカスタムUIは、複数の要素で構成されていますが、1つの部品として操作できます。")

                    // 複数のViewを組み合わせて作ったカスタムコンポーネント
                    HStack {
                        // このアイコンは装飾的なので、VoiceOverには無視させる
                        Image(systemName: "bell.fill")
                            .foregroundColor(.yellow)
                            .font(.title)
                            .accessibilityHidden(true)
                        
                        Text("メールマガジン")
                        
                        Spacer()
                        
                        Text(isSubscribed ? "購読中" : "未購読")
                            // 状態は.accessibilityValueで伝えるため、このテキストは無視させる
                            .accessibilityHidden(true)
                    }
                    // --- アクセシビリティ対応の核 ---
                    // 1. バラバラの要素を1つの部品としてグループ化
                    .accessibilityElement(children: .combine)
                    // 2. この部品に「ボタン」の役割を与える
                    .accessibilityAddTraits(.isButton)
                    // 3. 現在の状態（値）を伝える
                    .accessibilityValue(isSubscribed ? "購読中" : "未購読")
                    // 4. 操作のヒントを伝える
                    .accessibilityHint("ダブルタップで購読状態を切り替えます。")
                    .onTapGesture {
                        isSubscribed.toggle()
                    }
                }
            }
            .navigationTitle("VoiceOver基礎トレーニング")
        }
    }
}

#Preview {
    VoiceOverTrainingView()
}
