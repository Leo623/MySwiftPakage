//
//  LFPhotoCollectionViewCell.swift
//  LFPhotoAlbumDemo
//
//  Created by leo on 2021/8/4.
//

import UIKit
import SnapKit
class LFPhotoCollectionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    //model Set赋值
    var model:LFPhotoModel!{
        didSet{
            LFPhotoAlbumManager.requestImage(asset: model.asset, targetSize: CGSize.init(width: ScreenWidth/3, height: ScreenWidth/3), contentMode: .aspectFill) { (image, _) in
                self.imageView.image = image;
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI(){
        imageView = UIImageView()
        contentView.addSubview(imageView)
        
        imageView?.snp.makeConstraints({ make in
            make.edges.equalTo(self)
        })
    }
    
   
}
