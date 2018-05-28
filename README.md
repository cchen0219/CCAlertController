# CCAlertController

从ios8之后,系统的弹框    UIAlertView 与  UIActionSheet 两个并在一起了, 使用了一个新的控制器叫 UIAlertController



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
