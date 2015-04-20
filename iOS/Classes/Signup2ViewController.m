//
//  Signup2ViewController.m
//  NB_list
//
//  Created by Shiyang Liu on 10/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Signup2ViewController.h"
#import "JSON.h"
#import "User2.h"

#import "UAPush.h"
#import "UAAnalytics.h"
#import "UAUser.h"

@interface Signup2ViewController ()

@end

@implementation Signup2ViewController

@synthesize user, pass, email, passcon;

-(IBAction)connect
{
    NSString *user2=user.text;
    NSString *pass2=pass.text;
    
    User2 *user3=[User2 sharedUser];
    
    NSString *urlString = [NSString stringWithFormat:@"%@/startup/post_signup.php?user=%@&pass=%@", user3.url, user2,pass2];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: urlString]];
    NSString *returnString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"the return string: %@", returnString);
    
    
    user3.user=user2;
    user3.pass=pass2;
    
    if([returnString isEqualToString:@"0"]){
        //    if([user2 isEqualToString:@"Wei.God"]){
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That username already exists"
                                                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];
    }
    else if([returnString isEqualToString:@"1"]){
        user3.user=user2;
        // [[UAUser defaultUser] setAlias:@"changey"];
        [[UAPush shared] setAlias:user2];
        
        if(self.viewmenu == nil) {
            MenuViewController *secondxib =
            [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:[NSBundle mainBundle]];
            self.viewmenu = secondxib;
            [secondxib release];
        }
        
        [self.navigationController pushViewController:self.viewmenu animated:YES];
        
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
     
     if(self.viewphy == nil) {
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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
