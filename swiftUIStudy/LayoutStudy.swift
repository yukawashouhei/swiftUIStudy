//
//  LayoutStudy.swift
//  swiftUIStudy
//
//  Created by 湯川昇平 on 2025/06/23.
//

import SwiftUI

struct LayoutStudy: View {
    var body: some View {
        
        // プロフィールカードの例
        HStack(spacing: 15) {
            // 1. アイコン画像
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.gray)

            // 2. 名前の部分（VStackで縦に並べる）
            VStack(alignment: .leading, spacing: 4) {
                Text("山田 太郎")
                    .font(.headline) // 太字の見出し
                Text("ソフトウェアエンジニア")
                    .font(.subheadline) // 少し小さいサブ見出し
                    .foregroundColor(.secondary) // 少し薄い色
            }

            Spacer() // 右側に空間を作る
        }
        .padding() // 全体に余白
        .background(Color(.systemGray6)) // 薄いグレーの背景
        .cornerRadius(12) // 角を丸くする
        .shadow(radius: 5) // 影をつける
        .padding() // カードの外側にも少し余白
        
//        ZStack {
//            // 背景色を画面全体に広げる
//            Color.blue
//                .ignoresSafeArea()
//
//            Text("セーフエリアを無視")
//                .foregroundColor(.white)
//        }
        
//        GeometryReader { geometry in
//            VStack {
//                ZStack {
//                    // 背景色を画面全体に広げる
//                    Color.blue
//                        .ignoresSafeArea()
//
//                    Text("セーフエリアを無視")
//                        .foregroundColor(.white)
//                }
//                Text("画面の横幅は \(geometry.size.width) ポイントです")
//
//                Rectangle()
//                    .fill(Color.red)
//                // 親ビュー(GeometryReader)の幅の半分
//                    .frame(width: geometry.size.width * 0.5)
//                    .frame(height: 50)
//            }
//        }
//        .padding()
        //        VStack {
        //            Text("設定項目 A")
        //            Divider() // 水平の区切り線
        //            Text("設定項目 B")
        //        }
        //        .padding()
        //        HStack {
        //            Text("左端のテキスト")
        //            Spacer() // ここがグーっと広がる
        //            Text("右端のテキスト")
        //        }
        //        .padding()
        //
        //        VStack {
        //            Text("上部のテキスト")
        //            Spacer() // ここがグーっと広がる
        //            Text("下部のテキスト")
        //        }
        //        .frame(height: 150)
        //        .padding()
        // 悪い例
        //        Text("こんにちは")
        //            .background(Color.green) // 先に背景色を設定
        //            .padding()               // その後で余白を追加
        //        // → 緑色の背景の「外側」に余白ができる
        //
        //        // 良い例
        //        Text("こんにちは")
        //            .padding()               // 先に余白を追加
        //            .background(Color.green) // その後で背景色を設定
        // → 余白を含めた全体が緑色になる
        //        VStack(spacing: 20) { // spacingでビュー間の間隔を指定
        //            Text("アイテム1")
        //            Text("アイテム2")
        //            Text("アイテム3")
        //        }
        //        .padding() // VStack全体に余白を追加
        //        .background(Color.yellow) // 背景色を設定
        //
        //
        //        ZStack {
        //            // 一番奥の背景
        //            Color.indigo
        //
        //            // 中間の要素
        //            Image(systemName: "moon.stars.fill")
        //                .resizable()
        //                .scaledToFit()
        //                .frame(width: 150)
        //                .foregroundColor(.yellow)
        //
        //            // 一番手前の要素
        //            Text("おやすみなさい")
        //                .font(.caption)
        //                .foregroundColor(.white)
        //                .padding(.top, 100) // 上から少しずらす
        //        }
        //        .frame(width: 205, height: 205) // ZStack自体のサイズを指定
        
    }
}

#Preview {
    LayoutStudy()
}
