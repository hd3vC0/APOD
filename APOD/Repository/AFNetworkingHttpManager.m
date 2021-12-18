//
//  HttpRequestManager.m
//  APOD
//
//  Created by Humberto Monterrosa on 17/12/21.
//

#import "AFNetworkingHttpManager.h"
#import "AFNetworking.h"

@interface AFNetworkingHttpManager()


@end

@implementation AFNetworkingHttpManager

- (id)init{
    self = [super init];
    return self;
}

- (void)makeRequestTo:(NSString * _Nonnull)url withMethod:(NSString * _Nonnull)method withParameters:(NSDictionary * _Nullable)parameters onSuccess:(void (^ _Nullable)(id _Nonnull))success onFailure:(void (^ _Nonnull)(NSError * _Nullable))failure {
    AFHTTPSessionManager *  sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[[NSURL alloc] initWithString:url]];

    
    [[sessionManager dataTaskWithHTTPMethod:method URLString:url parameters:parameters headers:nil uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
            NSLog(@"Error");
        }] resume];
}

@end
