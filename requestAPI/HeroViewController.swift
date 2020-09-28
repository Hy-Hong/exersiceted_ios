//
//  HeroViewController.swift
//  requestAPI
//
//  Created by Hy Horng on 9/25/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class HeroViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var attributeLbl: UILabel!
    @IBOutlet var attackLbl: UILabel!
    @IBOutlet var legsLbl: UILabel!
    
    var hero:HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = hero?.localized_name
        attributeLbl.text = hero?.primary_attr
        attackLbl.text = hero?.attack_type
        legsLbl.text = "\(hero!.legs)"
        
        let urlString = "https://api.opendota.com" + hero!.img
        let url = URL(string: urlString)
        
        imageView.downloadedFrom(url: url!)
        
        view.backgroundColor = UIColor.purple
        
    }

}
