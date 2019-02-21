//
//  Utils.m
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/21/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import <UIKit/UIKit.h>

@implementation Utils

-(void) showAlert:(UIViewController *)vc title:(NSString *)title andMessage:(NSString *)message{
    UIAlertController *uiAlertController = [UIAlertController
                                            alertControllerWithTitle:title
                                            message:message
                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@("OK")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * _Nonnull action) {
                                   NSLog(@"Clicked OK");
                               }];
    
    
    [uiAlertController addAction:okAction];
    [vc presentViewController:uiAlertController animated:true completion:nil];
}

@end


