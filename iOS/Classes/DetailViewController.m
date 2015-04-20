//
//  DetailViewController.m
//  NB_list
//
//  Created by Eric Chang on 6/30/13.
//
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize imgv, url, txtv, captions;

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
//    NSLog(@"%@", url);
//    NSURL * imageURL = [NSURL URLWithString:url];
//    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
//    imgv.image = [UIImage imageWithData:imageData];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    txtv.text=captions;
    
    NSLog(@"%@", url);
    NSURL * imageURL = [NSURL URLWithString:url];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    imgv.image = [UIImage imageWithData:imageData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
