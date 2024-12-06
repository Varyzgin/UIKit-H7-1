//
//  TextAndColor.swift
//  UIKit-HW6-1
//
//  Created by Дима on 12/2/24.
//

import UIKit

enum TextStyle {
    case megaHeader, header, description, subDescription
}

func setupLabel(textStyle: TextStyle, textColor: UIColor = .black, numberOfLines: Int = 0) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false

    label.numberOfLines = numberOfLines
    label.textAlignment = .left
    label.textColor = textColor
    
    switch textStyle {
    case .megaHeader: label.font = .systemFont(ofSize: 20 * scaleMultiplier(), weight: .black)
    case .header: label.font = .boldSystemFont(ofSize: 20 * scaleMultiplier())
    case .description: label.font = .systemFont(ofSize: 16 * scaleMultiplier())
    case .subDescription: label.font = .systemFont(ofSize: 14 * scaleMultiplier())
    }
    
    return label
}
