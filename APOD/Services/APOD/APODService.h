//
//  APODService.h
//  APOD
//
//  Created by Humberto Monterrosa on 16/12/21.
//

#import <Foundation/Foundation.h>
#import "../../Gateways/APODServiceDelegate.h"
#import "../../Gateways/HttpRequestManagerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface APODService<APODServiceDelegate> : NSObject <APODServiceDelegate>

@property (nonatomic, strong) id<HttpRequestManagerDelegate> manager;

+(instancetype)sharedIntance;
-(id)initWith:(id<HttpRequestManagerDelegate>) manager;
@end

NS_ASSUME_NONNULL_END
