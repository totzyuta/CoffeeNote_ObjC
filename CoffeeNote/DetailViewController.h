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

@property (weak, nonatomic) IBOutlet UITextField *blendNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;

- (IBAction)tapSaveButton:(id)sender;
- (IBAction)finishEditBlendNameTextField:(UITextField *)sender;
- (IBAction)finishEditCommentTextField:(UITextField *)sender;

@end
