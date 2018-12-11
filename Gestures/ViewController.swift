//
//  ViewController.swift
//  Gestures
//
//  Created by 503-03 on 2018. 11. 6..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    //확대 축소 배율을 저장하기 위한 변수
    var oldScale : CGFloat = 1.0
    
    //탭 동작할 때 수행할 메소드
    @objc func tapMethod(sender : UITapGestureRecognizer){
        print("더블 클릭")
    }
    //Pinch(확대축소) 동작을 수행할 때 메소드
    @objc func pinchMethod(sender : UIPinchGestureRecognizer){
        let newScale = sender.scale
        if newScale > 1.0{
            //크기 변경: 원본 이미지 뷰의 크기는 그대로 있고 이미지만  확대 축소가 됩니다.
            imageView.transform = CGAffineTransform(scaleX: oldScale + newScale - 1, y: oldScale + newScale - 1)
        }else{
            imageView.transform = CGAffineTransform(scaleX: oldScale * newScale, y: oldScale * newScale)
        }
        if sender.state == .ended{
            if newScale > 1 {
                oldScale = oldScale + newScale - 1
            }else{
                oldScale = oldScale * newScale
            }
        }
        print(oldScale)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 탭 체스처 만들기
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapMethod(sender:)))
        // 제약조건 설정
        tapGesture.numberOfTapsRequired = 2
        
        // 뷰와 제스처 연결
        imageView.addGestureRecognizer(tapGesture)
        
         // 핀치 체스처 만들기
        let pinchGesture = UIPinchGestureRecognizer.init(target: self, action: #selector(pinchMethod(sender:)))
        //뷰에 연결
        imageView.addGestureRecognizer(pinchGesture)
    }
}

