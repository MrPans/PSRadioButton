//
//  PSDemoTwoViewController.m
//  PSRadioButton
//
//  Created by Pan on 16/3/19.
//  Copyright © 2016年 Sheng Pan. All rights reserved.
//

#import "PSDemoTwoViewController.h"

// NOTICE: #import "PROJECT_NAME-Swift.h" File to use PSRadioButton
#import "PSRadioButton-Swift.h"

NSInteger const MaleTag = 1;
NSInteger const FemaleTag = 2;

@interface PSDemoTwoViewController () <PSRadioGroupDelegate>

@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (strong, nonatomic) IBOutletCollection(PSRadioButton) NSArray *radioButtons;
@property (nonatomic, strong) PSRadioGroup *radioGroup;


@end

@implementation PSDemoTwoViewController

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // initialze PSRadioGroup with buttons,and set delegate to self
    self.radioGroup = [[PSRadioGroup alloc] initWithRadioButtons:self.radioButtons];
    self.radioGroup.delegate = self;
}


#pragma mark - PSRadioGroupDelegate
// do everything you want in delegate
- (void)radioGroup:(PSRadioGroup *)radioGroup didSeletedRadioButotn:(PSRadioButton *)radioButton
{
    if (radioButton.tag == MaleTag)
    {
        self.tipsLabel.text = @"选择了:男";
    }
    else if (radioButton.tag == FemaleTag)
    {
        self.tipsLabel.text = @"选择了:女";
    }
}
@end
