//
//  FileManager.m
//  NewGenerationWeatherForecast
//
//  Created by Анюта on 17.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import "FileManager.h"



FileManager* FileManager::m_pInstance = NULL;

FileManager* FileManager::Instance()
{
    if (!m_pInstance)
    {
        m_pInstance = new FileManager;
    }
    return m_pInstance;
}

NSString* FileManager::getDocumentDirectoriPath()
{
    NSArray *paths = [[NSArray alloc]init];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [[NSString alloc]init];
    
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];
    
    return documentsDirectory;
}

void FileManager::createNewDirecotriInDocumentDirectoriWithName(NSString* directoriName)
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString* documentDirectori = this->getDocumentDirectoriPath();
    NSError *error;
    
    this->m_directoriName = [@"/" stringByAppendingString: directoriName];
    directoriName = [@"/" stringByAppendingString:directoriName];
    documentDirectori = [documentDirectori stringByAppendingString:directoriName];
    
    if([fileManager createDirectoryAtPath:documentDirectori withIntermediateDirectories:NO attributes:nil error:nil])
    {
        NSLog(@"Create Sucess %@",directoriName);
        this->m_directoriName = directoriName;
    }
    else{
        NSLog(@"Create error: %@", error);
    }
}

void FileManager::setFileName(NSString* fileName)
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString* documentDirectori = this->getDocumentDirectoriPath();
    NSString* filePath = [[NSString alloc]init];
    
    documentDirectori = [documentDirectori stringByAppendingString: this->m_directoriName];
    filePath = [NSString stringWithFormat:@"%@/%@", documentDirectori, fileName];
    
    if (![fileManager fileExistsAtPath:filePath]){
        [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    this->m_filePath = filePath;
    //this->m_documentDirectoriPath = documentsDirectory;
}
NSMutableArray* FileManager::read(NSString* fileName)
{
    this->setFileName(fileName);
    NSMutableString* fileContent = [NSMutableString stringWithContentsOfFile:this->m_filePath encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray* arrayOfLocationName = [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    [arrayOfLocationName removeObjectAtIndex:[arrayOfLocationName count] - 1];
    
    return arrayOfLocationName;
}
void FileManager::write(NSString* fileName, NSString* line)
{
    this->setFileName(fileName);
    NSMutableString* fileContent = [NSMutableString stringWithContentsOfFile:this->m_filePath encoding:NSUTF8StringEncoding error:nil];
    line = [line stringByAppendingString:@"\n"];
    
    [fileContent appendString:line];
    [fileContent writeToFile:this->m_filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
void FileManager::removeLine(NSString* line)
{
    NSMutableString* fileContent = [[NSMutableString alloc]init];
    
    [fileContent enumerateLinesUsingBlock:^(NSString* lineFromFile, BOOL* stop)
     {
         if(![lineFromFile isEqualToString:line])
         {
             [fileContent appendString:lineFromFile];
         }
     }];
    
    [fileContent writeToFile:this->m_filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
NSArray* FileManager::getFileNameArrayFromDirectori(NSString* directori)
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSMutableArray *urls = [[NSMutableArray alloc]init];
    
    directori = [@"/" stringByAppendingString:directori];
    directori = [documentsDirectory stringByAppendingString:directori];
    urls = [fileManager contentsOfDirectoryAtPath:directori error:nil];
    [urls removeObjectAtIndex:0];
    
    return urls;
}