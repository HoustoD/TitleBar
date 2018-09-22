//
//  FileCollection.m
//  TitleBar
//
//  Created by Анюта on 30.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import "FileCollection.h"

void FileCollection::addObject(File* file )
{
    this->m_arrayOfObject.push_back(file);
}
File* FileCollection::getObjectAtIndex(long index)
{
    return this->m_arrayOfObject[index];
}
long FileCollection::getAmountOfObject()
{
    return this->m_arrayOfObject.size();
}
