//
//  RetrievePictureDay.h
//  APOD
//
//  Created by Humberto Monterrosa on 19/12/21.
//

#import <Foundation/Foundation.h>
#import "../../Services/APOD/APODService.h"

NS_ASSUME_NONNULL_BEGIN

@interface RetrievePictureDay : NSObject

@property (nonatomic,strong)id<APODServiceDelegate> apodDelegate;

+ (instancetype)sharedIntance;
- (id) initWithService:(id<APODServiceDelegate>)service;
- (void) getPictureOfDay:(NSString *)day
                onSuccess:(void (^ _Nonnull)(AstronomyPicture * _Nonnull response))success onFailure:(void (^ _Nonnull)(NSError * _Nonnull error))failure;



@end

NS_ASSUME_NONNULL_END
