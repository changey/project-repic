//
//  DiscountsViewController.m
//  NB_list
//
//  Created by Eric Chang on 10/10/12.
//
//

#import "DiscountsViewController.h"
#import "DiscountsCell.h"
#import "JSON.h"
#import "User2.h"
#import "ASIHTTPRequest.h"

@interface DiscountsViewController ()

@end

@implementation DiscountsViewController

@synthesize items, discounts, expirations, viewmenu;

-(IBAction)preorder{
   /* if(self.viewfreq == nil) {
        FrequentsViewController *secondxib =
        [[FrequentsViewController alloc] initWithNibName:@"FrequentsViewController" bundle:[NSBundle mainBundle]];
        self.viewfreq = secondxib;
        [secondxib release];
    }
    
    [self presentModalViewController:viewfreq animated:YES];*/
    // [self.navigationController pushViewController:self.viewfreq animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    User2 *user =[User2 sharedUser];
    
    NSString *url = [NSString stringWithFormat:@"%@/discounts_list.php", user.url];  // server name does not match
    
    NSURL *URL = [NSURL URLWithString:url];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:URL];
    [request startSynchronous];
    NSError *error = [request error];
    NSString *returnString;
    if (!error) {
        returnString = [request responseString];
        NSLog(@"%@",returnString);
    }
    
    NSString *calibrated = [returnString stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    
   // NSLog(@"the return string: %@", calibrated);
    
    NSDictionary *json = [calibrated JSONValue];
    
    items = [[NSMutableArray alloc] init];
    discounts = [[NSMutableArray alloc] init];
    expirations = [[NSMutableArray alloc] init];
    
    [items removeAllObjects];
    [discounts removeAllObjects];
    [expirations removeAllObjects];
    
    NSArray *items2 = [json valueForKeyPath:@"data"];
    
    int length = [items2 count];
    
    //[arrayNo2 removeAllObjects];
    
    for (int i=0; i<length;i++){
        NSString *merchant=[[items2 objectAtIndex:i] objectForKey:@"merchant"];
      //  NSLog(@"merchant=%@",merchant);
      //  NSLog(@"merchant_section=%@",user.merchant_section);
        NSString *section=[NSString stringWithFormat:@"%@", user.merchant_section];
        if([merchant isEqualToString:section]){
        
        NSString *item=[[items2 objectAtIndex:i] objectForKey:@"item"];
        NSString *discount=[[items2 objectAtIndex:i] objectForKey:@"discount"];
        NSString *expiration=[[items2 objectAtIndex:i] objectForKey:@"expiration"];
        [items addObject:[NSString stringWithFormat:@"%@",item]];
        [discounts addObject:[NSString stringWithFormat:@"%@",discount]];
        [expirations addObject:[NSString stringWithFormat:@"%@",expiration]];
            
            NSLog(@"item=%@", item);
        }
    
        [tableView reloadData];
        // NSLog(@"%@", first_p);
        
     //   [arrayNo2 addObject:[NSString stringWithFormat:@"%@ %@ %@",first_p, middle_p, last_p]];
        //NSLog(@"%@", [arrayNo2 objectAtIndex:0]);
    }

}

- (void)viewDidLoad
{
    
    // Do any additional setup after loading the view from its nib.
   // self.imageView.image = [UIImage imageNamed:@"gold_bg.jpeg"];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(Edit:)];
	[self.navigationItem setRightBarButtonItem:addButton];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // self.imageView.image = [UIImage imageNamed:@"gold_bg.jpeg"];
}

- (IBAction) Edit:(id)sender{
	if(self.viewmenu == nil) {
        Menu2ViewController *secondxib =
        [[Menu2ViewController alloc] initWithNibName:@"Menu2ViewController" bundle:[NSBundle mainBundle]];
        self.viewmenu = secondxib;
        [secondxib release];
    }
    
    [self presentModalViewController:viewmenu animated:YES];
    
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
    return [items count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DiscountCell";
	
    DiscountsCell *cell = (DiscountsCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DiscountsCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (DiscountsCell *) currentObject;
				break;
			}
		}
	}
    
  /*  static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:SimpleTableIdentifier] autorelease];
    }*/

    
    
    //NSString *urlString =@"";
    int num;
    //  num=length-indexPath.row-1;
    // urlString = [NSString stringWithFormat:@"http://gsuccessprep.com/pfoap/images/%@.png",  [self.mut objectAtIndex:num]];
    //[self.mut objectAtIndex:num]
    
    // NSString *urlString = [NSString stringWithFormat:@"http://gsuccessprep.com/pfoap/images/58.png"];
    /*  UIImageFromURL( [NSURL URLWithString:urlString], ^( UIImage * image )
     {
     cell.imgv.image = image;
     //NSLog(@"%@",image);
     }, ^(void){
     // NSLog(@"%@",@"error!");
     });*/
    //cell.imgv.image = [UIImage imageWithData:data];
	//cell.capitalLabel.text = [NSString stringWithFormat:@"%d. Food Truck",indexPath.row+1];
	
    //cell.backgroundColor = [UIColor clearColor];
    cell.item.text=[NSString stringWithFormat:@"Buy %@ get %@",[items objectAtIndex:indexPath.row], [discounts objectAtIndex:indexPath.row]];
    cell.expiration.text=[NSString stringWithFormat:@"Expired: %@",[expirations objectAtIndex:indexPath.row]];
    
   /* cell.textLabel.text=[NSString stringWithFormat:@"Buy %@ get %@",[items objectAtIndex:indexPath.row], [discounts objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"Expired: %@",[expirations objectAtIndex:indexPath.row]];*/
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
       
    // User *user=[User sharedUser];
    // user.imageNum=[self.mut objectAtIndex:length-indexPath.row-1];
    
    
}

@end
