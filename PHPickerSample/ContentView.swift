//
//  ContentView.swift
//  PHPickerSample
//
//  Created by okano on 2020/08/11.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @State var pickerResult: [UIImage] = []

    var pickerConfig: PHPickerConfiguration  {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images
        config.selectionLimit = 10
        return config
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Button("Show Picker") {
                    isPresented.toggle()
                    pickerResult = []
                }.sheet(isPresented: $isPresented) {
                    PhotoPicker(configuration: pickerConfig,
                                pickerResult: $pickerResult,
                                isPresented: $isPresented)
                }
            }

            ForEach(pickerResult, id: \.self) { image in
                CustomImageView(image: image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
