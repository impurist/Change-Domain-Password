//
//  ChangePasswordController.m
//  Change Domain Password
//
//  Created by Steven Holloway on 1/11/10.
//  Copyright 2010 Agile Impetus. All rights reserved.
//

#import "ChangePasswordController.h"


@implementation ChangePasswordController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
{
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
  {
    [[self userName] setDelegate:self];
    [[self oldPassword] setDelegate:self];
    [[self newPassword] setDelegate:self];
    [[self newPasswordConfirmation] setDelegate:self];
    [[self domainServer] setDelegate:self];
    [[self domainServer] setStringValue:@"win.int.realestate.com.au"];
  }
  
  return self;
}

- (void)dealloc;
{
  [userName_ release];
  [oldPassword_ release];
  [newPassword_ release];
  [newPasswordConfirmation_ release];  
  [domainServer_ release];
  [super dealloc];
}

#pragma mark -
#pragma mark Properties

@synthesize userName = userName_;
@synthesize oldPassword = oldPassword_;
@synthesize newPassword = newPassword_;
@synthesize newPasswordConfirmation = newPasswordConfirmation_;
@synthesize domainServer = domainServer_;

#pragma mark -
#pragma mark Actions

- (IBAction)changePassword:(id)sender;
{  

}

@end
