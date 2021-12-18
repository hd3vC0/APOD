//
//  HttpRequestManager.h
//  APOD
//
//  Created by Humberto Monterrosa on 17/12/21.
//

#import <Foundation/Foundation.h>
#import "../Gateways/HttpRequestManagerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AFNetworkingHttpManager : NSObject <HttpRequestManagerDelegate>

@end

NS_ASSUME_NONNULL_END
