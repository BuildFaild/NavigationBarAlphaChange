//
//  NavigationController.h
//  NavigationBarAlphaChange
//
//  Created by 袁国文 on 16/5/17.
//  Copyright © 2016年 YG.wen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationController : UINavigationController
/** <#注释#> */
@property(assign, nonatomic) CGFloat barAlpha;
/** <#注释#> */
@property(strong, nonatomic) UIColor *barTintColor;
@end
