//
//  LABDateViewController.h
//  labsPopovers
//
//  Created by Marcin Pędzimąż on 17.09.2014.
//  Copyright (c) 2014 Marcin Pedzimaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LABDateViewController : UIViewController

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end
