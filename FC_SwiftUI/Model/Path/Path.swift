//
//  Path.swift
//  FC_SwiftUI
//
//  Created by chulyeon kim on 10/18/23.
//

import Foundation

class PathModel: ObservableObject {
    @Published var paths: [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
}
