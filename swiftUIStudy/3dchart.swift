import SwiftUI
import Charts

struct SalesData {
    let month: String
    let amount: Double
}

struct My3DChartView: View {
    let sales: [SalesData] = [
        .init(month: "1月", amount: 150),
        .init(month: "2月", amount: 230),
        .init(month: "3月", amount: 210),
        .init(month: "4月", amount: 280)
    ]

    var body: some View {
        Chart(sales, id: \.month) { data in
            BarMark(
                x: .value("月", data.month),
                y: .value("売上", data.amount)
            )
            .foregroundStyle(by: .value("月", data.month)) // 月ごとに色分け
        }
        // --- ↓↓↓ 存在しない3D表示のコードを削除しました ↓↓↓ ---
        // .chartStyle( ... )
        // --- ↑↑↑ 存在しない3D表示のコードを削除しました ↑↑↑ ---
        .navigationTitle("月次売上 (2D)") // 3Dではないのでタイトルを修正
        .padding()
    }
}

#Preview {
    // エラー箇所を修正: 正しいビュー名 `My3DChartView()` を指定します
    My3DChartView()
}
