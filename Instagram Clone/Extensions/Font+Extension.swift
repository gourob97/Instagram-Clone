//
//  Font+Extension.swift
//  Instagram Clone
//
//  Created by Gourob Mazumder on 1/6/24.
//

import SwiftUI

extension Font {
    static func instaRegular(_ size: CGFloat = 17) -> Font {
        return .custom("Instagram Sans", size: size)
    }

    static func instaBold(_ size: CGFloat = 17) -> Font {
        return .custom("Instagram Sans Bold", size: size)
    }
    static func instaMedium(_ size: CGFloat = 17) -> Font {
        return .custom("Instagram Sans Medium", size: size)
    }

    static func instaLight(_ size: CGFloat = 17) -> Font {
        return .custom("Instagram Sans Light", size: size)
    }
    static func instaHeadline(_ size: CGFloat = 17) -> Font {
        return .custom("Instagram Sans Headline", size: size)
    }
}
