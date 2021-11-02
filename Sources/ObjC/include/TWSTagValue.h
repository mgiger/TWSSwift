//
//  TWSTagValue.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/5/21.
//

#import <Foundation/Foundation.h>

@interface TWSTagValue : NSObject

@property (nonnull, strong)		NSString*	tag;
@property (nonnull, strong)		NSString*	value;

- (nonnull instancetype)init;

- (nonnull instancetype)initWithTag:(nonnull NSString*)tag value:(nonnull NSString*)value;

@end
