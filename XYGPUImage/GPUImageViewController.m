//
//  GPUImageViewController.m
//  XYGPUImage
//
//  Created by ChenQing on 17/8/17.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "GPUImageViewController.h"
#import "XYFilterImage.h"

#define MainWidth self.view.frame.size.width

@interface GPUImageViewController ()

@property (nonatomic,strong) NSArray *mDataArray;

@property (nonatomic,strong) UIImageView *logoImgView;

@end


@implementation GPUImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logoImgView.image=[UIImage imageNamed:@"logo"];
    
    for(int i=0;i<self.mDataArray.count;i++){
        CGFloat buttonWidth=(MainWidth-80-60)/3;
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake((buttonWidth+30)*(i%3)+40, CGRectGetMaxY(_logoImgView.frame)+50+(40+30)*(i/3), buttonWidth, 40);
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:self.mDataArray[i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:15] ;
        button.backgroundColor=[UIColor grayColor] ;
        button.tag=1000+i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}

-(void)buttonClick:(UIButton *)btn{
    switch (btn.tag) {
        case 1000://原图
        {
            self.logoImgView.image=[UIImage imageNamed:@"logo"];
        }
            break;
        case 1001://素描
        {
            self.logoImgView.image=[XYFilterImage sketchFilterImage:[UIImage imageNamed:@"logo"]];
        }
            break;
        case 1002://红色
        {
            self.logoImgView.image=[XYFilterImage redFilterImage:[UIImage imageNamed:@"logo"]];
        }
            break;
        case 1003://蓝色
        {
            self.logoImgView.image=[XYFilterImage sketchFilterImage:[UIImage imageNamed:@"logo"]];
        }
            break;
        case 1004://绿色
        {
            self.logoImgView.image=[XYFilterImage sketchFilterImage:[UIImage imageNamed:@"logo"]];
        }
            break;
        case 1005://怀旧
        {
            self.logoImgView.image=[XYFilterImage sepiaFilterImage:[UIImage imageNamed:@"logo"]];
        }
            break;
        case 1006://朦胧
        {
            self.logoImgView.image=[XYFilterImage sketchFilterImage:[UIImage imageNamed:@"logo"]];
        }
            break;
        case 1007://饱和
        {
            self.logoImgView.image=[XYFilterImage sketchFilterImage:[UIImage imageNamed:@"logo"]];
        }
            break;
        case 1008://亮度
        {
            self.logoImgView.image=[XYFilterImage sketchFilterImage:[UIImage imageNamed:@"logo"]];
        }
            break;
        case 1009://曝光度
        {
            self.logoImgView.image=[XYFilterImage sketchFilterImage:[UIImage imageNamed:@"logo"]];
        }
            break;
        default:
            break;
    }
    
}

-(NSArray *)mDataArray{
    if (!_mDataArray) {
        _mDataArray=@[@"原图",@"素描",@"红色",@"蓝色",@"绿色",@"怀旧",@"朦胧",@"饱和",@"亮度",@"曝光度"];
    }
    return _mDataArray;
}

-(UIImageView *)logoImgView{
    if (!_logoImgView) {
        _logoImgView=[[UIImageView alloc]initWithFrame:CGRectMake((MainWidth-208)/2, 70, 208, 280)];
        [self.view addSubview:_logoImgView];
    }
    return _logoImgView;
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
