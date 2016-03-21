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

@interface ViewController ()
@property (nonatomic, strong) DemoSvc *svc;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DemoParam *param = [[DemoParam alloc] init];
    param.ID = 2;
    self.svc = [DemoSvc getDataWithParam:param cmpleted:^(APIResult *result, DemoModel *model) {
        if (result.isSucc) {
            NSLog(@"请求成功:%@", model);
        } else {
            NSLog(@"%@", result.msg);
        }
    }];
    
    
    
}
- (IBAction)buttonClick:(id)sender {
    //请求下一页
    [_svc loadNextPage];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
