//
//  LFPhotoPreviewCollectionViewCell.swift
//  LFPhotoAlbumDemo
//
//  Created by leo on 2021/8/7.
//

import UIKit

class LFPhotoPreviewCollectionViewCell: UICollectionViewCell {
    var imageView : UIImageView!
    
    
    var model : LFPhotoModel!{
        didSet{
            let size =  CGSize(width: model.asset.pixelWidth, height: model.asset.pixelHeight)
            LFPhotoAlbumManager.requestImage(asset: model.asset,
                                                  targetSize: size,
                                                  contentMode: .aspectFit)
            { (image, nil) in
                self.imageView.image = image
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView.init(frame: self.contentView.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        self.contentView.addSubview(imageView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
