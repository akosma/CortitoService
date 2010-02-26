//
//  CortitoProxy.m
//  CortitoService
//
//  Created by Adrian on 10/25/09.
//  Copyright 2009 akosma software. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "CortitoProxy.h"
#import "ASIHTTPRequest.h"
#import "SynthesizeSingleton.h"
#import "Definitions.h"

@implementation CortitoProxy

SYNTHESIZE_SINGLETON_FOR_CLASS(CortitoProxy)

#pragma mark -
#pragma mark Public interface

- (NSURL *)shorten:(NSURL *)originalURL
{
    CFStringRef encoded = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, 
                                                                  (CFStringRef)[originalURL absoluteString],
                                                                  NULL, 
                                                                  (CFStringRef)@";/?:@&=+$,", 
                                                                  kCFStringEncodingUTF8);
    
    NSString *completeString = [NSString stringWithFormat:@"%@?url=%@", CORTITO_SERVER_URL, encoded];
    CFRelease(encoded);

    NSURL *akosmaURL = [NSURL URLWithString:completeString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:akosmaURL];
    NSMutableDictionary *headers = [NSMutableDictionary dictionaryWithObject:@"application/javascript" 
                                                                      forKey:@"Accept"];
    [request setRequestHeaders:headers];
    [request start];
    NSError *error = [request error];
    NSURL *shortURL = nil;
    if (!error) 
    {
        NSString *response = [request responseString];
        shortURL = [NSURL URLWithString:response];
    }
    return shortURL;
}

@end
