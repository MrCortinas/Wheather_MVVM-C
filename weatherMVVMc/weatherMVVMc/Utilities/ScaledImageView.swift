//
//  ScaledImageView.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import SwiftUI

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}
