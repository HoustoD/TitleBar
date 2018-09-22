//
//  ClipboardMenager.m
//  CopyFromClipboard
//
//  Created by Анюта on 28.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import "ClipboardMenager.h"

ClipboardMenager* ClipboardMenager::m_pInstance = NULL;

ClipboardMenager* ClipboardMenager::Instance()
{
    if (!m_pInstance)
    {
        m_pInstance = new ClipboardMenager;
    }
    return m_pInstance;
}

NSString* ClipboardMenager::getClipboard()
{
    NSPasteboard *pasteboardd = [NSPasteboard generalPasteboard];
    NSArray *classes = [[NSArray alloc] initWithObjects:[NSString class], nil];
    NSDictionary *options = [NSDictionary dictionary];
    NSArray *copiedItems = [pasteboardd readObjectsForClasses:classes options:options];
    
    if ([copiedItems count] != 0)
    {
        this->cleanClipboard(pasteboardd);
        
        return copiedItems[0];
    }
    
  return @"0";
}
NSString* ClipboardMenager::getOldContent()
{
    return this->m_oldClipboardContent;
}
void ClipboardMenager::cleanClipboard(NSPasteboard *pasteboardd)
{
    [pasteboardd clearContents];
}