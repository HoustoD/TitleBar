//
//  AppDelegate.h
//  TitleBar
//
//  Created by Анюта on 25.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readwrite, retain) NSStatusItem* statusItem;
@property (readwrite, retain) IBOutlet NSMenu* statusMenu;

- (IBAction)chouseFileName:(id)sender;
- (IBAction)copyInToTheFile:(id)sender;
- (IBAction)exitPushButton:(id)sender;

@end

