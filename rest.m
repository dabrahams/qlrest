#include "rest.h"

@class RestConverter;

@interface NSObject (MethodsThatReallyDoExist)
- (NSString *) foo;
@end

NSData* renderRest(NSURL* url)
{
    /*
	NSString *styles = [NSString stringWithContentsOfFile:[[NSBundle bundleWithIdentifier: @"com.fiatdev.QLMarkdown"]
                                                           pathForResource:@"styles" ofType:@"css"]];
    */
    //NSString *source = [NSString stringWithContentsOfFile:[url path] encoding:NSUTF8StringEncoding error:nil];
    
	//Class RestConverterClass = NSClassFromString(@"RestConverter");
	//myrest = [RestConverterClass new];
	NSString *html = [myrest foo];
	//NSString *html = [RestConverterClass restToHtml:source];
	//char *output = convert_markdown_to_string([source UTF8String]);
    //NSString *html = [NSString stringWithUTF8String:output];
    //free(output);
    NSString *html = [NSString stringWithUTF8String:"foo bar!"];
	return [html dataUsingEncoding:NSUTF8StringEncoding];
}