//
//  view2.h
//  HelloWorld
//
//  Created by Dutta, Animesh on 2/20/14.
//  Copyright (c) 2014 Dutta, Animesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Globals.h"

@interface view2 : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (copy, nonatomic) NSArray *locationsArray;

@property (copy, nonatomic) NSArray *locationsArray2;

@property (copy, nonatomic) NSString *Lat;

@property (copy, nonatomic) NSString *Lng;



@end
