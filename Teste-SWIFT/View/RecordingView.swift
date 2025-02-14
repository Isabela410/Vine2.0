//
//  RecordingView.swift
//  Teste-SWIFT
//
//  Created by izabour Azevedo on 11/02/25.
//

import UIKit
import AVFoundation


class RecordingView: UIViewController, AVCapturePhotoCaptureDelegate {
    
    @IBOutlet weak var Camera: UIImageView!
    
    var photoOutput: AVCapturePhotoOutput!
    
    @IBOutlet weak var BarrinhaCarregamento: UIProgressView!
    
    var captureSession: AVCaptureSession!
    var movieOutput: AVCaptureMovieFileOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var timer: Timer?
    var recordingTime: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
        configureProgressBar()
        checkCameraPermissions()
    }
    
    private func checkCameraPermissions() {
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                self.setupCamera()
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        DispatchQueue.main.async {
                            self.setupCamera()
                        }
                    }
                }
            default:
                print("Camera access denied")
            }
        }

        private func setupCamera() {
            // 1. Setup session
            captureSession = AVCaptureSession()
            captureSession.sessionPreset = .high
            
            // 2. Setup inputs
            guard let videoDevice = AVCaptureDevice.default(for: .video),
                  let videoInput = try? AVCaptureDeviceInput(device: videoDevice),
                  captureSession.canAddInput(videoInput) else {
                fatalError("Could not create video device input")
            }
            
            // 3. Setup audio input for video recording
            guard let audioDevice = AVCaptureDevice.default(for: .audio),
                  let audioInput = try? AVCaptureDeviceInput(device: audioDevice),
                  captureSession.canAddInput(audioInput) else {
                fatalError("Could not create audio device input")
            }
            
            // Add inputs
            captureSession.addInput(videoInput)
            captureSession.addInput(audioInput)
            
            // 4. Setup outputs
            photoOutput = AVCapturePhotoOutput()
            movieOutput = AVCaptureMovieFileOutput()
            
            guard captureSession.canAddOutput(photoOutput),
                  captureSession.canAddOutput(movieOutput) else {
                fatalError("Could not add outputs")
            }
            
            captureSession.addOutput(photoOutput)
            captureSession.addOutput(movieOutput)
            
            // 5. Setup preview layer
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.frame = Camera.bounds
            Camera.layer.addSublayer(previewLayer)
            
            // 6. Start session
            DispatchQueue.global(qos: .userInitiated).async {
                self.captureSession.startRunning()
            }
        }
    
    @IBAction func capturePhotoTapped(_ sender: UIButton) {
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
    
    private func configureProgressBar() {
        BarrinhaCarregamento.progress = 0.0
        BarrinhaCarregamento.progressTintColor = .systemGreen
        BarrinhaCarregamento.trackTintColor = .systemGray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startRecording()
    }
    
    private func startRecording() {
        guard !movieOutput.isRecording else { return }
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileUrl = paths[0].appendingPathComponent("video.mp4")
        try? FileManager.default.removeItem(at: fileUrl)
        
        movieOutput.startRecording(to: fileUrl, recordingDelegate: self)
        
        recordingTime = 0.0
        BarrinhaCarregamento.progress = 0.0
        //startTimer()
    }
}

extension RecordingView: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput,
                    didFinishRecordingTo outputFileURL: URL,
                    from connections: [AVCaptureConnection],
                    error: Error?) {
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        var image = UIImage(data: imageData)
    }
}

#Preview{
    UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "CameraView")
}
