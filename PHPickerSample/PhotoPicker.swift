//
//  PhotoPicker.swift
//  PHPickerSample
//
//  Created by okano on 2020/08/11.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    let configuration: PHPickerConfiguration
    @Binding var pickerResult: [UIImage]
    @Binding var isPresented: Bool

    func makeUIViewController(context: Context) -> PHPickerViewController {
            let controller = PHPickerViewController(configuration: configuration)
            controller.delegate = context.coordinator
            return controller
        }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    /// PHPickerViewControllerDelegate => Coordinator
    class Coordinator: PHPickerViewControllerDelegate {

        private let parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            for image in results where image.itemProvider.canLoadObject(ofClass: UIImage.self) {
                image.itemProvider.loadObject(ofClass: UIImage.self) { (newImage, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let image = newImage as? UIImage {

                        self.parent.pickerResult.append(image)
//                        let defaults = UserDefaults(suiteName: suiteName)
//                        defaults?.setUIImageToData(image: image, forKey: imageSaveKey)
                    } else {
                        print("wrap error")
                    }
                }
            }
            // dissmiss the picker
            parent.isPresented = false
        }
    }
}
