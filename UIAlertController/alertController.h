//
//  alertController.h
//  UIAlertController
//
//  Created by 陈诚 on 16/7/15.
//  Copyright © 2016年 陈诚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface alertController : UIAlertController

/**
 *  Alert
 *
 *  @param title            标题
 *  @param message          信息
 *  @param leftButtonTitle  左边的按钮
 *  @param rightButtonTitle 右边的按钮
 *  @param leftButtonBlock  左边按钮点击回调事件
 *  @param rightButtonBlock 右边按钮点击回调时间
 *
 *  @return 返回一个 alertController
 */
+ (instancetype)alertControllerWithAlertTitle:(NSString *)title Message:(NSString *)message leftButtonTitle:(NSString *)leftButtonTitle rightButtonTitle:(NSString *)rightButtonTitle leftButtonBlock:(void(^)())leftButtonBlock rightButtonBlock:(void(^)())rightButtonBlock;

/**
 *  ActionSheet
 *
 *  @param title            标题
 *  @param message          信息
 *  @param otherButtonArray 按钮数组
 *  @param Buttonclick      按钮点击回调时间
 *
 *  @return 返回一个 alertController
 */
+ (instancetype)alertControllerWithActionSheetTitle:(NSString *)title Message:(NSString *)message  otherButtonTitle:(NSArray *)otherButtonArray Buttonclick:(void(^)(NSString *buttonTitle))Buttonclick;

/**
 *  AlertAndTextField
 *
 *  @param title            标题
 *  @param message          信息
 *  @param placeholder      提示信息
 *  @param leftButtonTitle  左边的按钮
 *  @param rightButtonTitle 右边的按钮
 *  @param leftButtonBlock  左边按钮点击回调事件
 *  @param rightButtonBlock 右边按钮点击回调事件
 *
 *  @return 返回一个 alertController
 */
+ (instancetype)alertControllerWithAlertAndTextFieldTitle:(NSString *)title Message:(NSString *)message  textFieldPlaceholder:(NSString *)placeholder  leftButtonTitle:(NSString *)leftButtonTitle rightButtonTitle:(NSString *)rightButtonTitle  leftButtonBlock:(void(^)())leftButtonBlock rightButtonBlock:(void(^)(NSString *textFieldString))rightButtonBlock;

@end
