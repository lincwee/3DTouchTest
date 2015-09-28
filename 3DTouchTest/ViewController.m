//
//  ViewController.m
//  3DTouchTest
//
//  Created by 郝 林巍 on 15/9/27.
//  Copyright © 2015年 lincwee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *touchParamLabel;
@property (nonatomic, strong) UIImageView *canvasView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.canvasView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.canvasView];
    
    self.touchParamLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 80.f, self.view.frame.size.width, 80.f)];
    self.touchParamLabel.textColor = [UIColor blackColor];
    self.touchParamLabel.textAlignment = NSTextAlignmentCenter;
    self.touchParamLabel.font = [UIFont systemFontOfSize:28.f];
    self.touchParamLabel.text = @"0";
    [self.canvasView addSubview:self.touchParamLabel];
    
    UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, 40.f)];
    clearButton.center = CGPointMake(self.touchParamLabel.center.x, self.view.frame.size.height - 150.f);
    [clearButton setTitle:@"清零" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    [clearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:clearButton];
}

-(void) clear{
    self.touchParamLabel.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    if ([touch respondsToSelector:@selector(force)]) {
        //返回的是按压指数
        self.touchParamLabel.text = [NSString stringWithFormat:@"%f", touch.force];
        [self setCanvasImageWithForce:touch.force];
    }
}

-(void) setCanvasImageWithForce:(CGFloat) force{
    if (force >= 0 && force <=0.66f) {
        self.canvasView.image = [UIImage imageNamed:@"test_1.png"];
    }
    if (force >= 0.67f && force <=1.66f) {
        self.canvasView.image = [UIImage imageNamed:@"test_2.png"];
    }
    if (force >= 1.67f && force <=2.66f) {
        self.canvasView.image = [UIImage imageNamed:@"test_3.png"];
    }
    if (force >= 2.67 && force <=3.66f) {
        self.canvasView.image = [UIImage imageNamed:@"test_4.png"];
    }
    if (force >= 3.67 && force <=4.66f) {
        self.canvasView.image = [UIImage imageNamed:@"test_5.png"];
    }
    if (force >= 4.67 && force <=5.66f) {
        self.canvasView.image = [UIImage imageNamed:@"test_6.png"];
    }
    if (force >= 5.67 && force <=6.67f) {
        self.canvasView.image = [UIImage imageNamed:@"test_7.png"];
    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.canvasView.image = [UIImage imageNamed:@"test_1.png"];
}

@end
