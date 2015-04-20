//
//  MerDiscountsViewController.h
//  NB_list
//
//  Created by Eric Chang on 10/12/12.
//
//

#import <UIKit/UIKit.h>
#import "SendViewController.h"

@class SendViewController;


@interface MerDiscountsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate>{
    
    SendViewController *viewsend;
    
    NSMutableArray *ide;
    NSMutableArray *items;
    NSMutableArray *discounts;
    NSMutableArray *expirations;
    
    IBOutlet UITableView *tableView;
    
    UIImageView *imgv;
    
}

- (IBAction)next;

- (IBAction) Edit:(id)sender;
- (IBAction) newd;

- (IBAction) send;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@property (strong, nonatomic) SendViewController *viewsend;

@property (strong, nonatomic) UIImageView *imgv;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@property (nonatomic, retain) NSMutableArray *ide;
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) NSMutableArray *discounts;
@property (nonatomic, retain) NSMutableArray *expirations;

@end
