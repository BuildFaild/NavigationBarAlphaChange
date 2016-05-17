//
//  UIViewController+Extention.m
//  acxw_Client
//
//  Created by 袁国文 on 16/5/14.
//  Copyright © 2016年. All rights reserved.
//

#import "UIViewController+Extention.h"
#import "NavigationController.h"
#import <objc/runtime.h>
#import <sys/sysctl.h>

@interface UIViewController ()
/** <#注释#> */
@property(weak, nonatomic) UIScrollView *keyScrollView;
/** <#注释#> */
@property(assign, nonatomic) CGFloat offsetY;
@end

@implementation UIViewController (Extention)
static const char *scrollKey;
- (void)setKeyScrollView:(UIScrollView *)keyScrollView {
    objc_setAssociatedObject(self, &scrollKey, keyScrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIScrollView *)keyScrollView {
    return objc_getAssociatedObject(self, &scrollKey);
}


static const char * navBarBackgroundImageKey = "navBarBackgroundImage";
- (UIImage *)navBarBackgroundImage{
    return objc_getAssociatedObject(self, navBarBackgroundImageKey);
}

- (void)setNavBarBackgroundImage:(UIImage *)navBarBackgroundImage{
    objc_setAssociatedObject(self, navBarBackgroundImageKey, navBarBackgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)setNavgationBarAlpha:(CGFloat)alpha {
    [self my_NavigationController].barAlpha = alpha;
}

- (NavigationController *)my_NavigationController {
    return (NavigationController *)self.navigationController;
}

- (void)changeNavitionBarAlphaForContenOffsetWithScrollView:(UIScrollView *)scrollView {
    self.keyScrollView = scrollView;
    [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    CGFloat alpha = 0;
    CGFloat contentOffsetY = self.keyScrollView.contentOffset.y;
    if (contentOffsetY < 0) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    alpha = MAX(0, contentOffsetY/100);
    [self setNavgationBarAlpha:alpha];
}

- (void)setInViewWillAppear {
    [self my_NavigationController].barTintColor = [UIColor redColor];
    [self my_NavigationController].barAlpha = 0;

}
- (void)setInViewWillDisappear {
    [self my_NavigationController].barTintColor = [UIColor yellowColor];
    [self my_NavigationController].barAlpha = 1;
}



@end
