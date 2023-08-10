//
//  CustomShapes.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 10.08.2023.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horisontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horisontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horisontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        }
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horisontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horisontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horisontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horisontalOffset, y: rect.minY))
        }
    }
}
struct CustomShapes: View {
    var body: some View {
        ZStack {
            Triangle()
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [5]))
                .trim(from: 0, to: 0.5)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
        }
    }
}

struct CustomShapes2: View {
    var body: some View {
        ZStack {
            Image("sea")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(
                    Triangle()
                )
        }
    }
}

struct CustomShapes3: View {
    var body: some View {
        ZStack {
            Diamond()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
        }
    }
}

struct CustomShapes4: View {
    var body: some View {
        ZStack {
            Trapezoid()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
        }
    }
}


struct CustomShapes_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapes4()
    }
}
