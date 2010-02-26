//
//  ShortenWithCortito.h
//  ShortenWithCortito
//
//  Created by Adrian on 10/25/09.
//  Copyright (c) 2009 akosma software, All Rights Reserved.
//

#import <Cocoa/Cocoa.h>
#import <Automator/AMBundleAction.h>

@interface ShortenWithCortito : AMBundleAction 
{
}

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
