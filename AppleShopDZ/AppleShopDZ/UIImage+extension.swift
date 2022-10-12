//
//  UIImage+extension.swift
//  AppleShopDZ
//
//  Created by angelina on 11.10.2022.
//

import UIKit

/// Изменение размера и положения изображения до выбранного значения
extension UIImage {
     func resizeImage(to size: CGSize) -> UIImage {
         UIGraphicsImageRenderer(size: size).image { _ in
             draw(in: CGRect(origin: .zero, size: size))
         }
     }
 }
