//
//  GlobalHotKey.h
//  TitleBar
//
//  Created by Анюта on 10.09.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#pragma once
#import <Cocoa/Cocoa.h>

#include <iostream>
#import "DDHotKeyCenter.h"


class GlobalHotKey
{
public:
    GlobalHotKey(NSString* ANSI_codeOfLetter, NSString* methodNameAfterPushHotKey);
    
private:
    NSString* m_key;
    NSString* m_method;
    
    void hotKeyRegistration(NSString* ANSI_codeOfLetter, NSString* methodNameAfterPushHotKey);
};
