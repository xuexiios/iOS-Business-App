//
//  TableSectionTableViewCell.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "ChatCell.h"

@interface ChatCell ()

@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
@property (nonatomic, strong) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet UIImageView *employeeImageView;


@end

@implementation ChatCell

- (void)awakeFromNib
{
    // Initialization code
    
    
}

- (void)loadWithData:(ChatData *)chatData
{
    self.usernameLabel.text = chatData.username;
    self.messageTextView.text = chatData.message;
    self.employeeImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:chatData.avatar_url]]];
    
    self.employeeImageView.layer.masksToBounds = YES;
    self.employeeImageView.layer.cornerRadius = 42.0;
    self.employeeImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.employeeImageView.clipsToBounds = YES;
    
    CGSize itemSize = CGSizeMake(60, 60);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [self.employeeImageView.image drawInRect:imageRect];
    self.employeeImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}
@end
