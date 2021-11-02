//
//  TWSOrder_private.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/21/21.
//

#import <Foundation/Foundation.h>
#import "TWSOrder.h"
#import "Order.h"

@interface TWSOrder()

- (nonnull instancetype)initWithOrder:(const Order&)order;

- (Order)order;

@end
