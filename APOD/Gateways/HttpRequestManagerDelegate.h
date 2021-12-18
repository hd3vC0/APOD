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

-(void) initializer;
-(void) makeRequestTo:(NSString *)url
            withMethod:(NSString *)method
            onSuccess:(void (^_Nullable)(id response))success onFailure:(void (^_Nonnull)(id error))failure;

@end

NS_ASSUME_NONNULL_END
