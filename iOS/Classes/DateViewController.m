//
//  DateViewController.m
//  NB_list
//
//  Created by Eric Chang on 6/30/13.
//
//

#import "DateViewController.h"
#import "User2.h"

@interface DateViewController ()

@end

@implementation DateViewController

@synthesize datePicker, tableView, viewinbox, url;

-(IBAction)send{
    if(self.viewinbox == nil) {
        InboxViewController *secondxib =
        [[InboxViewController alloc] initWithNibName:@"InboxViewController" bundle:[NSBundle mainBundle]];
        self.viewinbox  = secondxib;
        [secondxib release];
    }
    
    [self.navigationController pushViewController:self.viewinbox  animated:YES];
}

-(void)updateLabel:(id)sender{
    
    [self.tableView reloadData];
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
    
    
    [datePicker addTarget:self
                   action:@selector(updateLabel:)
         forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(Done:)];
	[self.navigationItem setRightBarButtonItem:doneButton];
    
    self.navigationItem.hidesBackButton = YES;
    
   // [self.tableView reloadData];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction) Done:(id)sender{
	[self.navigationController popViewControllerAnimated:YES];

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
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.row==0){
        NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
       // [dateFormatter setDateStyle:NSDateFormatterShortStyle];
       // [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
        
        NSDateFormatter* df_utc = [[[NSDateFormatter alloc] init] autorelease];
        [df_utc setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
        [df_utc setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
        
        selectedDate = datePicker.date;
        NSString *timeString = [dateFormatter stringFromDate:selectedDate];
        NSString *timeString_utc=[df_utc stringFromDate:selectedDate];
        NSLog(@"%@", selectedDate);
        
        User2 *user=[User2 sharedUser];
        user.date=timeString;
        user.date_utc=timeString_utc;
        
        cell.textLabel.text=timeString;
    NSLog(@"lala");
    }
    
    
    // Configure the cell...
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
       
    
}

@end
