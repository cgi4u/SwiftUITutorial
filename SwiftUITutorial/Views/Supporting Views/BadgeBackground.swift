//
//  BadgeBackground.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 2019/08/29.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in  // You use paths to combine lines, curves, and other drawing primitives
                var width: CGFloat = min(geometry.size.width, geometry.size.height) // Using the smallest of the geometry’s two dimensions preserves the aspect ratio of the badge when its containing view isn’t square.
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(
                    to: CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                ) // The move(to:) method moves the drawing cursor within the bounds of a shape
                
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                            x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                            y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2
                        )
                    )
                }
            }
            .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.5, y: 0),
                endPoint: .init(x: 0.5, y: 0.6)
            ))
                .aspectRatio(1, contentMode: .fit)
        }
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}

/*
 move와 addLine은 폴리곤 구성같은 느낌으로 생각하면 될듯
 
 aspectRatio: Constrains the view’s dimensions to the specified aspect ratio.
 If this view is resizable, the resulting view will have aspectRatio as its aspect ratio. In this example, the purple ellipse has a 3:4 width to height ratio, and scales to fit its frame:
 가로와 세로의 비율을 뜻함. 하지만 이게 가운데정렬을 보장해주는 이유는? 뷰의 크기를 줄여주니까?
 
 주의: 프리뷰는 뷰 구조체 이름바꾸기 할시 인식을 못함. 텍스트 검색을 하던가 수동으로 바꿔줘야함
 */
