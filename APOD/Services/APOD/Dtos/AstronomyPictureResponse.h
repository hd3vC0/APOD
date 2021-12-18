//
//  AstronomyPictureResponse.h
//  APOD
//
//  Created by Humberto Monterrosa on 18/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AstronomyPictureResponse : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSString * hdurl;
@property (nonatomic, strong) NSString * explanation;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSString * copyright;
@property (nonatomic, strong) NSString * media_type;
@property (nonatomic, strong) NSString * service_version;

@end

NS_ASSUME_NONNULL_END
