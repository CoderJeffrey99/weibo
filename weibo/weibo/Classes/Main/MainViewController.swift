//
//  MainViewController.swift
//  weibo
//
//  Created by 谢吴军 on 2023/1/10.
//

import UIKit
// FIXME
class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1>.创建子控制器
        let childVC = HomeViewController()
        
        // 2>.设置子控制器的属性
        childVC.title = "首页"
        childVC.tabBarItem.image = UIImage(named: "")
        childVC.tabBarItem.selectedImage = UIImage(named: "")
        
        // 3>.包装导航控制器
        let childNav = UINavigationController(rootViewController: childVC)
        
        // 4>.添加控制器
        addChild(childNav)
    }
    
    // swift支持方法重载
    // 方法的重载：方法名称相同，参数不同（参数类型不同/参数个数不同）
    private func addChildViewController() {
        
        // 0>.获取命名空间
        guard let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String else {
            print("没有获取命名空间")
            return
        }
        
        // 1>.根据字符串获取对应的Class
        guard let child_VC_Class = NSClassFromString(nameSpace + "." + "") else {
            print("没有获取到字符串对应的Class")
            return
        }
        
        // 2>.将对应的AnyObject转成控制器的类型
        guard let child_VC_Type = child_VC_Class as? UIViewController.Type else {
            print("没有获取对应控制器的类型")
            return
        }
        
        // 3>.创建对应的控制器对象
        let childVC = child_VC_Type.init();
    }
}
