//
//  NB_listAppDelegate.m
//  NB_list
//
//  Created by mac on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NB_listAppDelegate.h"
#import "RootViewController.h"
#import "User2.h"

#import "UAPush.h"
#import "UAAnalytics.h"


@implementation NB_listAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize correct;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
   // self.window.rootViewController = self.viewController;
   // [self.window makeKeyAndVisible];
    
   // [Parse setApplicationId:@"FqskKgV1VaIRPvfwFrb2lTujy55JmLODR4j9z4PL" clientKey:@"nFdXFAo29NTfmvnWB64CUCCkA5maF1eEZRHQjiHK"];
    
    // This prevents the UA Library from registering with UIApplcation by default when
    // registerForRemoteNotifications is called. This will allow you to prompt your
    // users at a later time. This gives your app the opportunity to explain the benefits
    // of push or allows users to turn it on explicitly in a settings screen.
    // If you just want everyone to immediately be prompted for push, you can
    // leave this line out.
    [UAPush setDefaultPushEnabledValue:YES];
    
    //Create Airship options dictionary and add the required UIApplication launchOptions
    NSMutableDictionary *takeOffOptions = [NSMutableDictionary dictionary];
   
    // [takeOffOptions setValue:launchOptions forKey:UAirshipTakeOffOptionsLaunchOptionsKey];
    
    // Call takeOff (which creates the UAirship singleton), passing in the launch options so the
    // library can properly record when the app is launched from a push notification. This call is
    // required.
    //
    // Populate AirshipConfig.plist with your app's info from https://go.urbanairship.com
   
    // [UAirship takeOff:takeOffOptions];
    
    // Set the icon badge to zero on startup (optional)
    [[UAPush shared] resetBadge];
    
    
    // Register for remote notfications with the UA Library. With the default value of push set to no,
    // UAPush will record the desired remote notifcation types, but not register for
    // push notfications as mentioned above. When push is enabled at a later time, the registration
    // will occur normally. This call is required.
//    [[UAPush shared] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
//                                                         UIRemoteNotificationTypeSound |
//                                                         UIRemoteNotificationTypeAlert)];
//    
    // Handle any incoming incoming push notifications.
    // This will invoke `handleBackgroundNotification` on your UAPushNotificationDelegate.
    
//    [[UAPush shared] handleNotification:[launchOptions valueForKey:UIApplicationLaunchOptionsRemoteNotificationKey]
//                       applicationState:application.applicationState];

    
    
    // Override point for customization after application launch.
    
    // Set the navigation controller as the window's root view controller and display.
    //theScore = [[NSInteger alloc] init];
	[self.window addSubview:[navigationController view]];
    [self.window makeKeyAndVisible];
    
    return YES;
}
//
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
 //   NSString *deviceToken_cal = [deviceToken stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString * deviceToken_cal = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    deviceToken_cal = [deviceToken_cal stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"My caltoken is: %@", deviceToken_cal);
 //   [PFPush storeDeviceToken:deviceToken];
//    [PFPush subscribeToChannelInBackground:@"" block:^(BOOL succeeded, NSError *error) {
//        if (succeeded)
//            NSLog(@"Successfully subscribed to broadcast channel!");
//        else
//            NSLog(@"Failed to subscribe to broadcast channel; Error: %@",error);
//    }];
    UA_LINFO(@"APNS device token: %@", deviceToken);
    
    User2 *user=[User2 sharedUser];
    user.deviceToken=deviceToken;
    
    // Updates the device token and registers the token with UA. This won't occur until
    // push is enabled if the outlined process is followed. This call is required.
    [[UAPush shared] registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    UA_LINFO(@"Received remote notification: %@", userInfo);
    
    // Send the alert to UA so that it can be handled and tracked as a direct response. This call
    // is required.
    [[UAPush shared] handleNotification:userInfo applicationState:application.applicationState];
    
    // Optionally provide a delegate that will be used to handle notifications received while the app is running
    // [UAPush shared].delegate = your custom push delegate class conforming to the UAPushNotificationDelegate protocol
    
    // Reset the badge after a push received (optional)
    [[UAPush shared] resetBadge];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

