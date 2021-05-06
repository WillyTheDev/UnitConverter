//
//  buttonStyle.swift
//  UnitConverter
//
//  Created by William on 20.04.21.
//

import SwiftUI

struct kNavgationButton: View {
    var label: String
    var body: some View {
        NavigationButton(des)
    }
}

struct buttonStyle_Previews: PreviewProvider {
    static var previews: some View {
        kNavigationButton(label: "Temperature")
    }
}
