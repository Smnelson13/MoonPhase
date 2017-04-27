//
//  PhaseDetailViewController.swift
//  MoonPhase
//
//  Created by Shane Nelson on 4/27/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import UIKit

class PhaseDetailViewController: UIViewController
{
  @IBOutlet weak var illuminateLabel: UILabel!
  @IBOutlet weak var phaseImageView: UIImageView!
  @IBOutlet weak var phaseLabel: UILabel!
  var aPhase: Phase!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    phaseLabel.text = aPhase.phase
    phaseImageView.image = UIImage(named: aPhase.imageName)
    illuminateLabel.text = "\(aPhase.illumination)%"
   
  }

  override func didReceiveMemoryWarning()
  {
      super.didReceiveMemoryWarning()

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
