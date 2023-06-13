//
//  PosePredictor.swift
//  AR_Ease_App
//
//  Created by 林君翰 on 2023/6/8.
//

import Foundation
import Vision

protocol PredictorDelegate: AnyObject{
    func predictor(_ predictor: PosePredictor, didFindNewRecognizedPoints points: [CGPoint], checkHandPos: Bool, checkLegPos: Bool)
}

class PosePredictor{
    
    weak var delegate: PredictorDelegate?
    
    //recieve camera data
    func estimation(sampleBuffer: CMSampleBuffer){
        let requestHandler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up)
        
        let request = VNDetectHumanBodyPoseRequest(completionHandler: bodyPoseHandler)
        do{
            try requestHandler.perform([request])
            
        }catch{
            print("unable to perform the request, with error: \(error)")
            
        }
        
       
    }
    
    //sent data to array then limited scanning only a person
    //make pose visualize with points
    func bodyPoseHandler(request:VNRequest,error:Error?){
        guard let observation = request.results as? [VNHumanBodyPoseObservation] else {return}
        
        observation.forEach{
            processObservation($0)
        }
    }
    
    //calculate angle
    func calculateAngle(pointA: CGPoint, pointB: CGPoint, pointC: CGPoint) -> CGFloat {
        let vectorAB = CGVector(dx: pointB.x - pointA.x, dy: pointB.y - pointA.y)
        let vectorCB = CGVector(dx: pointB.x - pointC.x, dy: pointB.y - pointC.y)
        
        // 計算兩個向量的角度
        let dotProduct = vectorAB.dx * vectorCB.dx + vectorAB.dy * vectorCB.dy
        let magnitudeAB = sqrt(vectorAB.dx * vectorAB.dx + vectorAB.dy * vectorAB.dy)
        let magnitudeCB = sqrt(vectorCB.dx * vectorCB.dx + vectorCB.dy * vectorCB.dy)
        
        // 計算角度（弧度制）
        let angleRad = acos(dotProduct / (magnitudeAB * magnitudeCB))
        
        // 將弧度轉換為角度（度數制）
        let angleDeg = angleRad * 180 / CGFloat.pi
        
        return angleDeg
    }
    
    
    func processObservation(_ observation: VNHumanBodyPoseObservation){
        
        //declare the displaypoint array --- 樹式
        var ShouldRecognizedPoints: [CGPoint] = []
        
        //check true or false hand/leg
        var checkHandPos = false
        var checkLegPos = false
        
        do{
            //get all points
            let recognizedPoints = try observation.recognizedPoints(.all)
            
            //get specific points
            let recognizedPointNose = try observation.recognizedPoint(forKey: .bodyLandmarkKeyNose)
            let recognizedPointRShoulder = try observation.recognizedPoint(forKey: .bodyLandmarkKeyRightShoulder)
            let recognizedPointRElbow = try observation.recognizedPoint(forKey: .bodyLandmarkKeyRightElbow)
            let recognizedPointRWrist = try observation.recognizedPoint(forKey: .bodyLandmarkKeyRightWrist)
            let recognizedPointLShoulder = try observation.recognizedPoint(forKey: .bodyLandmarkKeyLeftShoulder)
            let recognizedPointLElbow = try observation.recognizedPoint(forKey: .bodyLandmarkKeyLeftElbow)
            let recognizedPointLWrist = try observation.recognizedPoint(forKey: .bodyLandmarkKeyLeftWrist)
            //legs
            let recognizedPointRHip = try observation.recognizedPoint(forKey: .bodyLandmarkKeyRightHip)
            let recognizedPointRAnkle = try observation.recognizedPoint(forKey: .bodyLandmarkKeyRightAnkle)
            let recognizedPointRKnee = try observation.recognizedPoint(forKey: .bodyLandmarkKeyRightKnee)
            //left leg
            let recognizedPointLHip = try observation.recognizedPoint(forKey: .bodyLandmarkKeyLeftHip)
            let recognizedPointLAnkle = try observation.recognizedPoint(forKey: .bodyLandmarkKeyLeftAnkle)
            let recognizedPointLKnee = try observation.recognizedPoint(forKey: .bodyLandmarkKeyLeftKnee)
            
//            guard recognizedPoints.count >= 2 else {
//                       print("Insufficient recognized points")
//                       return
//                   }
//            let secondPoint = recognizedPoints[recognizedPoints.index(recognizedPoints.startIndex, offsetBy: 1)].value
//
//            let displayedPoints = CGPoint(x: secondPoint.x, y: 1 - secondPoint.y)
            
            
//            let displayedPoints = recognizedPoints.map{
//                CGPoint(x: $0.value.x, y: 1-$0.value.y)
//            }
            
            //convert the coordinate
            let displayedPointRShoulder =
                CGPoint(x: recognizedPointRShoulder.x, y: 1-recognizedPointRShoulder.y)
//            let displayedPointNose =
//                CGPoint(x: recognizedPointNose.x, y: 1-recognizedPointNose.y)
            let displayedPointRWrist =
                CGPoint(x: recognizedPointRWrist.x, y: 1-recognizedPointRWrist.y)
            let displayedPointRElbow =
                CGPoint(x: recognizedPointRElbow.x, y: 1-recognizedPointRElbow.y)
            let displayedPointLShoulder =
                CGPoint(x: recognizedPointLShoulder.x, y: 1-recognizedPointLShoulder.y)
            let displayedPointLWrist =
                CGPoint(x: recognizedPointLWrist.x, y: 1-recognizedPointLWrist.y)
            let displayedPointLElbow =
                CGPoint(x: recognizedPointLElbow.x, y: 1-recognizedPointLElbow.y)
            
            //legs
            let displayedPointLHip =
                CGPoint(x: recognizedPointRHip.x, y: 1-recognizedPointLHip.y)
            let displayedPointLAnkle =
                CGPoint(x: recognizedPointLAnkle.x, y: 1-recognizedPointLAnkle.y)
            let displayedPointLKnee =
                CGPoint(x: recognizedPointLKnee.x, y: 1-recognizedPointLKnee.y)
            
            let displayedPointRHip =
                CGPoint(x: recognizedPointRHip.x, y: 1-recognizedPointRHip.y)
            let displayedPointRAnkle =
                CGPoint(x: recognizedPointRAnkle.x, y: 1-recognizedPointRAnkle.y)
            let displayedPointRKnee =
                CGPoint(x: recognizedPointRKnee.x, y: 1-recognizedPointRKnee.y)
            

            
            ShouldRecognizedPoints.append(displayedPointRShoulder)
            ShouldRecognizedPoints.append(displayedPointRElbow)
            ShouldRecognizedPoints.append(displayedPointRWrist)
            ShouldRecognizedPoints.append(displayedPointLShoulder)
            ShouldRecognizedPoints.append(displayedPointLElbow)
            ShouldRecognizedPoints.append(displayedPointLWrist)
            
            ShouldRecognizedPoints.append(displayedPointRHip)
            ShouldRecognizedPoints.append(displayedPointRAnkle)
            ShouldRecognizedPoints.append(displayedPointRKnee)
            ShouldRecognizedPoints.append(displayedPointLHip)
            ShouldRecognizedPoints.append(displayedPointLAnkle)
            ShouldRecognizedPoints.append(displayedPointLKnee)
            
            
            
            let RightHandAngle = calculateAngle(pointA: displayedPointRWrist, pointB: displayedPointRElbow, pointC: displayedPointRShoulder)
            let LeftHandAngle = calculateAngle(pointA: displayedPointLWrist, pointB: displayedPointLElbow, pointC: displayedPointLShoulder)
            
            print(LeftHandAngle)
            if LeftHandAngle <= 120 && LeftHandAngle >= 90 && RightHandAngle <= 120 && RightHandAngle >= 90 {
                checkHandPos = true
                //checkLegPos = true
                print("hand ok")
            }else{
                print("hand failed")
            }
            
            let RightLegAngle = calculateAngle(pointA: displayedPointRHip, pointB: displayedPointRKnee, pointC: displayedPointRAnkle)
            if RightLegAngle <= 35 && RightLegAngle >= 0 {
                checkLegPos=true
                print("leg ok")
            }else{
                print("leg failed")
            }
            
            
            
            
            
            //pass the points to be displayed by the protocol to the view(pointslayer)
            delegate?.predictor(self, didFindNewRecognizedPoints: ShouldRecognizedPoints, checkHandPos: checkHandPos, checkLegPos: checkLegPos)
        } catch{
            print("error finding recgnizedPoints")
        }
    
    }
    
}






//宣告個節點
extension VNHumanBodyPoseObservation.JointName {
    // 鼻子
    public static let nose = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "nose") )
    // 左眼
    public static let leftEye = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "leftEye") )
    // 右眼
    public static let rightEye = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "rightEye") )
    // 左耳
    public static let leftEar = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "leftEar") )
    // 右耳
    public static let rightEar = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "rightEar") )
    // 左肩
    public static let leftShoulder = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "leftShoulder") )
    // 右肩
    public static let rightShoulder = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "rightShoulder") )
    // 脖子
    public static let neck = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "neck") )
    // 左肘
    public static let leftElbow = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "leftElbow") )
    // 右肘
    public static let rightElbow = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "rightElbow") )
    // 左腕
    public static let leftWrist = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "leftWrist") )
    // 右腕
    public static let rightWrist = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "rightWrist") )
    // 左髋
    public static let leftHip = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "leftHip") )
    // 右髋
    public static let rightHip = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "rightHip") )
    // 身體
    public static let root = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "root") )
    // 左膝
    public static let leftKnee = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "leftKnee") )
    // 右膝
    public static let rightKnee = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "rightKnee") )
    // 左踝
    public static let leftAnkle = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "leftAnkle") )
    // 右踝
    public static let rightAnkle = VNHumanBodyPoseObservation.JointName(rawValue: VNRecognizedPointKey(rawValue: "rightAnkle") )
}

