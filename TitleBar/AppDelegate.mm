//
//  AppDelegate.m
//  TitleBar
//
//  Created by Анюта on 25.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import "AppDelegate.h"
#import "DDHotKeyCenter.h"
#import "FileManager.h"
#import "ClipboardMenager.h"
#import <Carbon/Carbon.h>

#import "FileCollectionManager.h"
#import "RootFileName.h"



@interface AppDelegate ()
@property(nonatomic,copy)NSString* currentFileName;

@end

@implementation AppDelegate

/*- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
    return YES;
}*/
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    FileManager* fileManager = FileManager::Instance();
    fileManager->createNewDirecotriInDocumentDirectoriWithName(RootFileName);
    FileCollection* fileCollection = new FileCollection;
    FileCollectionManager* fileCollectionManager = new FileCollectionManager(fileCollection, fileManager);

    fileCollectionManager->convertFileNameAndContentInFileObjAndFillFileCollection(RootFileName);
    
    self.hotKeyForChouseFileName;
    self.hotKeyForCopyInToTheFile;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (void)awakeFromNib
{
    self.statusItem = [[NSStatusBar systemStatusBar]statusItemWithLength:NSVariableStatusItemLength];
    NSImage *menuIcon = [NSImage imageNamed:@"MenuImage"];
    NSImage *highlightIcon  = [NSImage imageNamed:@"MenuImage"]; // Yes, we're using the exact same image asset.
    [highlightIcon setTemplate:YES]; // Allows the correct highlighting of the icon when the menu is clicked.
    
    [self.statusItem setImage:menuIcon];
    [self.statusItem setAlternateImage:highlightIcon];
    [self.statusItem setMenu:self.statusMenu];
    [self.statusItem setHighlightMode:YES];
    
    
    
    
}

- (IBAction)chouseFileName:(id)sender
{
    ClipboardMenager* clipboardMenager = ClipboardMenager::Instance();
    FileManager* fileManager = FileManager::Instance();
    NSString* fileName = [NSString new];
    
    fileName = clipboardMenager->getClipboard();
    if(![fileName isEqualTo:@"0"])
    {
        fileManager->setFileName(fileName);
        self.currentFileName = fileName;
    }
}
- (IBAction)copyInToTheFile:(id)sender
{
    if(self.currentFileName)
    {
        ClipboardMenager* clipboardMenager = ClipboardMenager::Instance();
        FileManager* fileManager = FileManager::Instance();
        NSString* clipboardContent = [NSString new];
        
        clipboardContent = clipboardMenager->getClipboard();
        fileManager->write(self.currentFileName, clipboardContent);//some note
    }
}

- (IBAction)exitPushButton:(id)sender {
    //[NSApp terminate:nil];
}

- (void) hotKeyForChouseFileName
{
    DDHotKeyCenter *c = [DDHotKeyCenter sharedHotKeyCenter];

    if (![c registerHotKeyWithKeyCode:kVK_ANSI_A modifierFlags:(NSCommandKeyMask | NSShiftKeyMask) target:self action:@selector(chouseFileName:) object:nil]) {
        NSLog(@"unable to register hotkey");
    } else {
        NSLog(@"registered hotkey");
    }
}
- (void) hotKeyForCopyInToTheFile
{
    DDHotKeyCenter *c = [DDHotKeyCenter sharedHotKeyCenter];
    
    if (![c registerHotKeyWithKeyCode:kVK_ANSI_S modifierFlags:(NSCommandKeyMask | NSShiftKeyMask) target:self action:@selector(copyInToTheFile:) object:nil]) {
        NSLog(@"unable to register hotkey");
    } else {
        NSLog(@"registered hotkey");
    }
}


@end
