//
//  ViewController.m
//  RolationAnimation
//
//  Created by littlewish on 2017/5/12.
//  Copyright © 2017年 littlewish. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn2.layer.anchorPoint = CGPointMake(0.3, 0.3);
    [self animation:self.btn1];
    
    self.btn2.layer.anchorPoint = CGPointMake(0.5, 0);
    
    CGRect rect = self.btn2.frame;
    rect.origin.y = (self.view.bounds.size.height - rect.size.height)/2;
    
    self.btn2.frame = rect;
    
    [self animation:self.btn2];
    
    
    self.btn3.layer.anchorPoint = CGPointMake(1, 1);
    
    rect = self.btn3.frame;
    rect.origin.y = (self.view.bounds.size.height - rect.size.height)/2 + 200;
    rect.origin.x = (self.view.bounds.size.width - rect.size.width)/2;
    self.btn3.frame = rect;
    
    [self animation:self.btn3];
    
    [self logFrame:self.btn1];
    [self logFrame:self.btn2];
    [self logFrame:self.btn3];
    
    
    UILabel *btn1RealyFrameLabel = [[UILabel alloc] initWithFrame:self.btn1.frame];
    btn1RealyFrameLabel.backgroundColor = [UIColor blueColor];
    btn1RealyFrameLabel.text = @"btn1frame";
    [self.view addSubview:btn1RealyFrameLabel];
    
    UILabel *btn2RealyFrameLabel = [[UILabel alloc] initWithFrame:self.btn2.frame];
    btn2RealyFrameLabel.backgroundColor = [UIColor blueColor];
    btn2RealyFrameLabel.text = @"btn2frame";
    [self.view addSubview:btn2RealyFrameLabel];
    
    
    UILabel *btn3RealyFrameLabel = [[UILabel alloc] initWithFrame:self.btn3.frame];
    btn3RealyFrameLabel.backgroundColor = [UIColor blueColor];
    btn3RealyFrameLabel.text = @"btn3frame";
    [self.view addSubview:btn3RealyFrameLabel];
    
    [self.view bringSubviewToFront:self.btn1];
    [self.view bringSubviewToFront:self.btn2];
    [self.view bringSubviewToFront:self.btn3];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the touch point
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //check if we've tapped the moving layer
    if ([self.btn1.layer.presentationLayer hitTest:point]) {
        NSLog(@"touch in btn1");
    }else if ([self.btn2.layer.presentationLayer hitTest:point]){
        NSLog(@"touch in btn2");
    }else if ([self.btn3.layer.presentationLayer hitTest:point]){
        NSLog(@"touch in btn3");
    }
}

- (void)logFrame:(UIView *)view{
    NSLog(@"%p frame : %@",view,NSStringFromCGRect(view.frame));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)animation:(UIView *)view{
    // 创建一个基础动画
     CABasicAnimation *animation = [CABasicAnimation new];
     // 设置动画要改变的属性
     animation.keyPath = @"transform.rotation.z";
     //animation.fromValue = @(_bgImgV.layer.transform.m11);
     // 动画的最终属性的值（转7.5圈）
     animation.toValue = @(M_PI*50);
     // 动画的播放时间
     animation.duration = 60;
     // 动画效果慢进慢出
     animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
     // 解决动画结束后回到原始状态的问题
     animation.removedOnCompletion = NO;
     animation.fillMode = kCAFillModeForwards;
    // 将动画添加到视图bgImgV的layer上
     [view.layer addAnimation:animation forKey:@"rotation"];
}

- (IBAction)action1:(id)sender {
    NSLog(@"action 1");
}

- (IBAction)action2:(id)sender {
    NSLog(@"action 2");
}

- (IBAction)action3:(id)sender {
    NSLog(@"action 3");
}

@end
