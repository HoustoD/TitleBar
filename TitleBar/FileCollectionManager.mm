//
//  FileCollectionManager.m
//  TitleBar
//
//  Created by Анюта on 31.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import "FileCollectionManager.h"

FileCollectionManager::FileCollectionManager(FileCollection* fileCollection, FileManager* fileManager)
{
    this->m_fileCollection = fileCollection;
    this->m_fileManager = fileManager;
}
void FileCollectionManager::convertFileNameAndContentInFileObjAndFillFileCollection(NSString* directori)
{
    NSArray* arrayOfFileName = this->m_fileManager->getFileNameArrayFromDirectori(directori);
    __block NSString* fileContent = @"";
    
    [arrayOfFileName enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger index, BOOL* stop)
    {
        fileContent = this->stringArray(this->m_fileManager->read(obj));
        this->m_fileCollection->addObject(new File(obj,fileContent));
    }];
}
NSString* FileCollectionManager::stringArray(NSArray* arrayOfString)
{
    __block NSString* tmpString = [[NSMutableString alloc]init];
    
    [arrayOfString enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger index, BOOL* stop)
    {
        tmpString = [tmpString stringByAppendingString:obj];
    }];
    
    return tmpString;
}
