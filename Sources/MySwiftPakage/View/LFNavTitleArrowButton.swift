//
//  LFNavTitleArrowButton.swift
//  LFPhotoAlbumDemo
//
//  Created by leo on 2021/8/5.
//

import UIKit

class LFNavTitleArrowButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   
    //点击按钮旋转按钮中的imageView 180度
    override var isSelected: Bool{
        didSet{
            self.imageView?.layer.transform = CATransform3DRotate((self.imageView?.layer.transform)!,  CGFloat(M_PI), 0.0, 0.0, 1.0)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //让按钮图片在右文字在左,调整图片文字位置
        let btnWidth = frame.size.width
        let width = titleLabel!.frame.size.width + imageView!.frame.size.width  + 6.0
        titleLabel?.frame.origin.x = (btnWidth-width)*0.5
        imageView?.frame.origin.x = (titleLabel?.frame.maxX)! + 6
    }
}
