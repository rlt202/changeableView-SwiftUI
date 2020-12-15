//
//  SwiftUIView.swift
//  changeableView SwiftUI
//
//  Created by Даниил Никулин on 15.12.2020.
//

import SwiftUI

struct ColorView: View {
        
    let color: UIColor
    
    var body: some View {
        Color(color)
        .frame(width: 350, height: 200)
        .background(Color(.white))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white, lineWidth: 4)
        )
    }    }


struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: .black)
    }
}
