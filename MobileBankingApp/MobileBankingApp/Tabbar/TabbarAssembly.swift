//
//  TabbarAssembly.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

enum TabbarAssembly {
    static func build() -> UITabBarController {
    let tabbar = UITabBarController()
        let mainViewController = MainAssembly.build()
        let mainNavViewController = UINavigationController(rootViewController: mainViewController)
        
        let currencyViewController = CurrencyAssemly.build()
        let currencyNavViewController = UINavigationController(rootViewController: currencyViewController)
        
        let accountViewController = AccountAssembly.biuld()
        let accountNavViewController = UINavigationController(rootViewController: accountViewController)
        
        tabbar.setViewControllers([mainNavViewController,  currencyNavViewController, accountNavViewController], animated: true)
        
        mainViewController.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "clarity_home-line"), tag: 0)
        currencyViewController.tabBarItem = UITabBarItem(title: "Курсы валют", image: UIImage(named: "clarity_repeat-line"), tag: 1)
        accountViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "clarity_user-line"), tag: 2)
        
        tabbar.tabBar.tintColor = Colors.redColor.value
        tabbar.tabBar.unselectedItemTintColor = Colors.tabbarLabelOf.value
        tabbar.tabBar.backgroundColor = .white
        
    return tabbar
    }
}
