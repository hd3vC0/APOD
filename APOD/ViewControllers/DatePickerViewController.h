//
//  DatePickerViewController.h
//  APOD
//
//  Created by Humberto Monterrosa on 19/12/21.
//

#import <UIKit/UIKit.h>
#import "DatePickerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface DatePickerViewController : UIViewController

@property (nonatomic, strong) NSDate * maximunDate;
@property (nonatomic, strong) NSDate * minimunDate;
@property (nonatomic, strong) id<DatePickerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
