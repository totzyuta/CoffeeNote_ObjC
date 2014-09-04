//
//  DetailViewController.h
//  CoffeeNote
//
//  Created by 凸 on 9/4/14.
//  Copyright (c) 2014 YutaTotz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UITextField *blendNameTextField;

- (IBAction)finishEditBlendName:(UITextField *)sender;
- (IBAction)tapSaveButton:(id)sender;

@end
