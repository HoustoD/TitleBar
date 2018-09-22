//
//  File.h
//  TitleBar
//
//  Created by Анюта on 31.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#pragma once
#include <iostream>
#import <Cocoa/Cocoa.h>

class File
{
public:
    File(NSString* fileName, NSString* fileContent);
    
    NSString* getFileName();
    NSString* getFileContent();
private:
    NSString* m_fileName;
    NSString* m_fileContent;
};

