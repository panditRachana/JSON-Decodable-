//
//  TableViewCell.swift
//  JSON(Decodable)
//
//  Created by Rachana Pandit on 14/12/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var lblBrand:UILabel!
    @IBOutlet weak var lblPrice:UILabel!
    @IBOutlet weak var collImages:UICollectionView!
    var arrayImages = [String]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        registerCollXib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

            }
    func registerCollXib()
    {
      let nibName = UINib(nibName: "CollectionViewCell", bundle: nil)
        
        collImages.register(nibName, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
}

extension TableViewCell:UICollectionViewDelegate
{
    
}

extension TableViewCell:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrayImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let collCell =  collImages.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let urlFetched = URL(string: arrayImages[indexPath.row])
        let dataImg = try? Data(contentsOf: urlFetched!)
        collCell.img.image = UIImage(data: dataImg!)
        return collCell
    }
}

extension TableViewCell:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Int(collImages.frame.width)/arrayImages.count, height: 120)
    }
}
