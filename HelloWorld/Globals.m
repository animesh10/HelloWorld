//
//  Globals.m
//  HelloWorld
//
//  Created by Dutta, Animesh on 2/24/14.
//  Copyright (c) 2014 Dutta, Animesh. All rights reserved.
//

#import "Globals.h"

@implementation Globals


@synthesize LAT;
@synthesize LNG;

#pragma mark Singleton Methods

+ (id)globalsManager {
    static Globals *globalsManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        globalsManager = [[self alloc] init];
    });
    return globalsManager;
}

- (id)init {
    if (self = [super init]) {
        LNG = @"-121.921583442803";
        LAT = @"37.3776282320135";
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
