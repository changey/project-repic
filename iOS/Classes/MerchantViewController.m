//
//  MerchantViewController.m
//  NB_list
//
//  Created by Eric Chang on 10/9/12.
//
//

#import "MerchantViewController.h"
#import "User2.h"
#import "TDSemiModal.h"
#import "ASIHTTPRequest.h"

@interface MerchantViewController ()

@end

@implementation MerchantViewController

@synthesize item, discount, expiration, merchant_id, message, viewmer, viewfreq;


-(IBAction)menu{
    }

- (IBAction)cancel{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    User2 *user=[User2 sharedUser];
    NSLog(@"%@", user.user);
    
}
-(IBAction)send:(id)sender{
    
    NSString *item_s=item.text;
    NSString *discount_s=discount.text;
    NSString *expiration_s=expiration.text;
    message=[NSString stringWithFormat:@"ZOMG your friend sent you a pic"];
    
    
    
    User2 *user=[User2 sharedUser];
    
    
    NSString *url = [NSString stringWithFormat:@"%@/discounts.php?merchant=%@&item=%@&discount=%@&expiration=%@", user.url, user.merchant_id, item_s,discount_s,expiration_s];  // server name does not match
    NSString *finalString= [url stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    NSURL *URL = [NSURL URLWithString:finalString];
    
    //  [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[URL host]];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:URL];
    [request startSynchronous];
    NSError *error = [request error];
    NSString *returnString;
    if (!error) {
        returnString = [request responseString];
        NSLog(@"%@",returnString);
    }
    
    [self dismissModalViewControllerAnimated:YES];
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    User2 *user = [User2 sharedUser];
    
    if ([user.item isEqualToString:@""]==false && [user.promotion isEqualToString:@""]==false){
        item.text=user.item;
        discount.text=user.promotion;
    }
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
}

-(IBAction)promotions{
    if(self.viewmer == nil) {
        MerDiscountsViewController *secondxib =
        [[MerDiscountsViewController alloc] initWithNibName:@"MerDiscountsViewController" bundle:[NSBundle mainBundle]];
        self.viewmer = secondxib;
        [secondxib release];
    }
    
    [self.navigationController pushViewController:self.viewmer animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *item_s=item.text;
    NSString *discount_s=discount.text;
    NSString *expiration_s=expiration.text;
    switch (buttonIndex) {
        case 0:
            //  printf("Cancel button pressedn");
            break;
            
        case 1:
            printf("first button pressedn");
            //[send_info];
            // [PFPush sendPushMessageToChannelInBackground:@"" withMessage:message];
            
            User2 *user=[User2 sharedUser];
            
            NSString *url = [NSString stringWithFormat:@"%@/discounts.php?merchant=%@&item=%@&discount=%@&expiration=%@", user.url, user.merchant_id, item_s,discount_s,expiration_s];  // server name does not match
            NSString *finalString= [url stringByReplacingOccurrencesOfString:@" " withString:@"_"];
            
            NSURL *URL = [NSURL URLWithString:finalString];
            
            //   [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[URL host]];
            
            ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:URL];
            [request startSynchronous];
            NSError *error = [request error];
            NSString *returnString;
            if (!error) {
                returnString = [request responseString];
                NSLog(@"%@",returnString);
            }
            
            NSLog(@"the return string: %@", returnString);
            
            
            break;
            
        default:
            break;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    /*  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Frequent promotions" style:UIBarButtonItemStyleBordered target:self action:@selector(frequent:)];
     [self.navigationItem setRightBarButtonItem:addButton];*/
    
    [self.navigationController setNavigationBarHidden:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction) frequent{
    /* if(self.viewmenu == nil) {
     MenuViewController *secondxib =
     [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:[NSBundle mainBundle]];
     self.viewmenu = secondxib;
     [secondxib release];
     }
     
     [self presentModalViewController:viewmenu animated:YES];*/
    
	if(self.viewfreq == nil) {
        FrequentsViewController *secondxib =
        [[FrequentsViewController alloc] initWithNibName:@"FrequentsViewController" bundle:[NSBundle mainBundle]];
        self.viewfreq = secondxib;
        [secondxib release];
    }
    
    [self presentModalViewController:viewfreq animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
 // return titleForHeader;
 }*/

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:SimpleTableIdentifier] autorelease];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if(indexPath.row==0){
        cell.textLabel.text=@"Item";
    }
    else if(indexPath.row==1){
        cell.textLabel.text=@"Promo";
    }
    else if(indexPath.row==2){
        cell.textLabel.text=@"Exp";
    }
    //cell
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row==2){
        [item resignFirstResponder];
        [discount resignFirstResponder];
        [self presentSemiModalViewController:datePickerView];
    }
    
    // User *user=[User sharedUser];
    // user.imageNum=[self.mut objectAtIndex:length-indexPath.row-1];
    
    
}

#pragma mark -
#pragma mark Date Picker Delegate

-(void)datePickerSetDate:(TDDatePickerController*)viewController {
	[self dismissSemiModalViewController:datePickerView];
    
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
	selectedDate = viewController.datePicker.date;
    NSString *timeString = [dateFormatter stringFromDate:selectedDate];
    expiration.text=[NSString stringWithFormat:@"%@",timeString];
}

-(void)datePickerClearDate:(TDDatePickerController*)viewController {
	[self dismissSemiModalViewController:datePickerView];
    
	selectedDate = nil;
}

-(void)datePickerCancel:(TDDatePickerController*)viewController {
	[self dismissSemiModalViewController:datePickerView];
}



@end
