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
    
    //camera functions
    
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
    
    private func startRecording() {
        guard !isRecording else { return }
        isRecording = true
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileUrl = paths[0].appendingPathComponent("video.mp4")
        try? FileManager.default.removeItem(at: fileUrl)
        movieOutput.startRecording(to: fileUrl, recordingDelegate: self)
        
        recordingTime = 0.0
        BarrinhaCarregamento.progress = 0.0
        startTimer()
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
    
    // Add touch tracking property
        private var isRecording = false
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            stopRecording()
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            stopRecording()
        }
        
        private func stopRecording() {
            guard isRecording else { return }
            isRecording = false
            
            movieOutput.stopRecording()
            timer?.invalidate()
            timer = nil
        }
        
        private func startTimer() {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                
                self.recordingTime += 0.1
                self.BarrinhaCarregamento.progress = self.recordingTime / 6.0
                
                if self.recordingTime >= 6.0 {
                    self.stopRecording()
                }
            }
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
