//
//  ContentView.swift
//  Flower Classifier
//
//  Created by Kyle L. on 8/14/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI

struct FlowerView: View {
    @State var isCamera = false
    @State var image = UIImage()
    @State var isShowningImagePicker = false
    @State var flowerName = "Flower Name"
    @State var wikipediaImage = UIImage()
    @State var description = "Flower Description"
    @State var isFlower = false
    var body: some View {
        VStack {
            Text("Flower Identifier").font(.largeTitle).fontWeight(.light)
            Divider()
            HStack{
                VStack {
                    Image(uiImage: self.image).resizable().frame(width: 100, height: 100).clipShape(Circle())
                    Text("Image Chosen").foregroundColor(Color.red.opacity(0.80))
                }
                Spacer()
                VStack {
                    Image(uiImage: self.wikipediaImage).resizable().frame(width: 100, height: 100).clipShape(Circle())
                    Text("Wikipedia Image").foregroundColor(Color.red.opacity(0.80))
                }
            }.padding()
            Divider()
            HStack {
                Text("Description").font(.largeTitle).fontWeight(.light).padding(.horizontal)
                Spacer()
            }
            HStack(alignment: .firstTextBaseline) {
                Text(self.isFlower ? self.description : "The image that you chose is not a flower.").padding()
            }
            Spacer()
            HStack{
                Text("Camera").fontWeight(.ultraLight).padding().foregroundColor(Color.red.opacity(0.80)).onTapGesture {
                    self.isCamera = true
                    self.isShowningImagePicker = true
                }
                Spacer()
                Text("Camera Roll").fontWeight(.ultraLight).padding().foregroundColor(Color.red.opacity(0.80)).onTapGesture {
                    self.isShowningImagePicker = true
                }
            }.sheet(isPresented: self.$isShowningImagePicker) { SecondCaptureView(isCamera: self.$isCamera, image: self.$image, isShowingImagePicker: self.$isShowningImagePicker, flowerName: self.$flowerName, description: self.$description, isFlower: self.$isFlower, wikipediaImage: self.$wikipediaImage)
            }
        }
    }
}


//MARK: - Capture View and Methods

struct SecondCaptureView: UIViewControllerRepresentable{
    
    @Binding var isCamera: Bool
    @Binding var image: UIImage
    @Binding var isShowingImagePicker: Bool
    @Binding var flowerName: String
    @Binding var description: String
    @Binding var isFlower: Bool
    @Binding var wikipediaImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = isCamera ? .camera : .photoLibrary
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
}


//MARK: - Coordinator and Did Finish Picking Media with Info

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    let parent: SecondCaptureView
    var flowerName = ""
    var isFlower = false
    
    init(parent: SecondCaptureView){
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePicked = info[.originalImage] as? UIImage? {
            self.parent.image = imagePicked!
            self.detection(image: imagePicked!)
            self.parent.isShowingImagePicker = false
            self.parent.isCamera = false
        }
    }
    
    
}

extension SecondCaptureView{
    func makeCoordinator() -> Coordinator {return Coordinator(parent: self)}
}

//MARK: - Preview Code
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerView()
    }
}
