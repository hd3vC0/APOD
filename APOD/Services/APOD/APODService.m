//
//  APODService.m
//  APOD
//
//  Created by Humberto Monterrosa on 16/12/21.
//

#import "APODService.h"
#import "../../Gateways/HttpRequestManagerDelegate.h"
#import "../../Configurations/Constants.h"

@implementation APODService

+(instancetype)sharedIntance{
   static dispatch_once_t once;
   static id sharedInstance;
   dispatch_once(&once, ^{
       sharedInstance = [[self alloc] init];
   });
   return sharedInstance;
}

- (id)initWith:(id<HttpRequestManagerDelegate>)manager{
    self = [[APODService alloc]init];
    [self setManager:manager];
    return(self);
}

- (void)getPicturesFrom:(nonnull NSString *)startDate until:(nonnull NSString *)endDate {
    
    [[self manager]makeRequestTo:API_ENDPOINT withMethod:MethodGET onSuccess:^(id  _Nonnull response) {
            NSLog(@"OK Success");
        } onFailure:^(id  _Nonnull error) {
            NSLog(@":( Failure");
        }];
}

@end
