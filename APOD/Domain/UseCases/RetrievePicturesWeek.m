//
//  RetrievePhotosWeek.m
//  APOD
//
//  Created by Humberto Monterrosa on 16/12/21.
//

#import "RetrievePicturesWeek.h"
#import "../../Gateways/APODServiceDelegate.h"

@implementation RetrievePicturesWeek

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

-(void)getPicturesFrom:(NSString *)startDate until:(NSString *)endDate onSuccess:(void (^)(NSArray<AstronomyPicture *> * _Nonnull))success onFailure:(void (^)(NSError * _Nonnull))failure {
    
    [self.apodDelegate getPicturesFrom:startDate until:endDate onSuccess:^(NSArray * _Nonnull response) {
        success(response);
    } onFailure:^(NSError * _Nonnull error) {
        failure(error);
    }];
    
}

@end
