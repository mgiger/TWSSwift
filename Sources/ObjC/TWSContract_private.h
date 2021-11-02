//
//  TWSContract_private.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/3/21.
//

#import <Foundation/Foundation.h>
#include "Contract.h"

@interface TWSContract()

- (nonnull instancetype)initWithContract:(const Contract&)contract;

- (Contract)contract;

@end
