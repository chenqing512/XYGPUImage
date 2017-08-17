//
//  SkinImageViewController.m
//  XYGPUImage
//
//  Created by ChenQing on 17/8/17.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "SkinImageViewController.h"
#import "XYSkinImage.h"

#define MainWidth self.view.frame.size.width

@interface SkinImageViewController ()

@property (nonatomic,strong) UIImageView *logoImgView;

@end

@implementation SkinImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logoImgView.image=[UIImage imageNamed:@"logo"];
    // Do any additional setup after loading the view.
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _logoImgView.image=[XYSkinImage whiteImage:_logoImgView.image];
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
