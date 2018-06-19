//
//  ViewController.m
//  opencvTest
//
//  Created by 梁杨晓 on 2018/6/18.
//  Copyright © 2018年 梁杨晓. All rights reserved.
//
#import <opencv2/opencv.hpp>
#import <opencv2/highgui/cap_ios.h>// highgui：一个简单易用的接口，提供视频捕捉、图像和视频编码等功能
#import "ViewController.h"

//@interface ViewController ()
//
//@end

@interface ViewController ()<CvVideoCameraDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.imageView.layer.borderWidth = 1;
    
    
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:self.imageView];
    self.videoCamera.delegate = self;//设置代理
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;//用背面摄像头
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288; //截取图片大小
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;//竖屏
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)processImage:(cv::Mat&)image {
    cv::Mat gray;
    cvtColor(image, gray, CV_RGB2GRAY);
    GaussianBlur(gray, gray, cv::Size(5,5), 1.2,1.2);
    cv::Mat edges;
    Canny(gray,edges,0,50);
    image.setTo(cv::Scalar::all(255));
    image.setTo(cv::Scalar(0,128,255,255),edges);
}

- (IBAction)actionStart:(id)sender;
{
    [self.videoCamera start];  //开启摄像头
}

@end
