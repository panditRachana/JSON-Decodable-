//
//  ViewController.swift
//  JSON(Decodable)
//
//  Created by Rachana Pandit on 13/12/22.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var tblProduct1:UITableView!
var arrayProduct1 = [Product1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXib()
        fetchingDataFromApi()
    }
    
    func registerXib()
    {
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tblProduct1.register(nibName, forCellReuseIdentifier: "TableViewCell")
    }
    func fetchingDataFromApi()
    {
      let urlString = "https://dummyjson.com/products"
       let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
              print(data)
            let result = try! JSONDecoder().decode(ApiResponse1.self, from: data!)
            print(result)
            for eachProduct in result.products
            {
                self.arrayProduct1.append(eachProduct)
            }
            print(self.arrayProduct1.count)
            DispatchQueue.main.async {
                self.tblProduct1.reloadData()
            }
        }
        .resume()
    }
}// Class ends here

extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayProduct1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tblCell = tblProduct1.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        tblCell.lblTitle.text = arrayProduct1[indexPath.row].title
        tblCell.lblDescription.text = arrayProduct1[indexPath.row].description
        tblCell.lblPrice.text = String(arrayProduct1[indexPath.row].price as Int)
        tblCell.lblBrand.text = arrayProduct1[indexPath.row].brand
        tblCell.arrayImages = arrayProduct1[indexPath.row].images
        return tblCell
    }
}

extension ViewController:UITableViewDelegate{
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
}
