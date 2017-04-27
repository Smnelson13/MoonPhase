//
//  PhasesTableViewController.m
//  MoonPhase
//
//  Created by Shane Nelson on 4/27/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

#import "PhasesTableViewController.h"
#import "MoonPhase-Swift.h"

@interface PhasesTableViewController ()

@property (nonatomic) NSMutableArray *phases;

@end

@implementation PhasesTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.phases = [[Phase loadPhases] mutableCopy];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{

    return self.phases.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhaseCell" forIndexPath:indexPath];
    
    // Configure the cell...
  Phase *aPhase = self.phases[indexPath.row];
  cell.phaseImageView.image = [UIImage imageNamed:aPhase.imageName];
  cell.phaseNameLabel.text = aPhase.phase;
  cell.illuminationLabel.text = [NSString stringWithFormat:@"%ld%%", (long)aPhase.illumination];
  cell.dateLabel.text = aPhase.date;
  
  
  
  
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"ShowPhaseDetailSegue"])
  {
    PhaseDetailViewController *detailVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Phase *aPhase = self.phases[indexPath.row];
    detailVC.aPhase = aPhase;
  }
}

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue
{
  
}

@end
