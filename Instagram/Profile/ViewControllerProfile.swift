//
//  ViewControllerProfile.swift
//  Instagram
//
//  Created by dmorenoar on 29/12/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import UIKit

class ViewControllerProfile: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var arrayUsers = [User]()
    var tools:Tools = Tools()
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblPublicados: UILabel!
    
    @IBOutlet weak var lblFavoritos: UILabel!
    
    @IBOutlet weak var lblSiguiendo: UILabel!
    
    @IBOutlet weak var lblNombreProfile: UILabel!
    
    @IBOutlet weak var lblDescProfile: UILabel!
    

    
    let url = URL(string: "https://private-ecf219-instagram9.apiary-mock.com/user")
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCellProfile
        
        
        tools.getImage(imagenURL: arrayUsers[indexPath.row].userPost[0].imgPost) { (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    myCell.imgPosteados.image = imagen
                    return
                }
            }
        }
        
        return myCell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        tools.roundImage(img: imgProfile)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
