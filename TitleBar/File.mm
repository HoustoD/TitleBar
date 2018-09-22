//
//  File.m
//  TitleBar
//
//  Created by Анюта on 31.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import "File.h"

File::File(NSString* fileName, NSString* fileContent)
{
    this->m_fileName = fileName;
    this->m_fileContent = fileContent;
}

NSString* File::getFileName()
{
    return this->m_fileName;
}
NSString* File::getFileContent()
{
    return this->m_fileContent;
}
