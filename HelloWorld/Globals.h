//
//  Globals.h
//  HelloWorld
//
//  Created by Dutta, Animesh on 2/24/14.
//  Copyright (c) 2014 Dutta, Animesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Globals : NSObject
{
    NSString *LAT;
    NSString *LNG;
    
}
@property(nonatomic, retain) NSString *LAT;
@property(nonatomic, retain) NSString *LNG;

+ (id)globalsManager;
@end
