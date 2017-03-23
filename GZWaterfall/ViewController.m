//
//  ViewController.m
//  GZWaterfalls
//
//  Created by xinshijie on 17/3/21.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "ViewController.h"
#import "GZViewController.h"
#import "GZFistViewController.h"
#import "GZThreeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"test";
    [self setFirstButton];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setFirstButton{
    UIButton *FirstBUtton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:FirstBUtton];
    FirstBUtton.backgroundColor = [UIColor orangeColor];
    [FirstBUtton setTitle:@"随机瀑布流" forState:UIControlStateNormal];
    [FirstBUtton addTarget:self action:@selector(FirstButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *SecondButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:SecondButton];
    SecondButton.backgroundColor = [UIColor greenColor];
    [SecondButton setTitle:@"规则瀑布流" forState:UIControlStateNormal];
    [SecondButton addTarget:self action:@selector(SecondButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *ThreeBUtton = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:ThreeBUtton];
    ThreeBUtton.backgroundColor = [UIColor orangeColor];
    [ThreeBUtton setTitle:@"简单两排瀑布流" forState:UIControlStateNormal];
    [ThreeBUtton addTarget:self action:@selector(ThreeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)FirstButtonClick{
    GZFistViewController *GZ = [[GZFistViewController alloc]init];
    [self.navigationController pushViewController:GZ animated:YES];
}

-(void)SecondButtonClick{
    GZViewController *GZ = [[GZViewController alloc]init];
    [self.navigationController pushViewController:GZ animated:YES];
}

-(void)ThreeButtonClick{
    GZThreeViewController *GZ = [[GZThreeViewController alloc]init];
    [self.navigationController pushViewController:GZ animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
