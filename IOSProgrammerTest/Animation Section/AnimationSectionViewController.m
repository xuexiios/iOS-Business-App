//
//  AnimationSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "AnimationSectionViewController.h"
#import "MainMenuViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface AnimationSectionViewController ()

@end

@implementation AnimationSectionViewController

- (void)viewDidLoad
{
    //setting up the icon image that will spin around the view
    self.imageView.image = [UIImage imageNamed:@"icon_apppartner.png"];
    [self.view addSubview: self.imageView];
    
    [super viewDidLoad];
    
    self.imageView.userInteractionEnabled = YES;
    //[_textView.layer setBackgroundColor: [[UIColor clearColor] CGColor]];
    [_textView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [_textView.layer setBorderWidth: 1.0];
    [_textView.layer setCornerRadius:8.0f];
    [_textView.layer setMasksToBounds:YES];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //touching the screen to take the icon at different part of the screen
    UITouch *touch = [[event allTouches]anyObject];
    CGPoint location = [touch locationInView:touch.view];
    _imageView.center = location;
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //moving the icon where touched
    [self touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}



- (IBAction)spinButton:(id)sender {
    
    //making the image spin
    CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0];
    fullRotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
    fullRotation.duration = 6;
    fullRotation.repeatCount = 1e10f;
    fullRotation.delegate = self;
    [_imageView.layer addAnimation:fullRotation forKey:@"360"];
    [_imageView.layer setSpeed:3.0];
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


@end
