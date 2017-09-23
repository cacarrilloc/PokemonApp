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
    
    lazy var ThirdViewModel:ViewModel3 = ViewModel3(delegate: self)
    
    var passedUrl:String?
    var passedIndex:Int?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setBackgroundImage()
        myImageView.image = #imageLiteral(resourceName: "Picture1")
        guard let url = passedUrl else {return}
        guard let indexIn = passedIndex else {return}
        self.ThirdViewModel.getPokemonFeatures(inputUrl: url, index: indexIn)
    }
    
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
    func passPokemonFeatures(array: [PokemonFeatures], image: UIImage){
        DispatchQueue.main.async {
            self.myImageView.image = image
            self.myLabel1.text = array[0].name
            self.myLabel2.text = array[0].id
            self.myLabel3.text = array[0].base_experience
            self.myLabel4.text = array[0].height
            self.myLabel5.text = array[0].weight
        }
    }
}
