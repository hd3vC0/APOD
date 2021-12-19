//
//  UINavigationController+Orientation.m
//  APOD
//
//  Created by Humberto Monterrosa on 19/12/21.
//

#import "UINavigationController+Orientation.h"

@implementation UINavigationController (Orientation)

- (NSUInteger)supportedInterfaceOrientations {
   return [self.topViewController supportedInterfaceOrientations];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
