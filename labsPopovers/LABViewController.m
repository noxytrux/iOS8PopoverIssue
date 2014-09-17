//
//  ViewController.m
//  labsPopovers
//
//  Created by Marcin Pędzimąż on 17.09.2014.
//  Copyright (c) 2014 Marcin Pedzimaz. All rights reserved.
//

#import "LABViewController.h"
#import "LABDateViewController.h"

static NSString * const LABDisplayTimePopoverSegueIdentifier = @"LABDisplayTimePopoverSegueIdentifier";

@interface LABViewController () <UIPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (strong, nonatomic) NSDate *currentDate;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
//@property (strong, nonatomic) UIPopoverController *chooseTimePopover;

@end

@implementation LABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:LABDisplayTimePopoverSegueIdentifier]) {
        
        if (!self.currentDate) {
            
            self.currentDate = [NSDate date];
        }
        
        UIStoryboardPopoverSegue *popover = (UIStoryboardPopoverSegue*)segue;
        //comment this one and uncomment the rest of code to fix all the problems 
        popover.popoverController.delegate = self;
//        self.chooseTimePopover = popover.popoverController;
//        self.chooseTimePopover.delegate = self;

        LABDateViewController *c = (LABDateViewController *)popover.popoverController.contentViewController;
        
//        __unused UIView *view = c.view; // or (void)c.view;

        [c.datePicker setDate:self.currentDate animated:YES];
    }
}

#pragma mark - popover delegate

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController;
{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    //update title
    LABDateViewController *vc = (LABDateViewController*)popoverController.contentViewController;
    
    self.currentDate = vc.date;
    
    NSAssert(self.currentDate != nil, @"Upsss...");
    
    NSString *title = [self.dateFormatter stringFromDate:self.currentDate];
    
    [self.dateButton setTitle:title
                     forState:UIControlStateNormal];
}

@end
