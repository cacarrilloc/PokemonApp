//
//  SecondViewController.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController, UIActionSheetDelegate {
    
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var myLabel4: UILabel!
    @IBOutlet weak var myLabel5: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    // Delagate connection variable
    lazy var ThirdViewModel:ViewModel3 = ViewModel3(delegate: self)
    
    var passedUrl:String?
    var passedIndex:Int?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setBackgroundImage()
        guard let url = passedUrl else {return}
        guard let indexIn = passedIndex else {return}
        self.ThirdViewModel.getPokemonFeatures(inputUrl: url, index: indexIn)
    }
    
    // Just background pic (cosmetics)
    func setBackgroundImage(){
        let background = UIImage(named: "pokeBack")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ThirdViewController:VMDelegate3{
    func passPokemonFeatures(features:PokemonFeatures, image:UIImage) {
        DispatchQueue.main.async {
            // Label cosmetics
            self.myLabel1.clipsToBounds = true
            self.myLabel2.clipsToBounds = true
            self.myLabel3.clipsToBounds = true
            self.myLabel4.clipsToBounds = true
            self.myLabel5.clipsToBounds = true
            
            // Display values
            self.myImageView.image = image
            self.myLabel1.text = features.name
            self.myLabel2.text = features.stat
            self.myLabel3.text = features.base_experience
            self.myLabel4.text = features.height
            self.myLabel5.text = features.weight
        }
    }
}
