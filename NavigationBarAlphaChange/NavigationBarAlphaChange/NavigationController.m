//
//  NavigationController.m
//  NavigationBarAlphaChange
//
//  Created by 袁国文 on 16/5/17.
//  Copyright © 2016年 YG.wen. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()
/** <#注释#> */
@property(strong, nonatomic) UIImage *backgroundImg;

/** <#注释#> */
@property(strong, nonatomic) UIView *backgroundView;
@end

@implementation NavigationController

- (UIImage *)backgroundImg {
    if (!_backgroundImg) {
        _backgroundImg = [UIImage imageNamed:@"bigShadow"];
        [self.navigationBar setBackgroundImage: _backgroundImg forBarMetrics: UIBarMetricsCompact];
        self.navigationBar.layer.masksToBounds = YES;
    }
    return _backgroundImg;
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        CGRect frame = self.navigationBar.frame;
        frame.size.height += CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
        _backgroundView = [[UIView alloc] initWithFrame: frame];
        _backgroundView.backgroundColor = self.barTintColor;
    }
    return _backgroundView;
}


- (void)setBarTintColor:(UIColor *)barTintColor {
    _barTintColor = barTintColor;
    _backgroundView.backgroundColor = _barTintColor;
}

- (void)setBarAlpha:(CGFloat)barAlpha {
    _barAlpha = barAlpha;
    _backgroundView.alpha = _barAlpha;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController: rootViewController]) {
        if (self.backgroundImg) {  }
        [self.view insertSubview: self.backgroundView belowSubview: self.navigationBar];
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    return self;
    
}

- (void)awakeFromNib {
    if (self.backgroundImg) {  }
    [self.view insertSubview: self.backgroundView belowSubview: self.navigationBar];
    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barTintColor = [UIColor redColor];
    self.barAlpha = 1;
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

@end
