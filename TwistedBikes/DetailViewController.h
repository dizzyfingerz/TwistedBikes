//
//  DetailViewController.h
//  TwistedBikes
//
//  Created by Grant Neubauer on 3/13/15.
//  Copyright (c) 2015 Grant Neubauer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BikeItem.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *cartButton;

@property (nonatomic, strong) BikeItem *bikeDetail;
@property (nonatomic, strong) IBOutlet UIImageView *pictureUI;
@property (nonatomic, strong) IBOutlet UILabel *brandLabel;
@property (nonatomic, strong) IBOutlet UILabel *modelLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
IBInspectable

@end
