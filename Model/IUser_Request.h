//
//  IUser_Request.h
//  Model
//
//  Created by liyuchang on 15/8/10.
//  Copyright (c) 2015年 liyuchang. All rights reserved.
//

#import "CustomerRequestBase.h"
#import "IRole_Request.h"
typedef NSDictionary TTDict;
@interface IUser_Request : CustomerRequestBase
@property (nonatomic,assign)NSNumber * a;
@property (nonatomic,strong)NSMutableDictionary *d2;
@property (nonatomic,strong)IRole_Request *role;
@property (nonatomic,strong)NSArray *array;
@end
