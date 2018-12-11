//
//  AppDelegate.swift
//  localNotifications
//
//  Created by 503-03 on 2018. 11. 7..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    // 앱 실행시 초기화를 위한 메소드
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 알림 사용 여부를 묻기 - 권한 요청
        let notiCenter = UNUserNotificationCenter.current()
        notiCenter.requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted, erro) in notiCenter.delegate = self})
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {settings in
            if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                
                //알림 콘텐츠 객체
                let nContent = UNMutableNotificationContent()
                nContent.badge = 1
                nContent.title = "로컬 알림 메시지"
                nContent.subtitle = "subtitle"
                nContent.body = "새로운 기능이 추가되었습니다. 업데이트하세요."
                nContent.sound = UNNotificationSound.default
                nContent.userInfo = ["name": "관리자"]
                
                //알림 발송 조건 객체
                let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 10, repeats: false)
                
                //알림 요청 객체
                let request = UNNotificationRequest.init(identifier: "update", content: nContent, trigger: trigger)
                //NotificationCenter에 추가
                UNUserNotificationCenter.current().add(request)
            }else{
                print("사용자가 동의하지 않았습니다.")
            }
        })
    }
    
    //백그라운드에 있다가 알림이 왔을 때 호출되는 메소드
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler: @escaping (UNAuthorizationOptions)->Void){
        if notification.request.identifier == "update"{
            print(notification.request.content.userInfo["name"])
            
        }
    }
    
    //알림을 클릭했을 때 호출되는 메소드
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup"{
            print(response.notification.request.content.userInfo["name"]!)
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

