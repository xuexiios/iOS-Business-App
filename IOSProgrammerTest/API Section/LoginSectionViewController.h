//
//  APISectionViewController.h
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginSectionViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>


@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)loginButton:(id)sender;

@end
