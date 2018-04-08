//
//  RecordViewController.swift
//  Pitchperfect
//
//  Created by NITIN SINGHAL on 23/03/18.
//  Copyright © 2018 NITIN SINGHAL. All rights reserved.
//

import UIKit
import AVFoundation
class RecordViewController: UIViewController , AVAudioRecorderDelegate {

    @IBOutlet weak var recordinglable: UILabel!
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordbutton: UIButton!
    @IBOutlet weak var stopbutton: UIButton!
    @IBAction func recordButton(_ sender: Any) {
        recordinglable.text = "Recording in progress"
        stopbutton.isEnabled = true
        recordbutton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopbutton.isEnabled=false
        
    }

    

    @IBAction func stoprecordingbutton(_ sender: Any) {
        recordinglable.text="Tap to record"
        stopbutton.isEnabled=false
        recordbutton.isEnabled=true
        audioRecorder.stop()
        let audiosession=AVAudioSession.sharedInstance()
        try! audiosession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    
        if flag{
        performSegue(withIdentifier: "Xyz", sender: audioRecorder.url)
        }
        else{
            print("Error in recording")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Xyz"{
            let PlaySoundVc=segue.destination as! PlaySoundViewController
            let recordaudiourl=sender as! URL
            PlaySoundVc.RecordAudrioUrl=recordaudiourl
            
        }
    }
}

