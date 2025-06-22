////
////  MultipleSheet.swift
////  swiftUIStudy
////
////  Created by 湯川昇平 on 2025/06/21.
////
//
//import SwiftUI
//
//struct RandomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}
//
//struct MultipleSheet: View {
//    
//    @State private var selectedModel: RandomModel? = nil
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Button("ボタン 1") {
//                selectedModel = RandomModel(title: "スクリーン 1")
//            }
//            
//            Button("ボタン 2") {
//                selectedModel = RandomModel(title: "スクリーン 1")
//            }
//        }
//        
//        .sheet(item: $selectedModel) { model in
//            NextScreen(selectedModel: model)
//        }
//    }
//}
//
//struct NextScreen: View {
//    
//    let selectedModel: RandomModel
//    
//    var body: some View {
//        Text(selectedModel.title)
//            .font(.largeTitle)
//    }
//}
//
//#Preview {
//    MultipleSheet()
//}
