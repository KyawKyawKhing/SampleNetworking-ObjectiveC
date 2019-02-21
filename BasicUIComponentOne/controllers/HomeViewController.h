//
//  HomeViewController.h
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/20/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSString *name;
@property (weak, nonatomic) IBOutlet UITableView *tvNotice;
@end

NS_ASSUME_NONNULL_END
