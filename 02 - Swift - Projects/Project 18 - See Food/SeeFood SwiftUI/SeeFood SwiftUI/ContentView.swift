//
//  ContentView.swift
//  SeeFood SwiftUI
//
//  Created by Kyle L. on 8/10/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI
import CoreML
import Vision

struct ContentView: View {
    @State var image = UIImage()
    @State var iShowing = false
    @State var cameraIsSourceType = false
    @State var isHotdog: Bool = false
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text(isHotdog ? "Hotdog":"Not Hotdog").font(.largeTitle).fontWeight(.light)
                Spacer()
            }.background(isHotdog ? Color.green.opacity(0.20): Color.red.opacity(0.20))
            Image(uiImage: image).resizable().frame(width: 100, height: 100).clipShape(Circle()).overlay(Circle().stroke()).padding()
            Spacer()
            HStack {
                //MARK: - MUST HAVE A CAMERA
                Button(action: {self.iShowing.toggle()
                    self.cameraIsSourceType = true})
                {Image(systemName: "camera")}
                
                Button(action: {self.iShowing.toggle()})
                {Image(systemName: "arkit")}
                
            }.sheet(isPresented: $iShowing) {
                CaptureView(show: self.$iShowing, image: self.$image, camera: self.$cameraIsSourceType, isHotdog: self.$isHotdog)
            }
            Spacer()
        }
    }
}

//MARK: - CaptureView
struct CaptureView: UIViewControllerRepresentable{
    @Binding var show: Bool
    @Binding var image: UIImage
    @Binding var camera: Bool
    @Binding var isHotdog: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let i = UIImagePickerController()
        i.delegate = context.coordinator
        i.sourceType = camera ? .camera : .photoLibrary
        return i
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}

//MARK: - Coordinator
extension CaptureView{
    func makeCoordinator() -> Coordinator {return Coordinator(p: self)}}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    let parent : CaptureView
    init(p: CaptureView){
        self.parent = p
    }
}

//MARK: - Image Picker Methods

extension Coordinator{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
            print("DEBUG: CAPTURE VIEW COORDINATOR\nSelected Image is \(selectedImage)")
            self.parent.image = selectedImage
            self.parent.show.toggle()
            self.parent.camera = false
            self.parent.detect(selectedImage: selectedImage) //Machine Learning Aspect of image picker controller
        }
    }
    
}

//MARK: - Machine Learns
extension CaptureView{
    func detect(selectedImage: UIImage){
        let i = CIImage(image: selectedImage)!
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else{fatalError("CANNOT MAKE MODEL")}
        let hotdogQuery = VNCoreMLRequest(model: model){request, err in
            guard let req = request.results as? [VNClassificationObservation],
                let topResult = req.first
                else{fatalError("CANNOT DO REQUEST")}
            
            if topResult.identifier.contains("hotdog"){self.isHotdog = false}
            else{self.isHotdog = true}
        }
        
        let h = VNImageRequestHandler(ciImage: i)
        do {
            try h.perform([hotdogQuery])
        } catch {
            fatalError("CANNOT PERFORM SEARCH")
        }
    }
}
