//
//  JokeDetailViewController.swift
//  ChuckNorrisJokesMVVM
//
//  Created by Dindonkey on 11/09/2017.
//  Copyright © 2017 Dindonkey. All rights reserved.
//

import UIKit

class JokeDetailViewController: UIViewController {

    @IBOutlet weak var jokeImage: UIImageView!
    @IBOutlet weak var jokeText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
