//
//  ViewController.m
//  ReactiveCocoa-Demo
//
//  Created by 王泽龙 on 2019/7/24.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController1.h"
#import "TestViewController2.h"
#import "TestViewController3.h"
#import "TestViewController4.h"
#import "TestViewController5.h"
#import "TestViewController6.h"
#import "TestViewController7.h"
#import "TestViewController8.h"
#import "TestViewController9.h"
#import "TestViewController10.h"
#import "TestViewController11.h"
#import "TestViewController12.h"
#import "TestViewController13.h"
#import "TestViewController14.h"
#import "TestViewController15.h"
#import "TestViewController16.h"
#import "TestViewController17.h"
#import "TestViewController18.h"
#import "TestViewController19.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RAC";
    self.view.backgroundColor = [UIColor whiteColor];
}

/**
 RACSignal
 */
- (IBAction)racsignal:(id)sender {
    [self.navigationController pushViewController:[TestViewController1 new] animated:YES];
}


/**
 RACSubject RACReplaySubject
 */
- (IBAction)racsubjectAndrepalySubject:(id)sender {
    [self.navigationController pushViewController:[TestViewController2 new] animated:YES];
}


/**
 RACSubject替换代理
 */
- (IBAction)delegate:(id)sender {
    [self.navigationController pushViewController:[TestViewController3 new] animated:YES];
}


/**
 RAC集合
 */
- (IBAction)racGather:(id)sender {
    [self.navigationController pushViewController:[TestViewController4 new] animated:YES];
}


/**
 RACMulticastConnection使用
 */
- (IBAction)racMulticastConnection1:(id)sender {
    [self.navigationController pushViewController:[TestViewController5 new] animated:YES];
}

/**
 RACMulticastConnection原理
 */
- (IBAction)racmulticastConnection2:(id)sender {
    [self.navigationController pushViewController:[TestViewController6 new] animated:YES];
}

/**
 RACCommand使用
 */
- (IBAction)raccommond1:(id)sender {
    [self.navigationController pushViewController:[TestViewController7 new] animated:YES];
}

/**
 RACCommand原理
 */
- (IBAction)raccommond2:(id)sender {
    [self.navigationController pushViewController:[TestViewController8 new] animated:YES];
}

/**
 RACCommand(场景)
 */
- (IBAction)raccommond3:(id)sender {
    [self.navigationController pushViewController:[TestViewController9 new] animated:YES];
}

/**
 rac_signalForSelector
 */
- (IBAction)rac_signal:(id)sender {
    UIStoryboard *czsb = [UIStoryboard storyboardWithName:@"TestViewController10" bundle:nil];
    TestViewController10 *test10 = [czsb instantiateViewControllerWithIdentifier:@"TestViewController10"];
    [self.navigationController pushViewController:test10 animated:YES];
}

/**
 kvo
 */
- (IBAction)kvo:(id)sender {
    UIStoryboard *czsb = [UIStoryboard storyboardWithName:@"TestViewController11" bundle:nil];
    TestViewController11 *test11 = [czsb instantiateViewControllerWithIdentifier:@"TestViewController11"];
    [self.navigationController pushViewController:test11 animated:YES];
}

/**
 监听事件
 */
- (IBAction)event:(id)sender {
    [self.navigationController pushViewController:[TestViewController12 new] animated:YES];
}

/**
 RAC(通知)
 */
- (IBAction)notification:(id)sender {
    [self.navigationController pushViewController:[TestViewController13 new] animated:YES];
}

/**
 RAC(绑定信号)
 */
- (IBAction)bindSignal:(id)sender {
    [self.navigationController pushViewController:[TestViewController14 new] animated:YES];
}

/**
 liftSelector
 */
- (IBAction)liftSelector:(id)sender {
    [self.navigationController pushViewController:[TestViewController15 new] animated:YES];
}

/**
 框架思想
 */
- (IBAction)mind:(id)sender {
    [self.navigationController pushViewController:[TestViewController16 new] animated:YES];
}

/**
 RAC+MVVM(封装请求)
 */
- (IBAction)MVVM1:(id)sender {
    [self.navigationController pushViewController:[TestViewController17 new] animated:YES];
}

/**
 RAC+MVVM(抽控制器)
 */
- (IBAction)Mvvm2:(id)sender {
    [self.navigationController pushViewController:[TestViewController18 new] animated:YES];
}

/**
 RAC+MVVM(抽取View)
 */
- (IBAction)mvvm3:(id)sender {
    [self.navigationController pushViewController:[TestViewController19 new] animated:YES];
}

@end
