//
//  GlobalHotKey.m
//  TitleBar
//
//  Created by Анюта on 10.09.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import "GlobalHotKey.h"


GlobalHotKey::GlobalHotKey(NSString* ANSI_codeOfLetter, NSString* methodNameAfterPushHotKey)
{
    this->m_key = ANSI_codeOfLetter;
    this->m_method = methodNameAfterPushHotKey;
    
    this->hotKeyRegistration(this->m_key, this->m_method);
}

void GlobalHotKey::hotKeyRegistration(NSString* ANSI_codeOfLetter, NSString* methodNameAfterPushHotKey)
{
    DDHotKeyCenter *c = [DDHotKeyCenter sharedHotKeyCenter];
    
    if (![c registerHotKeyWithKeyCode:(NSUInteger)ANSI_codeOfLetter.longLongValue modifierFlags:(NSCommandKeyMask | NSShiftKeyMask) target:nil action:NSSelectorFromString(methodNameAfterPushHotKey) object:nil]) {
        NSLog(@"unable to register hotkey");
    } else {
        NSLog(@"registered hotkey");
    }
}
