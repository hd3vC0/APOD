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
- (void) getPicturesFrom:(NSString *)startDate until:(NSString *)endDate
                onSuccess:(void (^ _Nonnull)(NSArray<AstronomyPicture *> * _Nonnull response))success onFailure:(void (^ _Nonnull)(NSError * _Nonnull error))failure;

@end

NS_ASSUME_NONNULL_END
