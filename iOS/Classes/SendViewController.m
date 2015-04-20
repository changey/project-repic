//
//  SendViewController.m
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import "SendViewController.h"
#import "SendCell.h"
#import "User2.h"
#import "ASIHTTPRequest.h"
#import "JSON.h"

@interface SendViewController ()

@end

@implementation SendViewController

@synthesize viewdate, label, viewinbox, btnImage, imageButton, friends, friends_selected;

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    User2 *user =[User2 sharedUser];
    
    label.text=user.date;
    
    NSString *url = [NSString stringWithFormat:@"%@/startup/friendslist.php", user.url];  // server name does not match
    
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
    
    friends = [[NSMutableArray alloc] init];
  //  friends_selected = [[NSMutableArray alloc] init];

    
    int length = [json count];
    
    //[arrayNo2 removeAllObjects];
    
    NSString *friend;
    
    for (int i=0; i<length;i++){
         friend=[json objectAtIndex:i];
        [friends addObject:friend];
        
    }
    
    
}

-(IBAction)send{

    User2 *user=[User2 sharedUser];
    NSLog(@"%@", user.date);
    
    if (user.date==NULL){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please select a deliver time"
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        [alert release];
        
    }
    else{
        
        NSString *urlString = [NSString stringWithFormat:@"%@/startup/messages.php", user.url];
        
        
        
        NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        
        NSMutableData *body = [NSMutableData data];
        
        //  parameter username
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"sender\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[user.user dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //  parameter username
        
        [user.friends_selected addObject:user.user];
        
        NSArray *array = [user.friends_selected copy];
        
        NSString *jsonString = [array JSONRepresentation];
        
        //NSLog(@"%@", jsonString);
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"receivers\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //  parameter username
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"time\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[user.date_utc dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //  parameter username
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"url\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"lala" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //  parameter username
        NSLog(@"%@", user.captions);
        NSString *captions_correct = [user.captions stringByReplacingOccurrencesOfString: @"\'" withString:@"\\\'"];
        NSLog(@"%@", captions_correct);
        
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"captions\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[captions_correct dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        // NSLog(@"%@", user.captions);
        
        // setting the body of the post to the reqeust
        [request setHTTPBody:body];
        
        // now lets make the connection to the web
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", returnString);
        
        NSDictionary *json2 = [returnString JSONValue];
        
        //NSString
        
        NSLog(@"%@", [json2 objectForKey:@"messages_number"]);
        NSLog(@"%@", [json2 objectForKey:@"receiver_number"]);
        
        NSString *messages_number=[json2 objectForKey:@"messages_number"];
        NSString *receiver_number=[json2 objectForKey:@"receiver_number"];
        
        user.messages_number=messages_number;
        user.receiver_number=receiver_number;
        
        //    NSString *str;//Pass your string to str
        //    NSArray *str_array = [str componentsSeparatedByString:@","];
        
        //    for(int i=0; i<[str_array count]; i++){
        //
        //        //Here just take strings one by one
        //
        //    }
        //NSLog(@"%@", [str_array objectAtIndex:0]);
        // NSLog(@"%@", [str_array objectAtIndex:3]);
        
        if(self.viewinbox == nil) {
            InboxViewController *secondxib =
            [[InboxViewController alloc] initWithNibName:@"InboxViewController" bundle:[NSBundle mainBundle]];
            secondxib.sent=@"1";
            secondxib.btnImage=btnImage;
            
            self.viewinbox  = secondxib;
            [secondxib release];
        }
        
        [self.navigationController pushViewController:self.viewinbox animated:YES];
    }
}

-(IBAction)date_a{
    if(self.viewdate == nil) {
        DateViewController *secondxib =
        [[DateViewController alloc] initWithNibName:@"DateViewController" bundle:[NSBundle mainBundle]];
        self.viewdate = secondxib;
        [secondxib release];
    }
    
    [self.navigationController pushViewController:self.viewdate animated:YES];
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
    [super viewDidLoad];
    
    self.title=@"Send to";
    
    [imageButton setImage:btnImage forState:UIControlStateNormal];
    
    check_i=0;
    
    User2 *user=[User2 sharedUser];
    user.friends_selected=[[NSMutableArray alloc] init];
    // Do any additional setup after loading the view from its nib.
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
    return [friends count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"SendCell";
	
    SendCell *cell = (SendCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    
    if (cell == nil) {
        
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SendCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (SendCell *) currentObject;
				break;
			}
		}
	}
    
    if (indexPath.row==0){
        
    }
    cell.imgv.image=[UIImage imageNamed:@"logo57.png"];
    cell.name.text=[friends objectAtIndex:indexPath.row];

    
    
    //NSString *urlString =@"";
    int num;
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SendCell *row = [tableView cellForRowAtIndexPath:indexPath];
    User2 *user=[User2 sharedUser];
    
    
    if ([row.check_s isEqualToString:@"1"]==false){
        [row.check_v setImage:[UIImage imageNamed:@"check.png"]];
        row.check_s=@"1";
        [user.friends_selected addObject:[friends objectAtIndex:indexPath.row]];
    }
    else{
        [row.check_v setImage:[UIImage imageNamed:@"uncheck.png"]];
        row.check_s=@"0";
        [user.friends_selected removeObject:[friends objectAtIndex:indexPath.row]];
    }
    
    NSLog(@"%d",[user.friends_selected count]);
    // User *user=[User sharedUser];
    // user.imageNum=[self.mut objectAtIndex:length-indexPath.row-1];
    
    
}

@end
