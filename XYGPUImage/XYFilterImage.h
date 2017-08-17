//
//  XYFilterImage.h
//  XYGPUImage
//
//  Created by ChenQing on 17/8/17.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYFilterImage : UIImage

/**
 创建素面滤镜效果
 
 @param img 原始图片
 @return 返回后的图片
 */
+(UIImage *)sketchFilterImage:(UIImage *)img;

/**
 创建泛红滤镜效果

 @param img <#img description#>
 @return <#return value description#>
 */
+(UIImage *)redFilterImage:(UIImage *)img;


/**
 设置怀旧风格

 @param img <#img description#>
 @return <#return value description#>
 */
+(UIImage *)sepiaFilterImage:(UIImage *)img;

@end
