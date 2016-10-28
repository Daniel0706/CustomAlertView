//
//  ViewController.m
//  CustomAlertView
//
//  Created by CR-IOS on 16/7/25.
//  Copyright © 2016年 CR-IOS. All rights reserved.
//

#import "ViewController.h"
#import "ProfileAlertView.h"

@interface ViewController ()<confirmButtonClickDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *alertButton = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth - 200)/2, 100, 200, 80)];
    alertButton.backgroundColor = [UIColor redColor];
    [alertButton addTarget:self action:@selector(alertButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alertButton];
}
- (void) alertButtonClick{
    
    ProfileAlertView *alertView = [[ProfileAlertView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)withGroupNumber:10];
    alertView.delegate = self;
    alertView.backgroundColor = [UIColor colorWithRed:10.f/255 green:10.f/255 blue:10.f/255 alpha:0.7];
    [self.view.window addSubview:alertView];
}
- (void) confirmButtonDidCilckedIsSetChat:(BOOL) isChat {
    NSLog(@"%d",isChat);
}

@end
