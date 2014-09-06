//
//  DetailViewController.m
//  CoffeeNote
//
//  Created by 凸 on 9/4/14.
//  Copyright (c) 2014 YutaTotz. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
// - (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        // [self configureView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // [self configureView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapSaveButton:(id)sender {
    NSString *blendName = self.blendNameTextField.text;
    NSString *comment = self.commentTextField.text;
    
    NSLog(@"%@", blendName);
    NSLog(@"%@", comment);
    
    // Set NSUserDefaults
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *coffeeData = @[blendName, comment];
    
    // Get String of Date Now
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd/HH/mm/ss"];
    NSString *nowdateString = [formatter stringFromDate:nowdate];
    
    // Save data by the date string
    [myDefaults setObject:coffeeData forKey:nowdateString];
}

- (IBAction)finishEditBlendNameTextField:(UITextField *)sender {
}

- (IBAction)finishEditCommentTextField:(UITextField *)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)returnDetail:(UIStoryboardSegue *)segue {
    
}


@end
