//
//  APODService.m
//  APOD
//
//  Created by Humberto Monterrosa on 16/12/21.
//

#import "APODService.h"
#import "../../Gateways/HttpRequestManagerDelegate.h"
#import "../../Configurations/Constants.h"
#import "Dtos/AstronomyPictureResponse.h"

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

- (void)getPicturesFrom:(nonnull NSString *)startDate until:(nonnull NSString *)endDate onSuccess:(void (^ _Nonnull)(NSArray * _Nonnull))success onFailure:(void (^ _Nonnull)(NSError * _Nonnull))failure{
    
    NSDictionary * parameters = @{@"api_key": API_KEY, @"start_date": startDate, @"end_date":endDate};
    
    [[self manager] makeRequestTo:API_ENDPOINT withMethod:MethodGET withParameters:parameters onSuccess:^(id  _Nonnull response) {        
        
        NSMutableArray * res = [[NSMutableArray alloc] init];
        
        for(id value in response){
            AstronomyPictureResponse * item = [[AstronomyPictureResponse alloc] init];
            [item setValuesForKeysWithDictionary:value];
            [res addObject:item];
        }
        
        success(res);
        
    } onFailure:^(NSError * _Nullable error) {
        failure(error);
    }];
}

@end
