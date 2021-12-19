//
//  DatePickerDelegate.h
//  APOD
//
//  Created by Humberto Monterrosa on 19/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DatePickerDelegate <NSObject>
- (void) onDone:(NSDate *)date;
@end

NS_ASSUME_NONNULL_END
