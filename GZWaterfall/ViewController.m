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
#import "WaterFallController.h"
#import "CircleViewController.h"
#import "PickViewController.h"
#import "BallViewController.h"

#define random(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"GangZi瀑布流";
    [self setFirstButton];

}

-(void)setFirstButton{
    UIButton *FirstBUtton = [[UIButton alloc]initWithFrame:CGRectMake(100, 80, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:FirstBUtton];
    FirstBUtton.tag = 100 ;
    FirstBUtton.backgroundColor = randomColor;
    [FirstBUtton setTitle:@"随机瀑布流" forState:UIControlStateNormal];
    [FirstBUtton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *SecondButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:SecondButton];
    SecondButton.tag = 101 ;
    SecondButton.backgroundColor = randomColor;
    [SecondButton setTitle:@"规则瀑布流" forState:UIControlStateNormal];
    [SecondButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *ThreeBUtton = [[UIButton alloc]initWithFrame:CGRectMake(100, 220, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:ThreeBUtton];
    ThreeBUtton.tag = 102 ;
    ThreeBUtton.backgroundColor = randomColor;
    [ThreeBUtton setTitle:@"简单两排瀑布流" forState:UIControlStateNormal];
    [ThreeBUtton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *fourBUtton = [[UIButton alloc]initWithFrame:CGRectMake(100, 290, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:fourBUtton];
    fourBUtton.tag = 103 ;
    fourBUtton.backgroundColor = randomColor;
    [fourBUtton setTitle:@"两排瀑布流" forState:UIControlStateNormal];
    [fourBUtton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *fiveButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 360, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:fiveButton];
    fiveButton.tag = 104 ;
    fiveButton.backgroundColor = randomColor;
    [fiveButton setTitle:@"环形瀑布流" forState:UIControlStateNormal];
    [fiveButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *SixButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 420, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:SixButton];
    SixButton.tag = 105 ;
    SixButton.backgroundColor = randomColor;
    [SixButton setTitle:@"立方形瀑布流" forState:UIControlStateNormal];
    [SixButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *sevenButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 490, self.view.bounds.size.width - 200, 40)];
    [self.view addSubview:sevenButton];
    sevenButton.tag = 106 ;
    sevenButton.backgroundColor = randomColor;
    [sevenButton setTitle:@"球形瀑布流" forState:UIControlStateNormal];
    [sevenButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)ButtonClick:(UIButton *)sender{
    if (sender.tag == 100) {
        GZFistViewController *GZ = [[GZFistViewController alloc]init];
        [self.navigationController pushViewController:GZ animated:YES];
    }else if (sender.tag == 101){
        GZViewController *GZ = [[GZViewController alloc]init];
        [self.navigationController pushViewController:GZ animated:YES];
    }else if (sender.tag == 102){
        GZThreeViewController *GZ = [[GZThreeViewController alloc]init];
        [self.navigationController pushViewController:GZ animated:YES];
    }else if (sender.tag == 103){
        WaterFallController * WVC  = [[WaterFallController alloc]init];
        [self.navigationController pushViewController:WVC animated:YES];
        
    }else if(sender.tag == 104){
        CircleViewController * CirVC = [[CircleViewController alloc]init];
        [self.navigationController pushViewController:CirVC animated:YES];
        
    }else if(sender.tag == 105){
        
        PickViewController * PVC = [[PickViewController alloc]init];
        [self.navigationController pushViewController:PVC animated:YES];
        
    }else{
        BallViewController * BVC =[[BallViewController alloc]init];
        [self.navigationController pushViewController:BVC animated:YES];
        
    }
}


@end
