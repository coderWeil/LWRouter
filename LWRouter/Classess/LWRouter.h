//
//  LWRouter.h
//  LWRouterDemo
//
//  Created by weil on 2018/11/17.
//  Copyright © 2018 allyoga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//跳转分模态和push两种
typedef NS_ENUM(NSUInteger, YGRouterJumpType) {
    YGRouterJumpTypePush,
    YGRouterJumpTypeModal
};
@interface LWRouter : NSObject
//通过硬编码获取类
+ (UIViewController *)router_getControllerFromClass:(NSString *)classNam;
/*跳转到目标类
 *destinationVc:目标控制器
 *sourceVc:源控制器
 *jumpType:跳转类型
 *animaiton:跳转是否需要动画
 *params:跳转到目标界面需要的参数
 */
+ (void)router_jumpToDestination:(UIViewController *)destinationVc from:(UIViewController *)sourceVc jumpType:(YGRouterJumpType)jumpType animation:(BOOL)animation params:(id)params;
/*跳转到目标类
 *destinationVc:目标控制器
 *sourceVc:源控制器
 *jumpType:跳转类型
 *animaiton:跳转是否需要动画
 *params:跳转到目标界面需要的参数
 *callback:回调目标界面传回给源界面的值
 */
+ (void)router_jumpToDestination:(UIViewController *)destinationVc from:(UIViewController *)sourceVc jumpType:(YGRouterJumpType)jumpType animation:(BOOL)animation params:(id)params callback:(void(^)(id callback))callback;

+ (void)router_jumpToDestinationWithName:(NSString *)destination from:(UIViewController *)sourceVc jumpType:(YGRouterJumpType)jumpType animation:(BOOL)animation params:(id)params;

+ (void)router_jumpToDestinationWithName:(NSString *)destination from:(UIViewController *)sourceVc jumpType:(YGRouterJumpType)jumpType animation:(BOOL)animation params:(id)params callback:(void(^)(id callback))callback;

@end
