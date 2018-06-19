//
//  ViewController.h
//  opencvTest
//
//  Created by 梁杨晓 on 2018/6/18.
//  Copyright © 2018年 梁杨晓. All rights reserved.
//
#import <opencv2/highgui/cap_ios.h>
#include <opencv2/opencv.hpp>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) CvVideoCamera* videoCamera;
@property (strong, nonatomic) IBOutlet UIButton *button;

- (IBAction)actionStart:(id)sender;
@end
