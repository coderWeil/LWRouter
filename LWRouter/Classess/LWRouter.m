//
//  LWRouter.m
//  LWRouterDemo
//
//  Created by weil on 2018/11/17.
//  Copyright © 2018 allyoga. All rights reserved.
//

#import "LWRouter.h"

@implementation LWRouter
+ (UIViewController *)router_getControllerFromClass:(NSString *)classNam {
    Class class = NSClassFromString(classNam);
    return [[class alloc] init];
}
+ (void)router_jumpToDestination:(UIViewController *)destinationVc from:(UIViewController *)sourceVc jumpType:(YGRouterJumpType)jumpType animation:(BOOL)animation params:(id)params {
    [self router_jumpToDestination:destinationVc from:sourceVc jumpType:jumpType animation:animation params:params callback:nil];
}
+ (void)router_jumpToDestinationWithName:(NSString *)destination from:(UIViewController *)sourceVc jumpType:(YGRouterJumpType)jumpType animation:(BOOL)animation params:(id)params {
    UIViewController *destinationVc = [self router_getControllerFromClass:destination];
    [self router_jumpToDestination:destinationVc from:sourceVc jumpType:jumpType animation:animation params:params];
}

+ (void)router_jumpToDestinationWithName:(NSString *)destination from:(UIViewController *)sourceVc jumpType:(YGRouterJumpType)jumpType animation:(BOOL)animation params:(id)params callback:(void(^)(id callback))callback {
    UIViewController *destinationVc = [self router_getControllerFromClass:destination];
    [self router_jumpToDestination:destinationVc from:sourceVc jumpType:jumpType animation:animation params:params callback:callback];
}
+ (void)router_jumpToDestination:(UIViewController *)destinationVc from:(UIViewController *)sourceVc jumpType:(YGRouterJumpType)jumpType animation:(BOOL)animation params:(id)params callback:(void(^)(id callback))callback {
    if (params) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        [destinationVc performSelector:@selector(router_params:) withObject:params];
#pragma clang diagnostic pop
    }
    if (callback) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        [destinationVc performSelector:@selector(router_callback:) withObject:callback];
#pragma clang diagnostic pop
    }
    if (jumpType == YGRouterJumpTypePush) {
        [sourceVc.navigationController pushViewController:destinationVc animated:animation];
    }else {
        [sourceVc presentViewController:destinationVc animated:animation completion:nil];
    }
}

@end
