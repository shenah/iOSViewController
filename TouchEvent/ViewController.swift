//
//  ViewController.swift
//  TouchEvent
//
//  Created by 503-03 on 2018. 11. 6..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    
    //터치 관련 메소드 작성
    //터치가 시작되면 호출되는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //터치를 1개만 하면 touches에서 첫번째 데이터를 꺼내면 됩니다.
        let touch = touches.first
        lblCount.text = "\(touch!.tapCount)번 탭"
        lblState.text = "터치를 한 상태입니다."
    }
    
    //터치가 이동할 때 호출되는 메소드
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lblState.text = "터치가 이동 중 입니다."
        //발생한 터치 가져오기
        let touch = touches.first
        //imageView에서 터치가 이동 중이라면
        //터치의 좌표를 imageView의 중앙점으로 설정
        if touch!.view == imageView{
            imageView.center = touch!.location(in: self.view)
        }
    }
    
    //터치가 종료되었을 때 호출되는 메소드
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lblState.text = "터치가 종료 되었습니다."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
