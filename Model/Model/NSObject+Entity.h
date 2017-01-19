//
//  NSObject+Entity.h
//  Model
//
//  Created by JD on 17/1/19.
//  Copyright © 2017年 liyuchang. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSObject (Entity)<NSCopying,NSCoding>

+(id)EntityFromContainer:(id)container;

-(id)getContainer;


/***
 @{protertyname:arrayclass}
 ***/

// subclass overwrite
-(NSDictionary *)containerKeyNameConvertToEntityPropertyName;
/***
 @{protertyname:containerkey}
 ***/
// subclass overwrite
-(NSDictionary *)containerArrayConvertToEntityPropertyArray;
@end
