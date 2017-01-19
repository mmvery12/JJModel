//
//  NSObject+Entity.m
//  Model
//
//  Created by JD on 17/1/19.
//  Copyright © 2017年 liyuchang. All rights reserved.
//

#import "NSObject+Entity.h"
#import <objc/runtime.h>

@implementation NSObject (Entity)


+(id)EntityFromContainer:(id)container;
{
    if (container==nil||[container isKindOfClass:[NSNull class]]) {
        return nil;
    }
    NSObject *obj =  [[[self class] alloc] init];
    [obj autoPaddingParamsValues:container];
    return self;
}

-(id)getContainer;
{
    NSMutableDictionary *temp = [NSMutableDictionary dictionary];
    for (NSDictionary *dict in [self getAllProperties]) {
        NSString *key = [dict objectForKey:@"name"];
        SEL getParamSel = NSSelectorFromString(key);
        id obj = [self performSelector:getParamSel];
        if ([[[obj containerArrayConvertToEntityPropertyArray] allKeys] containsObject:key]) {
            if ([obj isKindOfClass:[NSArray class]]||[obj isKindOfClass:[NSMutableArray class]]) {
                NSMutableArray *arr = [NSMutableArray array];
                for (id temp in obj) {
                    [arr addObject:[temp getContainer]];
                }
                [temp setObject:arr forKey:key];
            }
        }else
            [temp setObject:[self isVaildRequestObject:obj] forKey:key];
    }
    return temp;
}

-(id)isVaildRequestObject:(NSObject *)object
{
    if ([object isKindOfClass:[NSNull class]]||object==nil) {
        return [NSNull null];
    }
    if ([object isKindOfClass:[NSObject class]]) {
        return [object getContainer];
    }
    return object;
}

// subclass overwrite
-(NSDictionary *)containerKeyNameConvertToEntityPropertyName;
{
    return @{};
}
// subclass overwrite
-(NSDictionary *)containerArrayConvertToEntityPropertyArray;
{
    return @{};
}


- (BOOL)autoPaddingParamsValues:(NSObject*)dataSource
{
    BOOL ret = NO;
    for (NSDictionary *dict in [self getAllProperties]) {
        NSString *key = [dict objectForKey:@"name"];
        NSString *attribute = [dict objectForKey:@"attribute"];
        if ([dataSource isKindOfClass:[NSDictionary class]]) {
            ret = ([dataSource valueForKey:key]==nil)?NO:YES;
        }
        if ([dataSource isKindOfClass:[NSArray class]]) {
            ret = YES;
        }
        NSString *className = [[[[attribute componentsSeparatedByString:@"T@\""] lastObject] componentsSeparatedByString:@"\""] firstObject];
        if (ret) {
            id propertyValue = [dataSource valueForKey:key];
            if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue!=nil) {
                
                NSRange range1 = [attribute rangeOfString:@"NSString"];
                NSRange range2  =[attribute rangeOfString:@"NSNumber"];
                NSRange range3 = [attribute rangeOfString:@"NSMutableDictionary"];
                NSRange range4 = [attribute rangeOfString:@"NSDictionary"];
                NSRange range5 = [attribute rangeOfString:@"NSMutableArray"];
                NSRange range6 = [attribute rangeOfString:@"NSArray"];
                NSRange range7 = [attribute rangeOfString:@"NSDecimalNumber"];
                if (![propertyValue isKindOfClass:[NSArray class]] &&
                    range1.location==NSNotFound &&
                    range2.location==NSNotFound &&
                    range3.location==NSNotFound &&
                    range4.location==NSNotFound &&
                    range5.location==NSNotFound &&
                    range6.location==NSNotFound &&
                    range7.location==NSNotFound)//非基本nsobject类,且是entity子类，数据类型不是array,dict
                {
                    NSObject *base = (id)[NSClassFromString(className) EntityFromContainer:propertyValue];
                    [self setValue:base forKey:key];
                }
                else
                    if ([propertyValue isKindOfClass:[NSArray class]] &&
                        [[self containerArrayConvertToEntityPropertyArray] objectForKey:key]) {//entitybase类集合
                        NSMutableArray *arr = [NSMutableArray array];
                        for (id data in propertyValue) {
                            [arr addObject:(id)[NSClassFromString([[self containerArrayConvertToEntityPropertyArray] objectForKey:key]) EntityFromContainer:data]];
                        }
                        [self setValue:arr forKey:key];
                    }
                    else//正常nsobject类
                    {
                        NSObject *obj = nil;
                        NSRange range3 = [attribute rangeOfString:@"NSDecimalNumber"];
                        if (range3.length>0)
                        {
                            obj = [NSDecimalNumber decimalNumberWithString:[propertyValue stringValue]];
                            [self setValue:obj forKey:key];
                        }else
                            [self setValue:[propertyValue copy] forKey:key];
                    }
                
            }else
            {
                NSObject *obj = nil;
                NSRange range1 = [attribute rangeOfString:@"NSString"];
                NSRange range2  =[attribute rangeOfString:@"NSNumber"];
                NSRange range3 = [attribute rangeOfString:@"NSDecimalNumber"];
                NSRange range4 = [attribute rangeOfString:@"NSMutableArray"];
                NSRange range5 = [attribute rangeOfString:@"NSArray"];
                NSRange range6 = [attribute rangeOfString:@"NSMutableDictionary"];
                NSRange range7 = [attribute rangeOfString:@"NSDictionary"];
                NSString *arrtibutename = nil;
                if (range1.length>0) {
                    arrtibutename = [attribute substringWithRange: range1];
                    obj = [[NSString  alloc] init];
                }else
                    if (range2.length>0) {
                        arrtibutename = [attribute substringWithRange: range2];
                        obj = [NSNumber numberWithInteger:0];
                    }else if (range3.length>0)
                    {
                        arrtibutename = [attribute substringWithRange: range3];
                        obj = [NSDecimalNumber decimalNumberWithString:@"0"];
                    }else if (range4.length>0)
                    {
                        arrtibutename = [attribute substringWithRange:range4];
                        obj = [NSMutableArray new];
                    }
                    else if (range5.length>0)
                    {
                        arrtibutename = [attribute substringWithRange:range5];
                        obj = [NSMutableArray new];
                    }else if (range6.length>0)
                    {
                        obj = [NSMutableDictionary new];
                    }
                    else if (range7.length>0)
                    {
                        obj = [NSDictionary new];
                    }
                    else
                    {
                        NSObject *base = (id)[[NSClassFromString(className) alloc] init];
                        [self setValue:base forKey:key];
                    }
                if (arrtibutename) {
                    [self setValue:obj forKey:key];
                }
            }
        }
    }
    return ret;
}

- (NSArray *)getAllProperties
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        const char * attributes = property_getAttributes(properties[i]);//获取属性类型
        NSDictionary *dict = @{@"name":[NSString stringWithUTF8String:propertyName],@"attribute":[NSString stringWithUTF8String:attributes]};
        [propertiesArray addObject:dict];
    }
    free(properties);
    return propertiesArray;
}

#pragma mark -- copying

-(id)copyWithZone:(NSZone *)zone
{
    NSObject *base = [[self class] EntityFromContainer:[self getContainer]];
    return base;
}


#pragma mark -- coding
- (void)encodeWithCoder:(NSCoder*)coder
{
    for (NSDictionary *dict in [self getAllProperties]) {
        NSString *key = [dict objectForKey:@"name"];
        SEL getParamSel = NSSelectorFromString(key);
        id obj = [self performSelector:getParamSel];
        [coder encodeObject:obj forKey:key];
    }
}

- (id)initWithCoder:(NSCoder*)decoder
{
    if (self = [self init])
    {
        for (NSDictionary *dict in [self getAllProperties]) {
            NSString *key = [dict objectForKey:@"name"];
            [self setValue:[decoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}


@end
