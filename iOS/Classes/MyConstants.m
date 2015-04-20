//
//  MyConstants.m
//  NB_list
//
//  Created by Eric Chang on 10/29/12.
//
//

#import "MyConstants.h"

@interface MyConstants ()

@end

@implementation MyConstants

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
    NSString* const kRootURL = @"http://gsuccessprep.com/pa12/";
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
