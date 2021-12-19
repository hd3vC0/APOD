//
//  APODServiceDelegate.h
//  APOD
//
//  Created by Humberto Monterrosa on 17/12/21.
//

#import <Foundation/Foundation.h>
#import "../Domain/Models/AstronomyPicture.h"
#import "../Services/APOD/Dtos/AstronomyPictureResponse.h"

NS_ASSUME_NONNULL_BEGIN

@protocol APODServiceDelegate <NSObject>

@required

- (void)getPicturesFrom:(NSString *)startDate until:(NSString *)endDate onSuccess:(void (^ _Nonnull)(NSArray * response))success onFailure:(void (^_Nonnull)(NSError * error))failure;

- (void)getPictureOfDay:(NSString *)day onSuccess:(void (^ _Nonnull)(AstronomyPicture * response))success onFailure:(void (^_Nonnull)(NSError * error))failure;

@end

NS_ASSUME_NONNULL_END
