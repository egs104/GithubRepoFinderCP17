//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Eric Suarez on 3/1/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {
    
    weak var delegate: SettingsPresentingViewControllerDelegate?
    @IBOutlet weak var minStarSlider: UISlider!
    @IBOutlet weak var minStarValue: UILabel!
    
    var settings = GithubRepoSearchSettings()

    override func viewDidLoad() {
        super.viewDidLoad()

        minStarValue.text = "\(Int(settings.minStars))"
        minStarSlider.value = Float(settings.minStars)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        settings.minStars = Int(minStarSlider.value)
        self.delegate?.didSaveSettings(settings: settings)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.delegate?.didCancelSettings()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sliderDidChange(_ sender: Any) {
        minStarValue.text = "\(Int(minStarSlider.value))"
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

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}
