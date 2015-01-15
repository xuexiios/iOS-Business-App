//
//  APISectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "LoginSectionViewController.h"
#import "MainMenuViewController.h"
#import <AFNetworking.h>
#import <AFHTTPRequestOperationManager.h>
#import <AFURLRequestSerialization.h>
#import <AFURLResponseSerialization.h>

@interface LoginSectionViewController ()

@end

@implementation LoginSectionViewController{
    NSMutableData *receivedData_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //taking keyboard away 
    [self. usernameTextField resignFirstResponder];
    [self. passwordTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //Taking keyboard away by touching anywhere on the screen
    [self.view endEditing:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    //taking keyboard away by pressing return on keyboard on the both text field
    [textField resignFirstResponder];
    [textField resignFirstResponder];
    return YES;
    
}

- (NSData*)encodeDictionary:(NSDictionary*)dictionary {
    NSMutableArray *parts = [[NSMutableArray alloc] init];
    for (NSString *key in dictionary) {
        NSString *encodedValue = [[dictionary objectForKey:key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *encodedKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *part = [NSString stringWithFormat: @"%@=%@", encodedKey, encodedValue];
        [parts addObject:part];
    }
    NSString *encodedDictionary = [parts componentsJoinedByString:@"&"];
    return [encodedDictionary dataUsingEncoding:NSUTF8StringEncoding];
}


- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (IBAction)loginButton:(id)sender
{
    NSDate *methodStart = [NSDate date];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"SuperBoise": self.usernameTextField.text, @"qwerty": self.passwordTextField.text};
    
    NSLog(@"Debugging Purpose - 1");
    
    [manager POST:@"http://dev.apppartner.com/AppPartnerProgrammerTest/scripts/login.php" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %f", executionTime);
        
        NSString *alertMessage = [NSString stringWithFormat:@"Thank you for Loging In. The execution time was %f miliseconds. Please click on Okay to get redirected to the MainViewController", executionTime];
        UIAlertView *successAlert = [[UIAlertView alloc]initWithTitle:@"Login Successful!" message:alertMessage delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [successAlert show];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSString *message = [NSString stringWithFormat:@"Error: %@, Please try again!", error];
        UIAlertView *failedAlert = [[UIAlertView alloc]initWithTitle:@"Login Failed!" message:message delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [failedAlert show];

    }];
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSLog(@"Debugging Purpose - 2");

    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *happyAlert = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([happyAlert isEqualToString:@"Okay"]){
        MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
        [self.navigationController pushViewController:mainMenuViewController animated:YES]; }
}


@end
