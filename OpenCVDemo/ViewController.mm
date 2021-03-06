//
//  ViewController.m
//  OpenCVDemo
//
//  Created by Murphy Zheng on 17/8/23.
//  Copyright © 2017年 mieasy. All rights reserved.
//
#import "UIImage+OpenCV.h"
#import "ViewController.h"
#import "faceRecognition.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 灰度处理
    UIImage *image = [UIImage imageNamed:@"icon.jpg"];
    cv::Mat inputMat = [UIImage cvMatFromUIImage:image];
    cv::Mat greyMat;
    cv::cvtColor(inputMat, greyMat, CV_BGR2GRAY);
    //cv::Mat greyMat = [UIImage cvMatGrayFromUIImage:image];
    UIImage *greyImage = [UIImage imageWithCVMat:greyMat];
    self.imageView.image = greyImage;
    
    // 人脸识别
    UIImage *faceImage = [UIImage imageNamed:@"zhuxian.jpeg"];
    self.imageView.image = [faceRecognition faceDetectForImage:faceImage];
}

@end
