//
//  UIImage+Color.h
//  NavigationBarAlphaChange
//
//  Created by 袁国文 on 16/5/17.
//  Copyright © 2016年 YG.wen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
/**
 *  根据颜色生成图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
