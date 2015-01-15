//
//  AnimationSectionViewController.h
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationSectionViewController : UIViewController <UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *textView;




- (IBAction)spinButton:(id)sender;



@end
