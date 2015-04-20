//
//  SignUpViewController.m
//  NB_list
//
//  Created by Eric Chang on 10/13/12.
//
//

#import "SignUpViewController.h"
#import "JSON.h"
#import "User2.h"


@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize viewcus, user, pass;

-(IBAction)connect
{
    
    
    NSString *user2=user.text;
    NSString *pass2=pass.text;
    
    /* NSString *urlString = [NSString stringWithFormat:@"%@",@"https://gsuccessprep.com/cb_rest_api/authenticate_user"];
     
     NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
     [request setURL:[NSURL URLWithString:urlString]];
     [request setHTTPMethod:@"POST"];
     
     NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
     NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
     [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
     
     NSMutableData *body = [NSMutableData data];
     
     //  parameter username
     [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"username\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[user2 dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
     
     //  parameter username
     [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"password\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[pass2 dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
     
     // setting the body of the post to the reqeust
     [request setHTTPBody:body];
     
     // now lets make the connection to the web
     NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
     NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
     
     //  NSLog(@"%@", returnString);
     
     NSString *finalString = [returnString stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""];
     //NSLog(@"%s - receviedDataAsString: %@", __FUNCTION__, finalString);
     NSString *cut=[finalString substringWithRange:NSMakeRange(1, finalString.length-2)];
     // NSLog(@"%s - receviedDataAsString: %@", __FUNCTION__, cut);
     NSString *added=[NSString stringWithFormat:@"{ \"data\": {%@} }", cut];
     //  NSLog(@"%s - receviedDataAsString: %@", __FUNCTION__, added);
     
     // if(mode==0){
     
     NSDictionary *json = [added JSONValue];
     
     int auth=0;
     NSDictionary *item = [json valueForKeyPath:@"data"];
     NSArray *groups = [item valueForKeyPath:@"groups"];
     NSArray *person_orgs = [item valueForKeyPath:@"info"];
     int length_info=[person_orgs count];
     
     
     User2 *user3=[User2 sharedUser];
     user3.org_names=[[NSMutableArray alloc]init];
     for(int i=0; i<length_info;i++){
     [user3.org_names addObject:[[person_orgs objectAtIndex:i] valueForKeyPath:@"org_name"]];
     }
     
     //  NSLog(@"%@", [item objectAtIndex:0]);
     //BOOL isTheObjectThere = [myArray containsObject: @"my string"];
     
     if ([groups containsObject:@"coordinator"]==true){
     auth=1;
     }
     else if ([groups containsObject:@"physician"]==true){
     auth=2;
     }
     else{
     auth=1;
     }*/
    
    int auth=0;
    
    if(auth!=1){
        
    }
    NSString *urlString = [NSString stringWithFormat:@"http://107.21.202.8/post_signup.php?user=%@&pass=%@",user2,pass2];
    NSLog(@"%@",user2);
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: urlString]];
    NSString *returnString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"the return string: %@", returnString);
    
    User2 *user=[User2 sharedUser];
    user.user=user2;
    user.pass=pass2;
    
    if([returnString isEqualToString:@"0"]){
        //    if([user2 isEqualToString:@"Wei.God"]){
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That username already exists"
                                                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];
    }
    else if([returnString isEqualToString:@"1"]){
        //   else if([user2 isEqualToString:@"Wei.God2"]){
        
        if(self.viewcus == nil) {
            Customer2ViewController *secondxib =
            [[Customer2ViewController alloc] initWithNibName:@"Customer2ViewController" bundle:[NSBundle mainBundle]];
            self.viewcus = secondxib;
            [secondxib release];
        }
        
        [self.navigationController pushViewController:self.viewcus animated:YES];
    }
    else{
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That username already exists"
                                                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];
    }
    /* else if (auth==2){
     User2 *user3=[User2 sharedUser];
     user3.user=@"cb.webservice";
     user3.pass=@"e1Z1iScMqHEogItD";
     
     /*    if(self.viewphy == nil) {
     PhysiciansViewController *secondxib =
     [[PhysiciansViewController alloc] initWithNibName:@"PhysiciansViewController" bundle:[NSBundle mainBundle]];
     self.viewphy = secondxib;
     [secondxib release];
     }
     
     [self.navigationController pushViewController:self.viewphy animated:YES];*/
    //}
    
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
