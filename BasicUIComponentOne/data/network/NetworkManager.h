//
//  NetworkManager.h
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/20/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#ifndef NetworkManager_h
#define NetworkManager_h
@interface NetworkManager : NSObject
+(NSDictionary *)parseJsonResponse:(NSString *)urlString;
@end


#endif /* NetworkManager_h */
