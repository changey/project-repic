//
//  DiscountsViewController.h
//  NB_list
//
//  Created by Eric Chang on 10/10/12.
//
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"

@class MenuViewController;
@class Menu2ViewController;

@interface DiscountsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    
    Menu2ViewController *viewmenu;
    
    //MenuViewController *viewmenu;
    
    NSMutableArray *items;
    NSMutableArray *discounts;
    NSMutableArray *expirations;
    
    IBOutlet UITableView *tableView;
    
}

@property (nonatomic, retain) Menu2ViewController *viewmenu;

@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) NSMutableArray *discounts;
@property (nonatomic, retain) NSMutableArray *expirations;

-(IBAction)preorder;

@end
