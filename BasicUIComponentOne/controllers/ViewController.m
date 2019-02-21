//
//  ViewController.m
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/19/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import "Utils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)onClickLoginButton:(UIButton *)sender {
    
    NSLog(@"Username : %@ %s %@",self.tfUsername.text,"\nPassword : ",self.tfPassword.text);
    
    Utils *utils = [[Utils alloc]init];
    if (![self.tfUsername.text  isEqual:@""] && ![self.tfPassword.text isEqual:@""]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        UINavigationController *navigationVC = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        HomeViewController *homeVC = navigationVC.childViewControllers.firstObject;
        homeVC.name = self.tfUsername.text;
        
        self.tfUsername.text = @"";
        self.tfPassword.text = @"";
        
        [self presentViewController:navigationVC animated:true completion:nil];
    }else{
        [utils showAlert:self title:@"Login Failed" andMessage:@"Username or Password is wrong"];
    }


}

@end
