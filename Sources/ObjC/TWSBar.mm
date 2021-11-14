//
//  TWSBar.m
//  TWSAPI
//
//  Created by Matthew Giger on 10/5/21.
//

#import "TWSBar.h"
#import "TWSBar_private.h"

@implementation TWSBar

- (nonnull instancetype)init
{
	if(self = [super init])
	{
		_time = @"";
	}
	return self;
}

- (nonnull instancetype)initWithBar:(const Bar&)bar
{
	if(self = [super init])
	{
		_time = [NSString stringWithUTF8String:bar.time.c_str()];
		_high = bar.high;
		_low = bar.low;
		_open = bar.open;
		_close = bar.close;
		_wap = bar.wap;
		_volume = bar.volume;
		_count = bar.count;
	}
	return self;
}

@end
