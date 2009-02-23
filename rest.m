#include "rest.h"

@class RestConverter;


@implementation rest

@interface NSObject (MethodsThatReallyDoExist)
- (NSString *) foo;
@end

NSData* renderRest(NSURL* url)
{
	//Class RestConverterClass = NSClassFromString(@"RestConverter");
	//restconv = [RestConverterClass new];
    /*
	NSString *styles = [NSString stringWithContentsOfFile:[[NSBundle bundleWithIdentifier: @"com.fiatdev.QLMarkdown"]
                                                           pathForResource:@"styles" ofType:@"css"]];
    */
    //NSString *source = [NSString stringWithContentsOfFile:[url path] encoding:NSUTF8StringEncoding error:nil];
    
	//Class RestConverterClass = NSClassFromString(@"RestConverter");
	//myrest = [RestConverterClass new];
	
	//NSString *html = [restconv foo];
	//NSLog(html);
	
	//NSString *html = [RestConverterClass restToHtml:source];
	//char *output = convert_markdown_to_string([source UTF8String]);
    //NSString *html = [NSString stringWithUTF8String:output];
    //free(output);
    //NSString *html = [NSString stringWithUTF8String:"foo bar!"];
	//return [html dataUsingEncoding:NSUTF8StringEncoding];
}

@end
