//
//  ConfigServices.m
//  APOD
//
//  Created by Humberto Monterrosa on 17/12/21.
//

#import "ConfigServices.h"
#import "../Services/APOD/APODService.h"
#import "../Repository/AFNetworkingHttpManager.h"

@implementation ConfigServices

+(void) registerServices{
    AFNetworkingHttpManager * httpRequestManager = [[AFNetworkingHttpManager alloc]init];
    [[APODService sharedIntance] setManager:httpRequestManager];
}

@end
