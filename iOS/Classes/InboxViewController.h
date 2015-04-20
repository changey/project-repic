//
//  InboxViewController.h
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import <UIKit/UIKit.h>
#import "ImageViewController.h"
#import "DetailViewController.h"
#import "MenuViewController.h"

@class ImageViewController;
@class DetailViewController;
@class MenuViewController;

@interface InboxViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    
    MenuViewController *viewmenu;
    
    DetailViewController *viewdet;
    
    ImageViewController *viewimage;
    
    NSString *sent;
    
    UIImage *btnImage;
    
    NSMutableArray *senders;
    NSMutableArray *times;
    NSMutableArray *urls;
    NSMutableArray *captions;
    
    IBOutlet UITableView *tableView;
    
    NSString *messages_number;
    NSString *receiver_number;
    
}

- (IBAction) Back:(id)sender;

@property (retain, nonatomic) MenuViewController *viewmenu;

@property (retain, nonatomic) NSString *messages_number;
@property (retain, nonatomic) NSString *receiver_number;

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (retain, nonatomic)NSMutableArray *senders;
@property (retain, nonatomic)NSMutableArray *times;
@property (retain, nonatomic)NSMutableArray *urls;
@property (retain, nonatomic)NSMutableArray *captions;

@property (retain, nonatomic) DetailViewController *viewdet;

@property (retain, nonatomic) UIImage *btnImage;

@property (retain, nonatomic) NSString *sent;
@property (retain, nonatomic) ImageViewController *viewimage;

@end
