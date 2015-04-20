//
//  AddfriendViewController.h
//  NB_list
//
//  Created by Eric Chang on 7/1/13.
//
//

#import <UIKit/UIKit.h>

@interface AddfriendViewController : UIViewController{
    IBOutlet UITextField *txtf;
}

@property (retain, nonatomic) IBOutlet UITextField *txtf;

- (IBAction)add;

@end
