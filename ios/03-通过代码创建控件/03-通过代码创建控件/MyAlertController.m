//
//  MyAlertController.m
//  03-通过代码创建控件
//
//  Created by 赵洪禹 on 16/2/22.
//  Copyright © 2016年 赵洪禹. All rights reserved.
//

#import "MyAlertController.h"

@interface MyAlertController ()

@end

@implementation MyAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)dealloc{
    NSLog(@"--MyAlertController---deloc");
}

@end
