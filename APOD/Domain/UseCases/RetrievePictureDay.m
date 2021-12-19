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
    
    [self.apodDelegate getPictureOfDay:day onSuccess:^(AstronomyPicture * _Nonnull response) {
        
        success(response);
        
    } onFailure:^(NSError * _Nonnull error) {
        failure(error);
    }];
        
}

@end
