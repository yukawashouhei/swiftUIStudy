import SwiftUI

struct SwipeAndReturnCardViewstudy: View {
    
    @State private var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.9, blue: 1.0)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "swift")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                Text("SwiftUI Card")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(40)
            .background(.blue)
            .cornerRadius(20)
            .shadow(radius: 10)
            .offset(offset)
            .rotationEffect(Angle(degrees: getRotationAmount()))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset = value.translation
                    }
                    .onEnded { value in
                        let swipeDistance = value.translation.width
                        
                        if abs(swipeDistance) > 150 {
                            let swipeDirection = swipeDistance > 0 ? 1.0 : -1.0
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                offset.width = 600 * swipeDirection
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                offset.width = -600 * swipeDirection
                                
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    offset = .zero
                                }
                            }
                            
                        } else {
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
                    }
            )
        }
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let maxAngle: Double = 10
        return Double(percentage) * maxAngle
    }
}

#Preview {
    SwipeAndReturnCardViewstudy()
}
