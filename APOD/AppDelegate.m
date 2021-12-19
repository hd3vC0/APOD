//
//  AppDelegate.m
//  APOD
//
//  Created by Humberto Monterrosa on 15/12/21.
//

#import "AppDelegate.h"
#import "ViewControllers/HomeViewController.h"
#import "Configurations/ConfigServices.h"
#import "Configurations/ConfigUseCases.h"
#import "Category/UINavigationController+Orientation.h"


@interface AppDelegate ()

-(void) loadConfigurations;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self loadConfigurations];
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UIViewController * vc = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = self.navigationController;
    
    [self.window makeKeyAndVisible];

    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setTranslucent:NO];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

#pragma mark - Load configirations
-(void)loadConfigurations{
    [ConfigServices registerServices];
    [ConfigUseCases registerUseCases];
}

@end
