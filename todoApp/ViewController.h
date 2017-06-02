//
//  ViewController.h
//  todoApp
//
//  Created by zxm on 17/5/27.
//  Copyright © 2017年 Zhang Xinmiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

<UIApplicationDelegate, UITableViewDataSource>


@property (nonatomic) NSMutableArray *tasks;

- (void) addTask: (id) sender;


@end

