//
//  DownloadManager.swift
//  Study
//
//  Created by 程平 on 16/12/13.
//  Copyright © 2016年 程平. All rights reserved.
//
/*
import Foundation
import Alamofire
import SSZipArchive

let downloadSessionManager: SessionManager = {
    let configuration = URLSessionConfiguration.background(withIdentifier:"com.kingsunsoft.study")
    
    configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    // configuration.timeoutIntervalForRequest = 40
    // configuration.timeoutIntervalForResource = 40
    
    let manager = Alamofire.SessionManager(configuration: configuration)
    return manager
}()
// 下载时的磁盘路径
let globalDiskURL:URL = {
    
    var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    _ = documentsURL.appendPathComponent("Study")
    
    
    return documentsURL
}()

// 获取下载的Destination，有url时为指定路径，没有url时为默认路径
func destination(url:URL) -> DownloadRequest.DownloadFileDestination {
    return  { _, response in
        let fileURL = url
        //两个参数表示如果有同名文件则会覆盖，如果路径中文件夹不存在则会自动创建
        return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
    }
    
}




/**
 下载对象协议，凡是被下载的对象必须实现此协议
 */
public protocol DownloadFileConvertible{
    
    var url:URL{get set} // 下载的url地址
    var filePrefix:String?{get set} //文件前缀 prefix
    
    var request:DownloadRequest!{get set} //下载的请求，Alamofire的对象
    
    var status:FileStatus{get set}
    
    func fileInDiskURL(isDirectory:Bool) ->URL // 文件在本地磁盘的路径
    
}
public enum FileStatus{
    case undownload // 未下载
    case downloaded(URL) // 已下载
    case downloading(Data?,Float) //下载中，或下载了一部分
    case extract(URL) //已经解压，
}

/**
 默认的下载对象
 */
public class  DefaultDownloadItem: DownloadFileConvertible{
    
    
    
    public var url: URL
    
    public var request:DownloadRequest!
    
    public var filePrefix: String?
    
    public var status: FileStatus = .undownload{
        didSet{
            
            switch (status,oldValue) {
            case (.downloaded(_),.downloading(_, _)):
                resumeData = nil
                progress = 0.0
            case (.downloading(let data,let value),_):
                resumeData = data
                progress = value
                
            default:
                break
            }
           
        }
    }
    
    
    public func fileInDiskURL(isDirectory: Bool) -> URL {
        if isDirectory{
            return directoryWithMapping
        }else{
            return filepathWithMapping
        }
    }
    
    
    private var _globalDiskURL:URL!
    
    private  var filepathWithMapping:URL!
    
    private  var directoryWithMapping:URL!
    
    init(url:URL,filePrefix:String?=nil,diskLocation:URL = globalDiskURL) {
        self.url = url
        self.filePrefix = filePrefix
        self._globalDiskURL = diskLocation
        filepathWithMapping = zipFileMappingURL()
        directoryWithMapping = fileMappingURL()
        setStatus()
    }
    
    
    private func setStatus(){
        
        if isExist(directoryWithMapping){
            status = FileStatus.extract(directoryWithMapping)
        }else if isExist(filepathWithMapping){
            status = FileStatus.downloaded(filepathWithMapping)
        }else if resumeData != nil {
            status = FileStatus.downloading(resumeData!, progress)
        }else{
            status = FileStatus.undownload
        }
        
        
    }
    
    private func isExist(_ url:URL) -> Bool{
        return FileManager.default.fileExists(atPath: url.path)
    }
    private var resumeData: Data?{
        get{
            return UserDefaults.standard.data(forKey: url.path)
        }
        set{
            UserDefaults.standard.set(newValue, forKey: url.path)
        }
    }
    private var progress: Float{
        get {
            return UserDefaults.standard.float(forKey: url.path+"progeress")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: url.path+"progeress")
        }
    }
    private  func zipFileMappingURL()->URL{
        let name =  url.lastPathComponent
        var globalDiskURL = _globalDiskURL!
        if let  filePath = self.filePrefix{
            _ = globalDiskURL.appendPathComponent(filePath)
        }
        let fileURL = globalDiskURL.appendingPathComponent(name)
        return fileURL
    }
    private  func fileMappingURL()->URL{
        
        let name = url.deletingPathExtension().lastPathComponent
        var globalDiskURL = _globalDiskURL!
        if let  filePath = self.filePrefix{
            _ = globalDiskURL.appendPathComponent(filePath)
        }
        let fileURL = globalDiskURL.appendingPathComponent(name)
        return fileURL
        
        
    }
    
    
}


public protocol DownloadService{
    
    func pauseDownload(_ param:DownloadFileConvertible)
    
    func resumeDownload( _ param:DownloadFileConvertible,completeHandler: @escaping (DownloadFileConvertible,URL) -> Void, progressHandler: @escaping (DownloadFileConvertible, Progress) -> Void)
    
    func cancelDownload(_ param:DownloadFileConvertible)
    
    func unZip(fileURLInDisk: URL,completeHandler:  @escaping()->Void)
}


public class DownloadServiceImp: DownloadService{
    
    
    
    public static let  standard = DownloadServiceImp()
    
    private init(){
        
    }
    
    var activeDownloads = [URL: DownloadFileConvertible]()
    
    
    
    public func cancelDownload(_ param: DownloadFileConvertible) {
        print("取消下载")
        if let downloadItem = activeDownloads[param.url]{
            downloadItem.request.cancel()
            
            activeDownloads[param.url] = nil
        }
    }
    
    public func resumeDownload(_ param: DownloadFileConvertible,completeHandler: @escaping (DownloadFileConvertible,URL) -> Void, progressHandler: @escaping (DownloadFileConvertible, Progress) -> Void) {
        print("下载")
        
        var downloadItem = param //as! DefaultDownloadItem
        
        var tempData :Data?
        if case let FileStatus.downloading(resume,_) = param.status {
            tempData = resume
        }
        
        // 当有数据时则为继续下载，当无数据时为新开下载
        if let data = tempData{
            print("继续下载resumeDownload")
            let   url = downloadItem.fileInDiskURL(isDirectory: false)
            
            downloadItem.request = downloadSessionManager.download(resumingWith: data, to:destination(url: url))
            
            
            
        }else{
            print("新开下载")
            let   url = downloadItem.fileInDiskURL(isDirectory: false)
            
            downloadItem.request =  downloadSessionManager.download(downloadItem.url, to: destination(url: url))
            
            
        }
        downloadItem.request.responseData { [weak self](response) in
            switch response.result {
            case .success(_):
                // 清楚缓存的下载的临时数据
                let filePath = response.destinationURL
                downloadItem.status = FileStatus.downloaded(filePath!)
                
                
                completeHandler(downloadItem,filePath!)
                self?.activeDownloads[downloadItem.url] = nil
                
                print("成功")
            case .failure:
                //downloadItem.resumeData = response.resumeData
                //downloadItem.progress = downloadItem.request.progress.fractionCompleted
                downloadItem.status = FileStatus.downloading(response.resumeData!, Float(downloadItem.request.progress.fractionCompleted))
                print("失败")
            }
            
            }.downloadProgress { (progress) in
                
                
                
                print("progress==\(progress.fractionCompleted)")
                progressHandler(downloadItem,progress)
        }
        // downloadItem.isDownloading = true
        activeDownloads[downloadItem.url] = downloadItem
    }
    
    public func pauseDownload( _ param: DownloadFileConvertible) {
        print("暂停下载")
        if var downloadItem = activeDownloads[param.url]{
            print("暂停下载pauseDownload")
            downloadItem.request.cancel()
            //downloadItem.isDownloading = false
        }
    }
    public func unZip(fileURLInDisk: URL, completeHandler: @escaping () -> Void) {
        let destinationFileFolder = fileURLInDisk.deletingLastPathComponent()
        SSZipArchive.unzipFile(atPath: fileURLInDisk.path, toDestination: destinationFileFolder.path, progressHandler: { (s, _, value1, value2) in
            
        }) { (s, sucessed, error) in
            if sucessed{
                print("解压成功")
                completeHandler()
                do{
                    try FileManager.default.removeItem(atPath: fileURLInDisk.path)
                    print("删除成功!")
                }catch{
                    print("删除失败!")
                }
            }else{
                print("解压失败==\(error)")
            }
        }
        
    }
    
    
}
*/
