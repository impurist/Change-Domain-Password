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
  NSTask *task = [[NSTask alloc] init];
  NSPipe *pipeOut = [[NSPipe alloc] init];
  NSPipe *pipeIn = [[NSPipe alloc] init];
  
  NSFileHandle *readHandle = [pipeOut fileHandleForReading];
  NSData *inData = nil;
  
  
  [task setLaunchPath:@"/usr/bin/smbpasswd"];
  [task setArguments:[NSArray arrayWithObjects:[NSString stringWithFormat:@"-r %@", [[self domainServer] stringValue]],
                                               [NSString stringWithFormat:@"-U %@", [[self userName] stringValue]],
                                               nil]];
  [task setStandardOutput:pipeOut];
  [task setStandardInput:pipeIn];
  [task launch];
  
  NSString *response = @"";
  while ((inData = [readHandle availableData]) && [inData length])
  {
     NSLog(@"@%",[inData bytes]);
  }
  
  [pipeIn release];
  [pipeOut release];
  [task release];
}

@end
