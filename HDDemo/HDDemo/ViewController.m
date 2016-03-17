//
//  ViewController.m
//  HDDemo
//
//  Created by 张达棣 on 15/3/20.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "ViewController.h"
#import <HDCore/HDCore.h>
#import <HDServices/HDServices.h>


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [DemoSvc getDateWithCOmpleted:^(APIResult *result, NSString *date) {
        
    }];
    
    HDDemoModel *a = [[HDDemoModel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
