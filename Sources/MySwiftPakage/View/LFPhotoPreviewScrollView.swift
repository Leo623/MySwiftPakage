//
//  LFPhotoPreviewScrollView.swift
//  LFPhotoAlbumDemo
//
//  Created by leo on 2021/8/6.
//

import UIKit

class LFPhotoPreviewScrollView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var scrollView:UIScrollView!
    var imageView:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:-UI创建
    private func initUI(){
        scrollView = UIScrollView.init(frame: self.bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.contentSize = CGSize.init(width: ScreenWidth * CGFloat(3), height: self.bounds.height)
        self.addSubview(scrollView)
    }
}

extension LFPhotoPreviewScrollView:UIScrollViewDelegate{
    
}
