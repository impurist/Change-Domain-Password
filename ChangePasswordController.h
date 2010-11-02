//
//  ChangePasswordController.h
//  Change Domain Password
//
//  Created by Steven Holloway on 1/11/10.
//  Copyright 2010 Agile Impetus. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ChangePasswordController : NSViewController <NSTextFieldDelegate>
{
  NSTextField *userName_;
  NSTextField *oldPassword_;
  NSTextField *newPassword_;
  NSTextField *newPasswordConfirmation_;
  NSTextField *domainServer_;
}

@property(nonatomic, retain) IBOutlet NSTextField *userName;
@property(nonatomic, retain) IBOutlet NSTextField *oldPassword;
@property(nonatomic, retain) IBOutlet NSTextField *newPassword;
@property(nonatomic, retain) IBOutlet NSTextField *newPasswordConfirmation;
@property(nonatomic, retain) IBOutlet NSTextField *domainServer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (IBAction)changePassword:(id)sender;

@end
