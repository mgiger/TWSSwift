//
//  TWSBar.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/5/21.
//

#import <Foundation/Foundation.h>

@interface TWSBar : NSObject

@property (nonnull, strong)		NSString*	time;
@property (assign)				double		high;
@property (assign)				double		low;
@property (assign)				double		open;
@property (assign)				double		close;
@property (assign)				double		wap;
@property (assign)				long long	volume;
@property (assign)				NSInteger	count;

- (nonnull instancetype)init;

@end
