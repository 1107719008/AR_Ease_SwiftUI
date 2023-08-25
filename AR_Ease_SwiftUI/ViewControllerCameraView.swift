//
//  ViewController.swift
//  AR_Ease_App
//
//  Created by 林君翰 on 2023/6/8.
//
//this script is for Video function with ui container(最上層的) include -- VideoCapture\PosePredictor etc...
//this is 樹式 script

import UIKit
import AVFoundation
import SwiftUI

//ui container
struct ViewControllerCameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
    typealias UIViewControllerType = ViewController
}


class ViewController: UIViewController {

    let videoCapture = VideoCapture()
    
    var previewLayer:AVCaptureVideoPreviewLayer?
    
    var pointsLayer = CAShapeLayer()
    
    //var specificLayer = CAShapeLayer()
   
    //hint ui layer
    let imageCircleView = UIImageView()
    
    
    //ok color-failed color
    var dectectColor = UIColor.yellow.withAlphaComponent(0.5).cgColor
    var okColor = UIColor.green.withAlphaComponent(0.8).cgColor
    var originColor = UIColor.yellow.withAlphaComponent(0.5).cgColor
    var isColorChanged = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupVideoPreview()
        
        videoCapture.predictor.delegate = self
        
        //setHintUICircle()
        
        
        
    }

    //hints UI
    private func setHintUICircle(){
    
        let image = UIImage(named: "Home_press") // 根據您的圖片檔案名稱設定
                
                // 設定圖片視圖的圖片
                imageCircleView.image = image
                // 設定圖片視圖的位置和尺寸
                //imageCircleView.frame = CGRect(x: 589, y: 0, width: 30, height: 30) // 根據您的需求設定位置和尺寸
                // 將圖片視圖添加到畫面中
                view.addSubview(imageCircleView)
        
    }
    
    private func setupVideoPreview(){
        videoCapture.startCaptureSession()
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)
        previewLayer?.frame = UIScreen.main.bounds
        //previewLayer?.frame = CGRect(x:0,y:0,width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        previewLayer?.videoGravity = .resizeAspectFill//set full screen
        
        //0823
        previewLayer?.connection?.videoOrientation = .landscapeRight
        previewLayer?.videoGravity = .resizeAspectFill//set full screen
        
        //add video frame
        guard let previewLayer = previewLayer else { return }
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
//        previewLayer.videoGravity = .resizeAspectFill
//        previewLayer.connection?.videoOrientation = .landscapeRight
        
       
        
        if isColorChanged{
            view.layer.addSublayer(pointsLayer)
            pointsLayer.frame = view.frame
            pointsLayer.fillColor = okColor
        }else{
            //draw points
            view.layer.addSublayer(pointsLayer)
            pointsLayer.frame = view.frame
            pointsLayer.fillColor = dectectColor
        }
        
        
//        view.layer.addSublayer(specificLayer)
//        specificLayer.frame = view.frame
//        if let sublayers = pointsLayer.sublayers, sublayers.count > 3 {
//            specificLayer = sublayers[3] as! CAShapeLayer
//            specificLayer.fillColor = UIColor.green.cgColor
//        }

        
    }
    
   
    
    
    
    
    private func processCheckingPose(_ checkLegPos: Bool,_ checkHandPos: Bool){
        if checkHandPos {
            isColorChanged = true
        } else {
            isColorChanged = false
        }
    }
    
    

}

extension ViewController: PredictorDelegate{
    func predictor(_ predictor: PosePredictor, didFindNewRecognizedPoints points: [CGPoint], checkHandPos: Bool, checkLegPos: Bool) {
        guard let previewLayer = previewLayer else { return }
        
        //map the layer
        let convertedPoints = points.map {
            previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
        }
        let combinedPath = CGMutablePath()
        
        for point in convertedPoints {
            let dotPath = UIBezierPath(ovalIn: CGRect(x: point.x, y: point.y, width: 20, height: 20))
            combinedPath.addPath(dotPath.cgPath)
        }
        
        pointsLayer.path = combinedPath
        
        DispatchQueue.main.async{
            self.pointsLayer.didChangeValue(for: \.path)
            self.pointsLayer.fillColor = self.isColorChanged ? self.okColor : self.dectectColor
        }
        
        //tester
        //print(checkLegPos)
        //print(checkHandPos)
        processCheckingPose(checkLegPos,checkHandPos)
        print(isColorChanged)
        
    }
    
    
}
