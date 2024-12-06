//
//  AddSubViews.swift
//  UIKit-HW7-1
//
//  Created by Дима on 12/5/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
