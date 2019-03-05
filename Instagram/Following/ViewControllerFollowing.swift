//
//  ViewControllerFollowing.swift
//  Instagram
//
//  Created by dmorenoar on 27/12/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import UIKit



class ViewControllerFollowing: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var isSearching:Bool = false
    var filterUsers = [User]()
    
    var arrayUsers = [User]()
    var tools:Tools = Tools()

    let url = URL(string: "https://private-ecf219-instagram9.apiary-mock.com/user")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return !isSearching ? ( !arrayUsers.isEmpty ? arrayUsers[section].userFollowing.count : 0) : filterUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCellFollowing
        
        if isSearching{
            
            tools.getImage(imagenURL: filterUsers[indexPath.row].userImage) { (imgRecovered) -> Void in
                if let imagen = imgRecovered {
                    DispatchQueue.main.async {
                        myCell.imgUser.image = imagen
                        return
                    }
                }
            }
            myCell.lblNickNameUser.text = filterUsers[indexPath.row].userNickName
            myCell.lblStateUser.text = filterUsers[indexPath.row].userState
            
            
        }else{
        
        
        tools.getImage(imagenURL: arrayUsers[indexPath.section].userFollowing[indexPath.row].userImage) { (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    myCell.imgUser.image = imagen
                    return
                }
            }
        }
 
        myCell.lblNickNameUser.text = arrayUsers[indexPath.section].userFollowing[indexPath.row].userNickName
        myCell.lblStateUser.text = arrayUsers[indexPath.section].userFollowing[indexPath.row].userState
            
        }
        
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterUsers = [User]()
        
        if !searchText.isEmpty{
            
            for index in 0...arrayUsers.count - 1{
                for i in 0...arrayUsers[index].userFollowing.count - 1{
                    if arrayUsers[index].userFollowing[i].userNickName.lowercased().contains(searchText.lowercased()) {
                        filterUsers.append(arrayUsers[index].userFollowing[i])
                    }
                }
            }
            isSearching = true
            tableView.reloadData()
        } else{
            isSearching = false
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        decodeJsonData(url: url!)
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self

        // Do any additional setup after loading the view.
    }
    

    
     func decodeJsonData(url:URL){
     
         URLSession.shared.dataTask(with: url) { (data, response, error) in
         
         guard let data = data else { return }
         
         do {
         
             let decoder = JSONDecoder()
            
            print("voy a decodificar")
             self.arrayUsers = try decoder.decode([User].self, from: data)
            
             print("recojo de api",self.arrayUsers.count)
            
             DispatchQueue.main.async {
                self.tableView.reloadData()
             }
         
         } catch let err {
            print("Error detectado", err)
         }
         }.resume()
        
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
