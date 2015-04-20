//
//  Signup2ViewController.h
//  NB_list
//
//  Created by Shiyang Liu on 10/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"

@class TPKeyboardAvoidingScrollView;
@class MenuViewController;


@interface Signup2ViewController : UIViewController{
    
    MenuViewController *viewmenu;
    
    IBOutlet UITextField *user;
    IBOutlet UITextField *pass;
    IBOutlet UITextField *email;
    IBOutlet UITextField *passcon;
}

@property (nonatomic, retain) MenuViewController *viewmenu;

@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *scrollView;

@property (nonatomic, retain) IBOutlet UITextField *user;
@property (nonatomic, retain) IBOutlet UITextField *pass;
@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *passcon;

-(IBAction)connect;

@end
