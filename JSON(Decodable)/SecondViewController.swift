//
//  SecondViewController.swift
//  JSON(Decodable)
//
//  Created by Rachana Pandit on 13/12/22.
//

import UIKit

class SecondViewController: UIViewController {

    var arrayProduct2 = [Product2]()
    @IBOutlet weak var tblProduct2:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        fetchingDataFromApi()
    }
    
    func registerXib()
    {
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tblProduct2.register(nibName, forCellReuseIdentifier: "TableViewCell")
    }
    
    func fetchingDataFromApi()
    {
      let urlString = "https://dummyjson.com/products"
       let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
              print(data)
            let result = try! JSONDecoder().decode(ApiResponse2.self, from: data!)
            print(result)
            for eachProduct in result.products
            {
                self.arrayProduct2.append(eachProduct)
            }
            print(self.arrayProduct2.count)
            
            DispatchQueue.main.async {
                self.tblProduct2.reloadData()
            }
        }
        .resume()
    }
    
}

extension SecondViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayProduct2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tblCell = tblProduct2.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        tblCell.lblTitle.text = arrayProduct2[indexPath.row].title
        tblCell.lblDescription.text = arrayProduct2[indexPath.row].description
        tblCell.lblPrice.text = String(arrayProduct2[indexPath.row].price as Int)
        tblCell.lblBrand.text = arrayProduct2[indexPath.row].brand

        return tblCell
    }
}

extension SecondViewController:UITableViewDelegate{
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 135
    }
}
