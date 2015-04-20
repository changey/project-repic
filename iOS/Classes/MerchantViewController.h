//
//  MerchantViewController.h
//  NB_list
//
//  Created by Eric Chang on 10/9/12.
//
//

#import <UIKit/UIKit.h>
#import "TDDatePickerController.h"
#import "MerDiscountsViewController.h"

@class MerDiscountsViewController;

@interface MerchantViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>{

    
    MerDiscountsViewController *viewmer;
    
    IBOutlet UITextField *item;
    IBOutlet UITextField *discount;
    IBOutlet UILabel *expiration;
    
    IBOutlet TDDatePickerController* datePickerView;
    
    NSString *merchant_id;
    NSString *message;
    
    NSDate* selectedDate;
}

@property (nonatomic, retain) MerDiscountsViewController *viewmer;

@property (nonatomic, retain)  NSString *message;
@property (nonatomic, retain) NSString *merchant_id;

@property (nonatomic, retain) IBOutlet UITextField *item;
@property (nonatomic, retain) IBOutlet UITextField *discount;
@property (nonatomic, retain) IBOutlet UILabel *expiration;


- (IBAction) frequent;

- (IBAction)send:(id)sender;
- (IBAction)promotions;

- (IBAction)cancel;

-(IBAction)menu;

-(IBAction)promo;


@end
