//
//  ViewController.m
//  todoApp
//
//  Created by zxm on 17/5/27.
//  Copyright © 2017年 Zhang Xinmiao. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tasks = [NSMutableArray array];
    
    UITextField *taskField = [[UITextField alloc] init];
    taskField.borderStyle = UITextBorderStyleRoundedRect;
    taskField.frame = CGRectMake(20, 40, 200, 31);
    taskField.placeholder = @"type a task, tap insert~";
    [self.view addSubview: taskField];
    
    
    UIButton *insertButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    insertButton.frame = CGRectMake(228, 40, 72, 31);
    [insertButton setTitle: @"insert"
                  forState: UIControlStateNormal];
    [insertButton setTitleColor:[UIColor blueColor]
                       forState:UIControlStateNormal];
    [self.view addSubview: insertButton];
    
    
    UITableView *taskTable = [[UITableView alloc] initWithFrame: CGRectMake(0, 80, 200, 300)
                       
                                                          style: UITableViewStylePlain];
    taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 创建新的单元格时，告诉UITableView对象要实例化哪个类
    [taskTable registerClass: [UITableViewCell class]
      forCellReuseIdentifier: @"Cell"];
    
    taskTable.dataSource = self;
    [self.view addSubview: taskTable];
    
    
    // 为按钮添加目标-动作对
    [insertButton addTarget: self
                     action: @selector(addTask:)
           forControlEvents: UIControlEventTouchUpInside];
    

}

- (void) addTask:(id)sender {
    NSLog(@"添加动作-目标对成功！");
    NSString *text = [self.view.subviews[2] text];
    
    if([text length] == 0) {
        return;
    }
    
    NSLog(@"task is going to be added is %@", text);
    
    // 将任务添加到tasks中去
    [self.tasks addObject: text];
    
    NSLog(@"%@", self.tasks);
    NSLog(@"%@", self.view.subviews[4]);
    
    // 刷新表格视图，显示新加入的任务
    [self.view.subviews[4] reloadData];
    
    [self.view.subviews[2] setText: @""];
    
    // 关闭键盘
    [self.view.subviews[2] resignFirstResponder];
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *c = [self.view.subviews[4] dequeueReusableCellWithIdentifier: @"Cell"];
    NSString *item = [self.tasks objectAtIndex: indexPath.row];
    c.textLabel.text = item;
    NSLog(@"%@", c);
    return c;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
