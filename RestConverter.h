//
//  RestConverter.h
//  QLRest
//
//  Created by Idan Gazit on 23/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface RestConverter : NSObject {
	@public
		NSObject pyRestConv;
}

	+(NSData*) renderRest: (NSURL*) url;
@end
