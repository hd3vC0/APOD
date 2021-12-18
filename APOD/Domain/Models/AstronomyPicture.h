//
//  AstronomyPicture.h
//  APOD
//
//  Created by Humberto Monterrosa on 16/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AstronomyPicture : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * thumbnail;
@property (nonatomic, strong) NSString * picture;
@property (nonatomic, strong) NSString * textDescription;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSString * copyright;


@end

NS_ASSUME_NONNULL_END
