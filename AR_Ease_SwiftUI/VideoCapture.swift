//
//  VideoCapture.swift
//  AR_Ease_App
//
//  Created by 林君翰 on 2023/6/8.
//

import Foundation
import AVFoundation

class VideoCapture:NSObject{
    let captureSession = AVCaptureSession()
    let videoOutput = AVCaptureVideoDataOutput()
    
    let predictor = PosePredictor()
    
    override init(){
        
        super.init()
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: captureDevice) else{
            return
        }
        captureSession.sessionPreset = AVCaptureSession.Preset.high
        captureSession.addInput(input)
        
        captureSession.addOutput(videoOutput)
        videoOutput.alwaysDiscardsLateVideoFrames = true
        
            
    }
    
    func startCaptureSession(){
        captureSession.startRunning()
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoDispatchQueue"))
    }
    
    
}
extension VideoCapture: AVCaptureVideoDataOutputSampleBufferDelegate{
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        predictor.estimation(sampleBuffer: sampleBuffer)
    }
    
}
