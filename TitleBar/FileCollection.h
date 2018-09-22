//
//  FileCollection.h
//  TitleBar
//
//  Created by Анюта on 30.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#pragma once
#include <iostream>
#include <vector>
#import <Cocoa/Cocoa.h>

#import "File.h"

class FileCollection
{
public:
    void addObject(File* file );
    File* getObjectAtIndex(long index);
    long getAmountOfObject();
private:
    std::vector<File*>m_arrayOfObject;
};