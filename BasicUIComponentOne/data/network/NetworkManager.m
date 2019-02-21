//
//  NetworkManager.m
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/20/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NetworkManager.h"
#import "Utils.h"

@implementation NetworkManager

+(NSDictionary *)parseJsonResponse:(NSString *)urlString
{
    NSError *error;
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse: nil error:&error];
    if (!data)
    {
        NSLog(@"Download Error: %@", error.localizedDescription);
        return nil;
    }
    
    // Parse the (binary) JSON data from the web service into an NSDictionary object
    NSDictionary *JSON =
    [NSJSONSerialization JSONObjectWithData: data
                                    options: NSJSONReadingMutableContainers
                                      error: &error];
    NSLog(@"Network Response : %@", JSON[@"notice_list"]);
    return JSON[@"notice_list"];
}

-(void) getData{
    // making a GET request to /init
    NSString *targetUrl = [NSString stringWithFormat:@"%@/init",""];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:targetUrl]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          
          NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
          NSLog(@"Data received: %@", myString);
      }] resume];
}

-(void) postData{
    // making a POST request to /init
    NSString *targetUrl = [NSString stringWithFormat:@"%s/init", "baseUrl"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    //Make an NSDictionary that would be converted to an NSData object sent over as JSON with the request body
    NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
                         @"basic_attribution", @"scenario_type",
                         nil];
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:tmp options:0 error:&error];
    
    [request setHTTPBody:postData];
    [request setHTTPMethod:@"POST"];
    [request setURL:[NSURL URLWithString:targetUrl]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          
          NSString *responseStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
          NSLog(@"Data received: %@", responseStr);
      }] resume];
}

@end
