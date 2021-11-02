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
		_time = [NSDate date];
	}
	return self;
}

- (nonnull instancetype)initWithBar:(const Bar&)bar
{
	if(self = [super init])
	{
		NSTimeInterval time = atoi(bar.time.c_str());
		_time = [NSDate dateWithTimeIntervalSince1970:time];
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
