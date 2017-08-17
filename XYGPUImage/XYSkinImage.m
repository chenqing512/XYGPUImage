//
//  XYSkinImage.m
//  XYGPUImage
//
//  Created by ChenQing on 17/8/17.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "XYSkinImage.h"

//定义宏用来获取ARGB分量值
#define Mask8(x) ((x) & 0xFF)
#define R(x) ( Mask8(x) )
#define G(x) ( Mask8(x >>8 ) )
#define B(x) ( Mask8(x >>16) )
#define A(x) ( Mask8(x >>24) )
#define RGBAMake(r, g, b, a) ( Mask8(r) | Mask8(g) << 8 | Mask8(b) << 16 | Mask8(a) << 24)

@implementation XYSkinImage

/**
 <#Description#>
 
 @param img <#img description#>
 @return <#return value description#>
 */
+(UIImage *)whiteImage:(UIImage *)img{
    int lumi = 10;
    //第一步：拿到图片
    CGImageRef imageRef = [img CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    
    //第二步：创建颜色空间
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    UInt32 * inputPixels = (UInt32*)calloc(width * height, sizeof(UInt32));
    
    //第三步：创建图片上下文
    CGContextRef contextRef =  CGBitmapContextCreate(inputPixels, width, height, 8, width * 4, colorSpaceRef, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    //第四步：绘制图片
    CGContextDrawImage(contextRef, CGRectMake(0, 0, width, height), imageRef);
    
    //第五步：对像素点进行修改
    for (int i = 0; i < height; i++)
    {
        for(int j = 0;j < width; j++)
        {
            UInt32 * currentPixels = inputPixels + i * width + j;
            
            UInt32 color = * currentPixels;
            UInt32 colorA,colorR,colorG,colorB;
            
            colorR = R(color);
            colorR = colorR + lumi;
            colorR = colorR > 255 ? 255 : colorR;
            
            colorG = G(color);
            colorG = colorG + lumi;
            colorG = colorG > 255 ? 255 : colorG;
            
            colorB = B(color);
            colorB = colorB + lumi;
            colorB = colorB > 255 ? 255 : colorB;
            
            colorA = A(color);
            *currentPixels = RGBAMake(colorR, colorG, colorB, colorA);
        }
    }
    
    //第六步：创建Image对象
    CGImageRef newImageRef = CGBitmapContextCreateImage(contextRef);
    UIImage * newImage = [UIImage imageWithCGImage:newImageRef];
    
    //第七步：释放内存
    CGColorSpaceRelease(colorSpaceRef);
    CGContextRelease(contextRef);
    CGImageRelease(newImageRef);
    free(inputPixels);
    return newImage;
}

@end
