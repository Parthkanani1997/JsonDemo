//
//  ViewController.m
//  JsonAFNetworkingDemo
//
//  Created by Apple on 30/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getJSONFromAPI:@"http://epaper.sandesh.com/main/categories"];
}

-(void)getJSONFromAPI:(NSString*)apilink{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer = requestSerializer;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    NSString *apiURL = apilink;
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    [manager POST:apiURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject==%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
}
@end
