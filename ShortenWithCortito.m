//
//  ShortenWithCortito.m
//  ShortenWithCortito
//
//  Created by Adrian on 10/25/09.
//  Copyright (c) 2009 akosma software, All Rights Reserved.
//

#import "ShortenWithCortito.h"
#import "CortitoProxy.h"

@implementation ShortenWithCortito

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo
{
    NSString *output = nil;
    NSURL *outputURL = [[CortitoProxy sharedCortitoProxy] shorten:input];
    if (outputURL)
    {
        output = [outputURL absoluteString];
    }
	return output;
}

@end
