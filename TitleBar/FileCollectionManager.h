//
//  FileCollectionManager.h
//  TitleBar
//
//  Created by Анюта on 31.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#pragma once
#import <Cocoa/Cocoa.h>
#import "File.h"
#import "FileCollection.h"
#import "FileManager.h"

#include <iostream>

class FileCollectionManager
{
public:
    FileCollectionManager(FileCollection* fileCollection, FileManager* fileManager);
    void convertFileNameAndContentInFileObjAndFillFileCollection(NSString* directori);
private:
    FileCollection* m_fileCollection;
    FileManager* m_fileManager;
    
    NSString* stringArray(NSArray* arrayOfString);
};
