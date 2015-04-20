//
//  SignUpViewController.h
//  NB_list
//
//  Created by Eric Chang on 10/13/12.
//
//

#import <UIKit/UIKit.h>
#import "Customer2ViewController.h"

@class Customer2ViewController;

@interface SignUpViewController : UIViewController{
    Customer2ViewController *viewcus;
    
    IBOutlet UITextField *user;
    IBOutlet UITextField *pass;
}

@property (nonatomic, retain) Customer2ViewController *viewcus;

@property (nonatomic, retain) IBOutlet UITextField *user;
@property (nonatomic, retain) IBOutlet UITextField *pass;

-(IBAction)connect;

@end
