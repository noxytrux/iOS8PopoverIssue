//
//  LABDateViewController.m
//  labsPopovers
//
//  Created by Marcin Pędzimąż on 17.09.2014.
//  Copyright (c) 2014 Marcin Pedzimaz. All rights reserved.
//

#import "LABDateViewController.h"

@implementation LABDateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.datePicker addTarget:self
                        action:@selector(didChangeDate:)
              forControlEvents:UIControlEventValueChanged];
}

- (NSDate *)date
{
    return self.datePicker.date;
}

- (void)setDate:(NSDate *)date
{
    [self.datePicker setDate:date animated:YES];
}

- (void)didChangeDate:(UIDatePicker *)picker
{
    //send date somewhere, update, watewa
}

@end
