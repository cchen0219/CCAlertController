//
//  ViewController.m
//  UIAlertController
//
//  Created by 陈诚 on 16/7/11.
//  Copyright © 2016年 陈诚. All rights reserved.
//
/**
 *  从ios8之后,系统的弹框    UIAlertView 与  UIActionSheet 两个并在一了起, 使用了一个新的控制器叫 UIAlertController
 */
#import "ViewController.h"
#import "alertController.h"

@interface ViewController ()

@property (nonatomic, weak)  UIAlertAction  *secureTextAlertAction;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    btn.frame = CGRectMake(100, 100, 200, 50);
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"Alert" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(AlertT) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    UIButton *redColorbtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    redColorbtn.frame = CGRectMake(100, 200, 200, 50);
    redColorbtn.backgroundColor = [UIColor redColor];
    [redColorbtn setTitle:@"AlertAndtextfield" forState:UIControlStateNormal];

    [redColorbtn addTarget:self action:@selector(textFieldabc) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:redColorbtn];
    
    
    UIButton *Colorbtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    Colorbtn.frame = CGRectMake(100, 300, 200, 50);
    Colorbtn.backgroundColor = [UIColor brownColor];
    [Colorbtn setTitle:@"actionSheet" forState:UIControlStateNormal];

    [Colorbtn addTarget:self action:@selector(actionSheet) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:Colorbtn];

   
}

 



- (void)showSecureTextEntryAlert {
    NSString *title = NSLocalizedString(@"A Short Title Is Best", nil);
    NSString *message = NSLocalizedString(@"A message should be a short, complete sentence.", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"OK", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Add the text field for the secure text entry.
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // Listen for changes to the text field's text so that we can toggle the current
        // action's enabled property based on whether the user has entered a sufficiently
        // secure entry.
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
        
        textField.secureTextEntry = YES;
    }];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The \"Secure Text Entry\" alert's cancel action occured.");
        
        // Stop listening for text changed notifications.
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The \"Secure Text Entry\" alert's other action occured.");
        
        // Stop listening for text changed notifications.
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
    }];
    
    // The text field initially has no text in the text field, so we'll disable it.
    otherAction.enabled = NO;
    
    // Hold onto the secure text alert action to toggle the enabled/disabled state when the text changed.
    self.secureTextAlertAction = otherAction;
    
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
    UITextField *textField = notification.object;
    
    // Enforce a minimum length of >= 5 characters for secure text alerts.
    self.secureTextAlertAction.enabled = textField.text.length >= 5;
}


- (void)textFieldabc{
    
    alertController *abc = [alertController alertControllerWithAlertAndTextFieldTitle:@"标题" Message:@"123" textFieldPlaceholder:@"请输入·······" leftButtonTitle:@"取消" rightButtonTitle:@"确定" leftButtonBlock:^{
        
    } rightButtonBlock:^(NSString *textFieldString) {
        
        NSLog(@"--------->看看是什么鬼 %@",textFieldString);
        
    }];
    
    [self presentViewController:abc  animated:YES completion:nil];
    
}

- (void)actionSheet{
    
    NSArray *arr = @[@"btn1",@"btn2",@"btn3"];
    alertController *abc = [alertController alertControllerWithActionSheetTitle:@"标题" Message:@"123" otherButtonTitle:arr Buttonclick:^(NSString *buttonTitle) {
        NSLog(@"------ > %@",buttonTitle);
        
        if ([buttonTitle isEqualToString:@"btn1"]) {
            NSLog(@"btn1");
        }else if ([buttonTitle isEqualToString:@"btn2"]){
            
            NSLog(@"btn2");
        }else{
            
            NSLog(@"btn3");
        }
    
    }];
    
    [self presentViewController:abc animated:YES completion:nil];
}


- (void)AlertT{
    
    alertController *abc =  [alertController alertControllerWithAlertTitle:@"标题" Message:@"消息" leftButtonTitle:@"取消" rightButtonTitle:@"确定" leftButtonBlock:^{
        
        NSLog(@"取消");
        
    } rightButtonBlock:^{
        NSLog(@"确定");
    }];
    
    [self presentViewController:abc animated:YES completion:nil];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
