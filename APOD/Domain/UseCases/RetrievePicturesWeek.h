//
//  RetrievePhotosWeek.h
//  APOD
//
//  Created by Humberto Monterrosa on 16/12/21.
//

#import <Foundation/Foundation.h>
#import "../../Gateways/APODServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface RetrievePicturesWeek : NSObject

@property (nonatomic,strong)id<APODServiceDelegate> apodDelegate;

+ (instancetype)sharedIntance;
- (id) initWithService:(id<APODServiceDelegate>)service;
- (AstronomyPicture *) getPicturesFrom:(NSString *)startDate until:(NSString *)endDate;

@end

NS_ASSUME_NONNULL_END
