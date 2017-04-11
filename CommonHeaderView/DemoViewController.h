//
//  DemoViewController.h
//  CommonHeaderView
//
//  Created by fanxiaobin on 2017/4/11.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DemoViewControllerType) {
    
    DemoViewControllerTableView = 0,
    DemoViewControllerCollectionView
};

@interface DemoViewController : UIViewController

@property (nonatomic) DemoViewControllerType type;

@end
