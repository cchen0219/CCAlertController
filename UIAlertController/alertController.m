//
//  alertController.m
//  UIAlertController
//
//  Created by 陈诚 on 16/7/15.
//  Copyright © 2016年 陈诚. All rights reserved.
//

#import "alertController.h"


@interface alertController ()

@property (nonatomic, weak)  UIAlertAction *secureTextAlertAction;


@end

@implementation alertController



+ (instancetype)alertControllerWithAlertTitle:(NSString *)title Message:(NSString *)message leftButtonTitle:(NSString *)leftButtonTitle rightButtonTitle:(NSString *)rightButtonTitle leftButtonBlock:(void(^)())leftButtonBlock rightButtonBlock:(void(^)())rightButtonBlock{
    
    
    alertController *Cooller = [alertController alertControllerWithTitle: title
                                                                             message: message
                                                                      preferredStyle: UIAlertControllerStyleAlert];
  
    
    [Cooller addAction:[UIAlertAction actionWithTitle: NSLocalizedString(leftButtonTitle, nil)
                                                        style: UIAlertActionStyleCancel
                                                      handler: ^(UIAlertAction * _Nonnull action) {
                                                          leftButtonBlock();
                                                      }]];
    
    
    [Cooller addAction:[UIAlertAction actionWithTitle: NSLocalizedString(rightButtonTitle, nil)
                                                        style: UIAlertActionStyleDefault
                                                      handler: ^(UIAlertAction * _Nonnull action) {
                                                          
                                                          rightButtonBlock();
                                                      }]];
    
    return Cooller;
    
}


+ (instancetype)alertControllerWithActionSheetTitle:(NSString *)title Message:(NSString *)message  otherButtonTitle:(NSArray *)otherButtonArray Buttonclick:(void(^)(NSString *buttonTitle))Buttonclick{
    
    
    alertController *Cooller = [alertController alertControllerWithTitle: title
                                                                 message: message
                                                          preferredStyle: UIAlertControllerStyleActionSheet];
    
    
    [Cooller addAction:[UIAlertAction actionWithTitle: NSLocalizedString(@"取消", nil)
                                                style: UIAlertActionStyleCancel
                                              handler: ^(UIAlertAction * _Nonnull action) {

                                              }]];
    
    
    for (int i = 0; i < otherButtonArray.count; i ++) {
        
        [Cooller addAction:[UIAlertAction actionWithTitle: NSLocalizedString(otherButtonArray[i], nil)
                                                    style: UIAlertActionStyleDefault
                                                  handler: ^(UIAlertAction * _Nonnull action) {
                                                                                                            
                                                      Buttonclick(action.title);
                                                  }]];
        
    }
    
    return Cooller;

}


+ (instancetype)alertControllerWithAlertAndTextFieldTitle:(NSString *)title Message:(NSString *)message  textFieldPlaceholder:(NSString *)placeholder  leftButtonTitle:(NSString *)leftButtonTitle rightButtonTitle:(NSString *)rightButtonTitle  leftButtonBlock:(void(^)())leftButtonBlock rightButtonBlock:(void(^)(NSString *textFieldString))rightButtonBlock{
    
    
    alertController *Cooller = [alertController alertControllerWithTitle: title
                                                                 message: message
                                                          preferredStyle: UIAlertControllerStyleAlert];
    
    [Cooller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = placeholder;
        
        
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
    
    
    }];
    
    
    [Cooller addAction:[UIAlertAction actionWithTitle: NSLocalizedString(leftButtonTitle, nil)
                                                style: UIAlertActionStyleCancel
                                              handler: ^(UIAlertAction * _Nonnull action) {
                                                  leftButtonBlock();
                                                  
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:Cooller.textFields.firstObject];

                                              }]];
    
    
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle: NSLocalizedString(rightButtonTitle, nil)
                                                style: UIAlertActionStyleDefault
                                              handler: ^(UIAlertAction * _Nonnull action) {
                                                  
                                                  
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:Cooller.textFields.firstObject];

                                                  // 读取文本框的值显示出来
//                                                  textFields 这是一个数组 如果有两个textfield ，按数组下标取值
                        UITextField *userInput = Cooller.textFields.firstObject;
                                                  
                                                  rightButtonBlock(userInput.text);

                                                  
                                              }];
    
    
//    self.secureTextAlertAction = rightAction;
    
    [Cooller addAction:rightAction];
    
    return Cooller;
    
}


- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
   
    NSLog(@"what %@",notification);
    
//    UITextField *textField = notification.object;
    
    
//    NSLog(@"这个值是什么  %@",textField.text);
    
    // Enforce a minimum length of >= 5 characters for secure text alerts.
//    self.secureTextAlertAction.enabled = textField.text.length >= 5;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
