//
//  OnboardingContent.swift
//  FC_SwiftUI
//
//  Created by chulyeon kim on 10/17/23.
//

import Foundation

// TabView에서 사용하기 위해 Hashable 채택
struct OnboardingContent: Hashable {
    var imageFileName: String
    var title: String
    var subtitle: String
    
    init(imageFileName: String, title: String, subtitle: String) {
        self.imageFileName = imageFileName
        self.title = title
        self.subtitle = subtitle
    }
}
