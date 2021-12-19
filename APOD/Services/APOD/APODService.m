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
#import "../../Domain/Models/AstronomyPicture.h"

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
            AstronomyPicture* temp = [[AstronomyPicture alloc]init];
            [temp setTitle: item.title];
            [temp setDate: item.date];
            [temp setPicture: item.hdurl];
            [temp setThumbnail: item.url];
            [temp setTextDescription: item.explanation];
            [temp setCopyright: item.copyright];

            [res addObject:temp];
        }
        
        success(res);
        
    } onFailure:^(NSError * _Nullable error) {
        failure(error);
    }];
}

-(void)getPictureOfDay:(NSString *)day onSuccess:(void (^)(AstronomyPicture * _Nonnull))success onFailure:(void (^)(NSError * _Nonnull))failure{
    
    NSDictionary * parameters = @{@"api_key": API_KEY, @"date": day};
    
    [[self manager] makeRequestTo:API_ENDPOINT withMethod:MethodGET withParameters:parameters onSuccess:^(id  _Nonnull response) {
        
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
        
    } onFailure:^(NSError * _Nullable error) {
        failure(error);
    }];
    
}

@end
