//
//  Tools.swift
//  Instagram
//
//  Created by dmorenoar on 27/12/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import Foundation
import UIKit

class Tools {
    
    func getImage(imagenURL:String, completion: @escaping (_ image: UIImage?) -> ()) {
        
        let imgURL = URL(string: imagenURL)!
        //var imagen:UIImage = UIImage()
        
        //Creates a default configuration object that uses the disk-persisted global cache, credential and cookie storage objects.
        //Creamos la sesion
        let session = URLSession(configuration: .default)
        
        //Obtengo la URL definiendola del tipo data, el cod de respuesta y el error
        session.dataTask(with: imgURL) { (data, response, error) in
            //Una vez descargada la imagen puedo tratarla
            //Comprobamos que no se haya producido ningun error
            if let e = error {
                print("Error downloading image: \(e)")
            } else {
                // Tratamos la respuesta de la URL
                //Comprobamos el tipo de respuesta obtenida
                if let res = response as? HTTPURLResponse {
                    print("Downloaded image with response code \(res.statusCode)") //200 todo OK
                    //Tratamos el data obtenido de la URL
                    if let imageData = data {
                        // Convertimos la imagen del tipo data a una UIImage para poder enviarla en el completion
                        completion(UIImage(data: imageData)!)
                    } else {
                        print("Couldn't get image: Image is nil") //No se ha podido obtener el recurso
                    }
                } else {
                    print("Couldn't get response code for some reason") //El servidor no esta accesible
                }
            }
            }.resume()
    }
    /*
    func decodeJsonData(url:URL){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                
                let decoder = JSONDecoder()
                
                self.arrayPokemons = try decoder.decode([User].self, from: data)
                print("recojo de api",self.arrayPokemons.count)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
   
    }*/
    
    func roundImage(img:UIImageView) {
        
        img.layer.cornerRadius = img.frame.height / 2
        //imgUser.layer.cornerRadius = 50
        img.layer.masksToBounds = false
        img.clipsToBounds = true
        
    
    }
    
    
    
}
