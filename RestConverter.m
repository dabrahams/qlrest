//
//  RestConverter.m
//  QLRest
//
//  Created by Idan Gazit on 23/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RestConverter.h"

@class PyRestConverter;

@interface NSObject (MethodsThatReallyDoExist)
- (NSString *) foo;
@end

@implementation RestConverter
	-(void) initialize {
		Class PyRestConverterClass = NSClassFromString(@"PyRestConverter");
		NSObject * pyRestConv;
		pyRestConv = [PyRestConverterClass new];
	}
	
	+(NSData*) renderRest: (NSURL*) url {
		NSString *html = [pyRestConv foo];
		return [html dataUsingEncoding:NSUTF8StringEncoding];
	}
	

@end
