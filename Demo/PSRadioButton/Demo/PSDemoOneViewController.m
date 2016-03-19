//
//  PSDemoOneViewController.m
//  PSRadioButton
//
//  Created by Pan on 16/3/18.
//  Copyright © 2016年 Sheng Pan. All rights reserved.
//

#import "PSDemoOneViewController.h"

// NOTICE: #import "PROJECT_NAME-Swift.h" File to use PSRadioButton
#import "PSRadioButton-Swift.h"

NSInteger const ButtonWidth = 100;
NSInteger const ButtonMargin = 20;

@interface PSDemoOneViewController ()

@property (nonatomic, strong) PSRadioGroup *radioGroup;
@property (nonatomic, strong) NSArray<PSRadioButton *> *buttonsWithAction;

@end

@implementation PSDemoOneViewController

#pragma mark - Lift Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // You should name the RadioButton receive from block.As you see,here we name it button
    PSRadioButton *radioButton = [[PSRadioButton alloc] initWithAction:^(PSRadioButton * _Nonnull button) {
        NSLog(@"I selected Button1");
    }];
    radioButton.selectedImage = [UIImage imageNamed:@"seleted"];
    radioButton.deselectedImage = [UIImage imageNamed:@"deseleted"];
    [self.view addSubview:radioButton];
    
    // and here we name it radioButton
    PSRadioButton *radioButton1 = [[PSRadioButton alloc] initWithAction:^(PSRadioButton * _Nonnull radioButton) {
        NSLog(@"all right,it's Button2");
    }];
    radioButton1.selectedImage = [UIImage imageNamed:@"seleted"];
    radioButton1.deselectedImage = [UIImage imageNamed:@"deseleted"];
    self.buttonsWithAction = @[radioButton,radioButton1];
    [self.view addSubview:radioButton1];
    
    // Cause we use Action Block to handle selection each radioButton,
    // any delegate is noneed,
    // just initialize raiodGroup,it will handle this group of PSRadioButton
    self.radioGroup = [[PSRadioGroup alloc] initWithRadioButtons:self.buttonsWithAction];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self layoutButtons];
}


#pragma mark - Private Method

- (void)layoutButtons
{
    for (PSRadioButton *button in self.buttonsWithAction)
    {
        NSInteger index = [self.buttonsWithAction indexOfObject:button];
        button.frame = CGRectMake(ButtonMargin, (ButtonWidth + (ButtonWidth * index) + ButtonMargin) , ButtonWidth, ButtonWidth);
    }
}



@end
