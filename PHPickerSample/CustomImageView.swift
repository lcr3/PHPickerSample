//
//  CustomImageView.swift
//  PHPickerSample
//
//  Created by okano on 2020/08/11.
//

import SwiftUI

struct CustomImageView: View {
    var image: UIImage
    var body: some View {
            Image.init(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
                .padding(.leading)
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomImageView(image: #imageLiteral(resourceName: "defaultImage"))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
