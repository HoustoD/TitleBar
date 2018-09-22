//
//  ClipboardMenager.h
//  CopyFromClipboard
//
//  Created by Анюта on 28.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//
#pragma once
#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

#include <iostream>

class ClipboardMenager
{
public:
    static ClipboardMenager* Instance();
    
    NSString* getClipboard();
    NSString* getOldContent();
    
private:
    ClipboardMenager(){};
    ClipboardMenager(ClipboardMenager const&) = delete;
    ClipboardMenager& operator= (ClipboardMenager const&) = delete;
    static ClipboardMenager* m_pInstance;
    
    NSString* m_oldClipboardContent;
    
    void cleanClipboard(NSPasteboard *pasteboardd);
};
