//
//  DetailViewController.m
//  CoffeeNote
//
//  Created by 凸 on 9/4/14.
//  Copyright (c) 2014 YutaTotz. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        // self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
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
}

- (IBAction)finishEditBlendNameTextField:(UITextField *)sender {
}

- (IBAction)finishEditCommentTextField:(UITextField *)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
