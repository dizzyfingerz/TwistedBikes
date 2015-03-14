//
//  BikeListTableViewController.m
//  TwistedBikes
//
//  Created by Grant Neubauer on 3/12/15.
//  Copyright (c) 2015 Grant Neubauer. All rights reserved.
//

#import "BikeListTableViewController.h"
#import "BikeItem.h"
#import "DetailViewController.h"

@interface BikeListTableViewController ()

@property NSMutableArray *bikeItems;

@end

@implementation BikeListTableViewController

@synthesize bikeTableView;


// Set up our bike "database"
- (void)loadBikeData {
    BikeItem *bike1 = [[BikeItem alloc] init];
    bike1.bikePicture = @"bike1.png";
    bike1.bikeBrand = @"Marin";
    bike1.bikeModel = @"XM7";
    bike1.bikePrice = @2199;
    [self.bikeItems addObject:bike1];
    
    BikeItem *bike2 = [[BikeItem alloc] init];
    bike2.bikePicture = @"bike2.png";
    bike2.bikeBrand = @"Turner";
    bike2.bikeModel = @"Sultan Expert";
    bike2.bikePrice = @2199;
    [self.bikeItems addObject:bike2];
    
    BikeItem *bike3 = [[BikeItem alloc] init];
    bike3.bikePicture = @"bike3.png";
    bike3.bikeBrand = @"Norco";
    bike3.bikeModel = @"Range 650B";
    bike3.bikePrice = @3099;
    [self.bikeItems addObject:bike3];
    
    BikeItem *bike4 = [[BikeItem alloc] init];
    bike4.bikePicture = @"bike4.png";
    bike4.bikeBrand = @"DeVinci";
    bike4.bikeModel = @"Troy XT Kit";
    bike4.bikePrice = @1850;
    [self.bikeItems addObject:bike4];
    
    BikeItem *bike5 = [[BikeItem alloc] init];
    bike5.bikePicture = @"bike5.png";
    bike5.bikeBrand = @"Star Cycles";
    bike5.bikeModel = @"Raider SCL";
    bike5.bikePrice = @16990;
    [self.bikeItems addObject:bike5];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bikeItems = [[NSMutableArray alloc] init];
    [self loadBikeData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.bikeItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    BikeItem *bikeItem = [self.bikeItems objectAtIndex:indexPath.row];
    
    tableView.rowHeight = 110;
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    cell.imageView.image = [UIImage imageNamed:bikeItem.bikePicture];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                           @"Brand: ", bikeItem.bikeBrand,
                           @"\nModel: ", bikeItem.bikeModel,
                           @"\nPrice: $", bikeItem.bikePrice];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"showBikeDetail"]) {
        NSIndexPath *indexPath = [self.bikeTableView indexPathForSelectedRow];
        BikeItem *selectedBike = nil;
        selectedBike = [self.bikeItems objectAtIndex:indexPath.row];
        
        DetailViewController *destViewController = segue.destinationViewController;
        destViewController.bikeDetail = selectedBike;
    }
}


//#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    [self performSegueWithIdentifier:@"showBikeDetail" sender:self];
//    
//}

@end
