//
//  InboxViewController.m
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import "InboxViewController.h"
#import "CustomCell.h"
#import "User2.h"
#import "ASIHTTPRequest.h"
#import "JSON.h"

@interface InboxViewController ()

@end

@implementation InboxViewController

@synthesize viewimage, sent, btnImage, viewdet, senders, times, urls, captions, messages_number, receiver_number, viewmenu;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    User2 *user=[User2 sharedUser];
    
    NSString *url = [NSString stringWithFormat:@"%@/startup/inbox.php?user=%@", user.url, user.user];  // server name does not match
    
    NSURL *URL = [NSURL URLWithString:url];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:URL];
    [request startSynchronous];
    NSError *error = [request error];
    NSString *returnString;
    if (!error) {
        returnString = [request responseString];
      //  NSLog(@"%@",returnString);
    }
    
    // NSString *calibrated = [returnString stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    
    // NSLog(@"the return string: %@", calibrated);
    
    NSArray *json = [returnString JSONValue];
    
    senders = [[NSMutableArray alloc] init];
    urls = [[NSMutableArray alloc] init];
    times = [[NSMutableArray alloc] init];
    captions = [[NSMutableArray alloc] init];
    
    
    //NSLog(@"%@", user.user);
    //[friends_selected addObject:user.user];
    
    
    // NSArray *items2 = [json valueForKeyPath:@"data"];
    
    int length = [json count];
    
    //[arrayNo2 removeAllObjects];
    
    NSString *sender;
    NSString *url_s;
    NSString *time;
    NSString *caption;
    
    for (int i=0; i<length;i++){
        sender=[[json objectAtIndex:i] objectForKey:@"sender"];
        url_s=[[json objectAtIndex:i] objectForKey:@"url"];
        time=[[json objectAtIndex:i] objectForKey:@"time"];
        caption=[[json objectAtIndex:i] objectForKey:@"captions"];
        [senders addObject:sender];
        [urls addObject:url_s];
        [times addObject:time];
        [captions addObject:caption];
        //NSLog(@"%@", sender);
        
    }
    
    [self.tableView reloadData];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    User2 *user =[User2 sharedUser];
    
    
    if ([sent isEqualToString:@"1"]){
        
        
        NSData *imageData = UIImageJPEGRepresentation(btnImage, 0.1);
        
        
        NSString *urlString = [NSString stringWithFormat:@"%@/startup/upload.php", user.url];
        
        
        NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"image\"; filename=\"dr3.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:imageData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //NSLog(@"%@", jsonString);
        NSLog(@"%@", user.messages_number);
        NSString *messages_number_s=[NSString stringWithFormat:@"%@", user.messages_number];
        NSString *messages_number_s2 = [messages_number_s stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"messages_number\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[messages_number_s2 dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //NSLog(@"%@", jsonString);
        NSLog(@"%@", user.receiver_number);
        
        NSString *receiver_number_s=[NSString stringWithFormat:@"%@", user.receiver_number];
        NSString *receiver_number_s2 = [receiver_number_s stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"%@", receiver_number_s2);
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"receiver_number\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[receiver_number_s2 dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        // setting the body of the post to the reqeust
        [request setHTTPBody:body];
        
        // now lets make the connection to the web
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", returnString);
    }
    
    NSLog(@"%@", user.user);
    
    NSString *url = [NSString stringWithFormat:@"%@/startup/inbox.php?user=%@", user.url, user.user];  // server name does not match
    
    NSURL *URL = [NSURL URLWithString:url];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:URL];
    [request startSynchronous];
    NSError *error = [request error];
    NSString *returnString;
    if (!error) {
        returnString = [request responseString];
          NSLog(@"%@",returnString);
    }
    
    // NSString *calibrated = [returnString stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    
    // NSLog(@"the return string: %@", calibrated);
    
    NSArray *json = [returnString JSONValue];

    urls = [[NSMutableArray alloc] init];
    
    
    //NSLog(@"%@", user.user);
    //[friends_selected addObject:user.user];
    
    
    // NSArray *items2 = [json valueForKeyPath:@"data"];
    
    int length = [json count];
    
    //[arrayNo2 removeAllObjects];
    
    NSString *url_s;

    
    for (int i=0; i<length;i++){
        url_s=[[json objectAtIndex:i] objectForKey:@"url"];

        [urls addObject:url_s];

    }
    
    [self.tableView reloadData];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        self.navigationItem.hidesBackButton = YES;
    
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(Back:)];
    	[self.navigationItem setLeftBarButtonItem:backButton];
    
    self.title=@"Inbox";
    // Do any additional setup after loading the view from its nib.
}

- (IBAction) Back:(id)sender{
    MenuViewController *secondxib =
    [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:[NSBundle mainBundle]];
    self.viewmenu = secondxib;
    [secondxib release];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewmenu];
    
	[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    
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
    User2 *user=[User2 sharedUser];
    int inbox_num=[user.inbox intValue];
    return [senders count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

void UIImageFromURL( NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void) )
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[[NSData alloc] initWithContentsOfURL:URL] autorelease];
                       UIImage * image = [[[UIImage alloc] initWithData:data] autorelease];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CustomCell";
	
    CustomCell *cell = (CustomCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (CustomCell *) currentObject;
				break;
			}
		}
	}
    //NSString *urlString =@"";
    User2 *user=[User2 sharedUser];
    int inbox_num=[user.inbox intValue];
    
    //if ([sent isEqualToString:@"1"]){
    inbox_num=inbox_num+1;
    //  NSLog(@"%@", user.captions);
    user.inbox=[NSString stringWithFormat:@"%d", inbox_num];
    
    
    
    //        if (indexPath.row==1){
    //            cell.mer_name.text=@"Have you seen white doug";
    //            cell.imgv.image=[UIImage imageNamed:@"phil.png"];
    //            cell.name.text=@"Phil";
    //        }
    
    cell.mer_name.text=[captions objectAtIndex:indexPath.row];
    cell.imgv.image=[UIImage imageNamed:@"logo57.png"];
    cell.name.text=[senders objectAtIndex:indexPath.row];
    
    // original string
    //  NSString *str = [NSString stringWithFormat:@"2011-01-13T17:00:00+11:00"];
    NSString *str = [times objectAtIndex:indexPath.row];
    
    // convert to date
    NSDateFormatter *dateFormat_utc = [[NSDateFormatter alloc] init];
    // ignore +11 and use timezone name instead of seconds from gmt
    [dateFormat_utc setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
    [dateFormat_utc setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDate *dte = [dateFormat_utc dateFromString:str];
    // NSLog(@"Date: %@", dte);
    
    
    NSDateFormatter* df = [[[NSDateFormatter alloc] init] autorelease];
    [df setTimeZone:[NSTimeZone systemTimeZone]];
    [df setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
    
    NSString *timeString = [df stringFromDate:dte];
    
    cell.time.text=timeString;
    //    }
    
    
    
    
    // cell.
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *str = [NSString stringWithFormat:@"%@",[times objectAtIndex:indexPath.row]];
    NSLog(@"%@", str);
    
    // convert to date
    NSDateFormatter *dateFormat_utc = [[NSDateFormatter alloc] init];
    // ignore +11 and use timezone name instead of seconds from gmt
    [dateFormat_utc setDateFormat:@"YYYY-MM-dd' 'HH:mm:ss'"];
    [dateFormat_utc setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDate *dte = [dateFormat_utc dateFromString:str];
    // NSLog(@"Date: %@", dte);
    
    
    NSDateFormatter* df = [[[NSDateFormatter alloc] init] autorelease];
    [df setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [df setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
    NSDate *dte_local = [df dateFromString:str];
    
   // NSTimeZone* destinationTimeZone = [NSTimeZone systemTimeZone];
   // [df setTimeZone:destinationTimeZone];
    
   
    NSDate *currentTime = [NSDate date];
    NSString *current_str = [df stringFromDate:currentTime];
    NSString *record = [df stringFromDate:dte_local];
    NSLog(@"current: %@", currentTime);
    NSLog(@"record: %@", dte_local);
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone]; // This will store the timezone of the device in the NSTimeZone object, timeZone
    
    NSLog(@"TIME ZONE = %@",timeZone);
    
    // NSString *
    switch ([dte_local compare:currentTime]){
        case NSOrderedAscending:
            if(self.viewdet == nil) {
                DetailViewController *secondxib =
                [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
                secondxib.url=[urls objectAtIndex:indexPath.row];
                secondxib.captions=[captions objectAtIndex:indexPath.row];
                self.viewdet = secondxib;
                [secondxib release];
            }
            
            [self.navigationController pushViewController:self.viewdet animated:YES];
            //NSLog(@"NSOrderedAscending");
            break;
        case NSOrderedSame:{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh-oh, time is not up yet"
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            [alert release];
            
//            if(self.viewdet == nil) {
//                DetailViewController *secondxib =
//                [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
//                secondxib.url=[urls objectAtIndex:indexPath.row];
//                
//                self.viewdet = secondxib;
//                [secondxib release];
//            }
//            
//            [self.navigationController pushViewController:self.viewdet animated:YES];
         //   NSLog(@"NSOrderedSame");
        
            break;
        }
        case NSOrderedDescending:{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh-oh, time is not up yet"
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            [alert release];
                        
        //    NSLog(@"NSOrderedDescending");
            break;
        }
        
            
            
            // User *user=[User sharedUser];
            // user.imageNum=[self.mut objectAtIndex:length-indexPath.row-1];
            
            
    }
    
    if (indexPath.row==0){
        
    }
    
    
}

@end
