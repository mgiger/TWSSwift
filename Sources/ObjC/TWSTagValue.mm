//
//  TWSTagValue.m
//  TWSAPI
//
//  Created by Matthew Giger on 10/5/21.
//

#import "TWSTagValue.h"
#import "TWSTagValue_private.h"

@implementation TWSTagValue

- (nonnull instancetype)init
{
	if(self = [super init])
	{
		_tag = @"";
		_value = @"";
	}
	return self;
}

- (nonnull instancetype)initWithTag:(nonnull NSString*)tag value:(nonnull NSString*)value
{
	if(self = [super init])
	{
		_tag = tag;
		_value = value;
	}
	return self;
}

- (TagValueSPtr)tagValue
{
	return TagValueSPtr(new TagValue(_tag.UTF8String, _value.UTF8String));
}

@end
