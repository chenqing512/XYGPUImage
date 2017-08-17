//
//  XYFilterImage.m
//  XYGPUImage
//
//  Created by ChenQing on 17/8/17.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "XYFilterImage.h"
#import "GPUImage.h"

@implementation XYFilterImage


/**
 创建素面滤镜效果

 @param img 原始图片
 @return 返回后的图片
 */
+(UIImage *)sketchFilterImage:(UIImage *)img{
    //使用黑白素描滤镜
    GPUImageSketchFilter *disFilter=[[GPUImageSketchFilter alloc]init];
    //设置需要渲染的区域
    [disFilter forceProcessingAtSize:img.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource=[[GPUImagePicture alloc]initWithImage:img];
    //添加滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //渲染后的图片
    UIImage *newImage=[disFilter imageFromCurrentFramebuffer];
    
    return newImage;
}

/**
 创建泛红滤镜效果

 @param img <#img description#>
 @return <#return value description#>
 */
+(UIImage *)redFilterImage:(UIImage *)img{
    //设置滤镜
    GPUImageRGBFilter *disFilter=[[GPUImageRGBFilter alloc]init];
    disFilter.red=0.9;
    disFilter.green=0.8;
    disFilter.blue=0.9;
    //设置需要渲染的取悦
    [disFilter forceProcessingAtSize:img.size];
    [disFilter useNextFrameForImageCapture];
    //获取书数据源
    GPUImagePicture *stillImageSource=[[GPUImagePicture alloc]initWithImage:img];
    //添加滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    UIImage *newImage=[disFilter imageFromCurrentFramebuffer];
    return newImage;
}

/**
 设置怀旧风格
 
 @param img <#img description#>
 @return <#return value description#>
 */
+(UIImage *)sepiaFilterImage:(UIImage *)img{
    //设置滤镜
    GPUImageSepiaFilter *disFilter=[[GPUImageSepiaFilter alloc]init];
    //设置渲染区域
    [disFilter forceProcessingAtSize:img.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource=[[GPUImagePicture alloc]initWithImage:img];
    //添加滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    UIImage *newImage=[disFilter imageFromCurrentFramebuffer];
    return newImage;
}

@end
