//
//  DetailViewController.m
//  TwistedBikes
//
//  Created by Grant Neubauer on 3/13/15.
//  Copyright (c) 2015 Grant Neubauer. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize bikeDetail;
@synthesize pictureUI;
@synthesize brandLabel;
@synthesize modelLabel;
@synthesize priceLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    pictureUI.image = [UIImage imageNamed:bikeDetail.bikePicture];
    
    brandLabel.text = [NSString stringWithFormat:@"%@%@", @"Brand: ", bikeDetail.bikeBrand];
    modelLabel.text = [NSString stringWithFormat:@"%@%@", @"Model: ", bikeDetail.bikeModel];
    priceLabel.text = [NSString stringWithFormat:@"%@%@", @"Price: $", bikeDetail.bikePrice];
    
    [self.cartButton setTitle:@"Add to Cart" forState:(UIControlStateNormal)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// Handle the "Add to Cart" button click
- (IBAction)handleButtonClick:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"The bike has been added to your cart."
                              message:@"Good choice."
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    
    [alertView show];
}

@end
