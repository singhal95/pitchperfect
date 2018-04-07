//
//  ViewController.swift
//  Pitchperfect
//
//  Created by NITIN SINGHAL on 23/03/18.
//  Copyright © 2018 NITIN SINGHAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordinglable: UILabel!
    
    @IBAction func recordButton(_ sender: Any) {
        recordinglable.text="Recording Start"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func stoprecordingbutton(_ sender: Any) {
        recordinglable.text="Tap to record"
    }
}

