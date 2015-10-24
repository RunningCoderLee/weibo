//
//  KLMainViewController.m
//  weibo
//
//  Created by Kevin on 10/19/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "KLMainViewController.h"
#import "KLDiscoverController.h"
#import "KLHomeController.h"
#import "KLProfileController.h"
#import "KLMessageController.h"

@interface KLMainViewController ()

@end

@implementation KLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KLHomeController *homeC = [[KLHomeController alloc] init];
    [self addChildViewController:homeC
                           title:@"首页"
                      imageNamed:@"tabbar_home"
              selectedImageNamed:@"tabbar_home_selected"];
    
    KLMessageController *messageC = [[KLMessageController alloc] init];
    [self addChildViewController:messageC
                           title:@"消息"
                      imageNamed:@"tabbar_message_center"
              selectedImageNamed:@"tabbar_message_center_selected"];
    
    KLDiscoverController *discoverC = [[KLDiscoverController alloc] init];
    [self addChildViewController:discoverC
                           title:@"发现"
                      imageNamed:@"tabbar_discover"
              selectedImageNamed:@"tabbar_discover_selected"];
    
    KLProfileController *profileC = [[KLProfileController alloc] init];
    [self addChildViewController:profileC
                           title:@"我"
                      imageNamed:@"tabbar_profile"
              selectedImageNamed:@"tabbar_profile_selected"];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)addChildViewController:(UIViewController *)childController
                         title:(NSString *)title
                    imageNamed:(NSString *)image
            selectedImageNamed:(NSString *)selectedImage {

    childController.view.backgroundColor = [UIColor redColor];
    childController.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *normalTextAttr = [NSMutableDictionary dictionary];
    normalTextAttr[NSForegroundColorAttributeName] = [UIColor colorWithRed:112/255.0
                                                                     green:112/255.0
                                                                      blue:112/255.0
                                                                     alpha:1];
    [childController.tabBarItem setTitleTextAttributes:normalTextAttr
                                              forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedTextAttr = [NSMutableDictionary dictionary];
    selectedTextAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childController.tabBarItem setTitleTextAttributes:selectedTextAttr
                                              forState:UIControlStateSelected];
    
    
    UINavigationController *navC = [[UINavigationController alloc]
                                    initWithRootViewController:childController];
    
    [self addChildViewController:navC];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}





@end
