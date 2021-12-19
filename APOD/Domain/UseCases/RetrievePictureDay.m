//
//  RetrievePictureDay.m
//  APOD
//
//  Created by Humberto Monterrosa on 19/12/21.
//

#import "RetrievePictureDay.h"

@implementation RetrievePictureDay

+(instancetype)sharedIntance{
   static dispatch_once_t once;
   static id sharedInstance;
   dispatch_once(&once, ^{
       sharedInstance = [[self alloc] init];
   });
   return sharedInstance;
}

- (id)initWithService:(id<APODServiceDelegate>)service{
    self = [super init];
    [self setApodDelegate:service];
    return self;
}

-(void)getPictureOfDay:(NSString *)day onSuccess:(void (^)(AstronomyPicture * _Nonnull))success onFailure:(void (^)(NSError * _Nonnull))failure{
    
    [self.apodDelegate getPictureOfDay:day onSuccess:^(NSDictionary * _Nonnull response) {
        
        AstronomyPictureResponse * value = [[AstronomyPictureResponse alloc]init];
        [value setValuesForKeysWithDictionary:response];
        
        AstronomyPicture* item = [[AstronomyPicture alloc]init];
        [item setTitle: value.title];
        [item setDate: value.date];
        [item setPicture: value.hdurl];
        [item setThumbnail: value.url];
        [item setTextDescription: value.explanation];
        [item setCopyright: value.copyright];
        
        success(item);
        
    } onFailure:^(NSError * _Nonnull error) {
        failure(error);
    }];
        
}

@end
