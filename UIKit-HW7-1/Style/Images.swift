//
//  Images.swift
//  UIKit-HW7-1
//
//  Created by Дима on 12/5/24.
//

import UIKit

func resizeImage(_ image: UIImage, width: CGFloat = image.size.width, height: CGFloat = image.size.height) -> UIImage {
    let size = CGSize(width: width, height: height)
    let renderer = UIGraphicsImageRenderer(size: size)

    return renderer.image { _ in
        let rect = CGRect(origin: .zero, size: size)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 20)
        path.addClip()
        image.draw(in: rect)
    }
}
