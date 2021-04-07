//
//  TypeView.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 2/3/21.
//

import SwiftUI

public struct GraphView: View {
    public var body: some View {
        ZStack{
            Image("TypeGraph")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.screenWidth)
        }
    }
}

struct GraphView_Preview: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}

