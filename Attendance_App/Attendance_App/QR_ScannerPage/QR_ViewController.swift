//
//  QR_ViewController.swift
//  Attendance_App
//
//  Created by J.K on 5/28/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit
import AVFoundation

class QR_ViewController: UIViewController {
    
    var avCaptureSession: AVCaptureSession!
    var avPreviewLayer: AVCaptureVideoPreviewLayer!
    
    var studentDetails: ClassDto?
    
    var qrcode = ""
    @IBOutlet weak var sourceCode: UILabel!
    @IBOutlet weak var studentID: UILabel!

    var status = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sourceCode.text = studentDetails?.courseCode
        studentID.text = studentDetails?.id
        
        
        avCaptureSession = AVCaptureSession()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
                self.failed()
                return
            }
            let avVideoInput: AVCaptureDeviceInput
            
            do {
                avVideoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            } catch {
                self.failed()
                return
            }
            
            if (self.avCaptureSession.canAddInput(avVideoInput)) {
                self.avCaptureSession.addInput(avVideoInput)
            } else {
                self.failed()
                return
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            
            if (self.avCaptureSession.canAddOutput(metadataOutput)) {
                self.avCaptureSession.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417, .qr]
            } else {
                self.failed()
                return
            }
            
            self.avPreviewLayer = AVCaptureVideoPreviewLayer(session: self.avCaptureSession)
            self.avPreviewLayer.frame = self.view.layer.bounds
            self.avPreviewLayer.videoGravity = .resizeAspectFill
            self.view.layer.addSublayer(self.avPreviewLayer)
            self.avCaptureSession.startRunning()
        }
        
        
    }
    
    @IBAction func backToClassVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanner not supported", message: "Please use a device with a camera. Because this device does not support scanning a code", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        avCaptureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (avCaptureSession?.isRunning == false) {
            avCaptureSession.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (avCaptureSession?.isRunning == true) {
            avCaptureSession.stopRunning()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func GetQR()  {
        
        // get url
        let url = URL(string: "https://ams-be-yasu.herokuapp.com/checkin")
        
        // guard url is valid
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        
        let token = UserDefaults.standard.string(forKey: "accessToken")
        

        let sData = dataSending(classId: "1a21d49b-7010-415d-aec6-664c16d01e6e", studentId: "bb444846-38dd-4e4a-bd84-bd893689ed69", qrcode: qrcode)
        
        // Encode - json file
        let jsonData = try? JSONEncoder().encode(sData)
        
        // Get http body
        request.httpBody = jsonData
        
        // Set http method
        request.httpMethod = "POST"
        
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        
        
        // func call api
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // if it exists error -> show error -> exit
            if let error = error {
                print("Error took place \(error)")
                DispatchQueue.main.sync {
                    
                    let alert = UIAlertController(title: "Error", message: "Something went wrong, try again.", preferredStyle: .alert)

                    // Add button for this notification
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                    // Display nofitication
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                return
            }
                        
                if let httpResponse = response as? HTTPURLResponse {
                    
                    self.status = httpResponse.statusCode
                    print(self.status)
                    //update status
                    DispatchQueue.main.sync {
                        
                        
                        if httpResponse.statusCode <= 300 {
                            
                            self.dismiss(animated: true, completion: nil)
                            
                        }
                        else
                        {
                            let alert = UIAlertController(title: "Error", message: "Invalid QR Code", preferredStyle: .alert)

                            // Add button for this notification
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                            // Display nofitication
                            self.present(alert, animated: true, completion: nil)
                            
                            return
                        }
                    }
            }
            
        }
        task.resume()
        
    }
    
    
}
extension QR_ViewController : AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//        avCaptureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        
//        dismiss(animated: true)
    }
    
    func found(code: String) {
        qrcode = code
        GetQR()
        print(code)
    }
}


