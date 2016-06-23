#import <QuickLook/QuickLook.h>
#import <Cocoa/Cocoa.h>
#include "RestConverter.h"

/* -----------------------------------------------------------------------------
   Generate a preview for file

   This function's job is to create preview for designated file
   -------------------------------------------------------------------------- */

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview,
							   CFURLRef url, CFStringRef contentTypeUTI, 
							   CFDictionaryRef options)
{
    // TODO: Fallback to plaintext rendering if rest rendering fails?
	NSString *source = [NSString stringWithContentsOfFile:[(NSURL*)url path] encoding:NSUTF8StringEncoding error:nil];
	CFDataRef data = (CFDataRef) renderRest(source);
	CFStringRef uttype = kUTTypeHTML;
	if (!data) {
		data = (CFDataRef) [source dataUsingEncoding:NSUTF8StringEncoding];
        uttype = kUTTypePlainText;
	}
	CFDictionaryRef props = (CFDictionaryRef) [NSDictionary dictionary];
	QLPreviewRequestSetDataRepresentation(preview, data, uttype, props);

    return noErr;
}

void CancelPreviewGeneration(void* thisInterface, QLPreviewRequestRef preview)
{
    // implement only if supported
}
