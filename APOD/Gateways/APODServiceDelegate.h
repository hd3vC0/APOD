//
//  APODServiceDelegate.h
//  APOD
//
//  Created by Humberto Monterrosa on 17/12/21.
//

#import <Foundation/Foundation.h>
#import "../Domain/Models/AstronomyPicture.h"

NS_ASSUME_NONNULL_BEGIN

@protocol APODServiceDelegate <NSObject>

@required

- (void)getPicturesFrom:(NSString *)startDate until:(NSString *)endDate;

@end

NS_ASSUME_NONNULL_END
