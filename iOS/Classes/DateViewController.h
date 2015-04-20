//
//  DateViewController.h
//  NB_list
//
//  Created by Eric Chang on 6/30/13.
//
//

#import <UIKit/UIKit.h>
#import "InboxViewController.h"

@class InboxViewController;

@interface DateViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UITableView *tableView;
    
    InboxViewController *viewinbox;
    
    NSDate* selectedDate;
    
    NSString *url;
}

- (IBAction) Done:(id)sender;

@property(nonatomic,retain) NSString *url;

@property(nonatomic,retain) InboxViewController *viewinbox;

@property(nonatomic,retain) IBOutlet UITableView *tableView;

@property(nonatomic,retain) UIDatePicker *datePicker;
-(IBAction)buttonPressed:(id)sender;

-(IBAction)send;

@end
