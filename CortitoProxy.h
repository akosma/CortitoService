//
//  CortitoProxy.h
//  CortitoService
//
//  Created by Adrian on 10/25/09.
//  Copyright 2009 akosma software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CortitoProxy : NSObject 
{

}

+ (CortitoProxy *)sharedCortitoProxy;
- (NSURL *)shorten:(NSURL *)originalURL;

@end
