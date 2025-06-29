//
//  LayoutStudy.swift
//  swiftUIStudy
//
//  Created by 湯川昇平 on 2025/06/23.
//

import SwiftUI

struct LayoutStudy: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // 背景グラデーション
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(.systemBackground),
                    Color(.systemGray6)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // プロフェッショナルなプロフィールカード
                    ProfessionalProfileCard()
                    
                    // スキルセクション
                    SkillsSection()
                    
                    // 統計カード
                    StatsSection()
                }
                .padding()
            }
        }
    }
}

struct ProfessionalProfileCard: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 0) {
            // ヘッダー部分（単色の青背景）
            ZStack {
                Color.blue
                
                VStack(spacing: 10) {
                    // プロフィール画像
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 70, height: 70)
                        
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .scaleEffect(isAnimating ? 1.05 : 1.0)
                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isAnimating)
                    }
                    
                    VStack(spacing: 2) {
                        Text("山田 太郎")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text("シニアソフトウェアエンジニア")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                .padding(.vertical, 20)
            }
            
            // 詳細情報部分
            VStack(spacing: 10) {
                // 連絡先情報（一列表示）
                VStack(spacing: 4) {
                    ContactInfoItem(icon: "envelope.fill", text: "yamada@example.com")
                    ContactInfoItem(icon: "phone.fill", text: "+81-90-1234-5678")
                }
                
                // 場所情報（一列表示）
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 12))
                    Text("東京都渋谷区")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                // 自己紹介（一列表示）
                Text("5年以上の経験を持つフルスタックエンジニア。SwiftUI、React、Node.jsを専門とし、ユーザー体験を重視したアプリケーション開発に従事しています。")
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
            .padding(12)
        }
        .background(Color(.systemBackground))
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 3)
        .onAppear {
            isAnimating = true
        }
    }
}

struct ContactInfoItem: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct SkillsSection: View {
    let skills = ["SwiftUI", "React", "Node.js", "Python", "AWS", "Docker"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("スキル")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            // スキルを一行ずつ表示
            VStack(spacing: 4) {
                ForEach(skills, id: \.self) { skill in
                    SkillBadge(skill: skill)
                }
            }
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 2)
    }
}

struct SkillBadge: View {
    let skill: String
    
    var body: some View {
        HStack {
            Text(skill)
                .font(.system(size: 11))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.blue)
                .cornerRadius(8)
            Spacer()
        }
    }
}

struct StatsSection: View {
    var body: some View {
        VStack(spacing: 6) {
            StatCard(title: "プロジェクト", value: "47", icon: "folder.fill")
            StatCard(title: "経験年数", value: "5+", icon: "clock.fill")
            StatCard(title: "クライアント", value: "23", icon: "person.2.fill")
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 12))
                .foregroundColor(.blue)
            
            Text(value)
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text(title)
                .font(.system(size: 11))
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.03), radius: 4, x: 0, y: 1)
    }
}

#Preview {
    LayoutStudy()
}
