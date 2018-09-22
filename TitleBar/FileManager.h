//
//  FileManager.h
//  NewGenerationWeatherForecast
//
//  Created by Анюта on 17.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#pragma once
#import <Foundation/Foundation.h>

#include <iostream>
//#import "FileManagerInterface.h"

class FileManager //: public FileManagerInterface
{
public:
    static FileManager* Instance();
    
    NSMutableArray* read(NSString* fileName);
    NSArray* getFileNameArrayFromDirectori(NSString* directori);
    void write(NSString* fileName, NSString* line);
    void setFileName(NSString* fileName);
    void removeLine(NSString* line);
    void createNewDirecotriInDocumentDirectoriWithName(NSString* directoriName);
private:
    FileManager(){};
    FileManager(FileManager const&) = delete;
    FileManager& operator= (FileManager const&) = delete;
    
    static FileManager* m_pInstance;
    NSString* m_filePath;
    NSString* m_directoriName;
    
    NSString* getDocumentDirectoriPath();
};