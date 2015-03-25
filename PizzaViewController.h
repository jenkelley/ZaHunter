//
//  PizzaViewController.h
//  ZaHunter
//
//  Created by Jen Kelley on 3/25/15.
//  Copyright (c) 2015 Jen Kelley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@protocol PizzaViewDelegate <NSObject>
@optional

-(NSArray *)whereAmIAndWhereIsPizza;

@end

@interface PizzaViewController : UIViewController

@property id <PizzaViewDelegate>delegate;

@end
