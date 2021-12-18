//
//  HttpRequestManagerDelegate.h
//  APOD
//
//  Created by Humberto Monterrosa on 17/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define MethodPOST @"POST"
#define MethodGET  @"GET"

@protocol HttpRequestManagerDelegate <NSObject>
@optional
-(void) initializer;
@required
-(void) makeRequestTo:(NSString * _Nonnull)url
            withMethod:(NSString * _Nonnull)method
            withParameters:(NSDictionary * _Nullable)parameters
            onSuccess:(void (^_Nullable)(id response))success onFailure:(void (^_Nonnull)(NSError * _Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
