//
//  SoundService.swift
//  Study
//
//  Created by 程平 on 16/12/20.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import AVFoundation

public protocol SoundService {
    
    var delegate:SoundServiceDelegate?{get set}
    var timeIntervalBetweenSongs:TimeInterval?{get set}
    func play(file:URL)
    func play(files:[URL])
    func stop()
}


public protocol SoundServiceDelegate {
    func willPlaying(inService:SoundServiceImpl,withFile:URL)
    func playEnded(inService:SoundServiceImpl,withFile:URL)
    
    func allPlayEnded(inService:SoundServiceImpl)
    func interruptWhenAllPlay(inService:SoundServiceImpl,withFile:URL)
    
    func errorDidOccurWhenPlay(inService:SoundServiceImpl,error:String)
    
}

public class SoundServiceImpl:NSObject, SoundService{
    
    public var timeIntervalBetweenSongs: TimeInterval? = 1.0

    
    public static let standard = SoundServiceImpl()
    public var delegate:SoundServiceDelegate?
   
    //private var avplayer:AVPlayer!
    private var localPlayer:AVAudioPlayer!
 
   
    private var playlist = [URL]()
    
    
    
    fileprivate var currentPlayingFile:URL?
    
    private override init(){
        let audioSession = AVAudioSession.sharedInstance()
        _ = try? audioSession.setCategory(AVAudioSessionCategoryPlayback)
        _ = try? audioSession.setActive(true)
    }
    
    fileprivate var mode = Mode.none
    
    enum Mode {
        case none
        case single
        case multiple
    }
    
    public func play(file:URL){
        interruptPlaying()
        clearPlayList()
        
        mode = .single
        playlist.append(file)
        play()
    }
    
    public func play(files:[URL]) {
        interruptPlaying()
        clearPlayList()
        
        mode = .multiple
        self.playlist = files
        play()
    }
    public func stop(){
      
        // 清空播放列表，重置播放模式
       interruptPlaying()
       clearPlayList()
       mode = .none
    }
    fileprivate func playNext(){
        play()
    }
    
    private func play()  {
        guard self.playlist.count > 0  else {
            print("没有资源可播放")
            return
        }
        currentPlayingFile = nil
        
        let file = playlist.removeFirst()
        
        if isExist(file: file.path){
            let url = file
            
            localPlayer = try? AVAudioPlayer(contentsOf: url)
            
            guard localPlayer != nil else {
                delegate?.errorDidOccurWhenPlay(inService: self, error: "初始化本地播放器失败.播放中断")
                print("初始化本地播放器失败.播放中断了")
                return
            }
            currentPlayingFile = file
            delegate?.willPlaying(inService: self, withFile: file)
            localPlayer.play()
            localPlayer.delegate = self
           
        }else{
            delegate?.errorDidOccurWhenPlay(inService: self, error: "文件不存在")
        }

    }
    // 当存在播放器时，终止播放，
    // 如果 localPlayer.isPlaying，说明目前还在播放,强制停止，并派发播放完成事件
    private func interruptPlaying(){
        if localPlayer != nil ,localPlayer.isPlaying{
            localPlayer.stop()
            switch mode {
            case .single:
                 delegate?.playEnded(inService: self, withFile: currentPlayingFile!)
            case .multiple:
                delegate?.interruptWhenAllPlay(inService: self,withFile: currentPlayingFile!)
            default:
                break
            }
           
           
        }
    }
    
    private func clearPlayList(){
         playlist.removeAll()
    }
  
    
    fileprivate func isPlayListEmpty() -> Bool{
        return !(self.playlist.count > 0)
    }
    
    private func isExist(file:String)->Bool{
        return FileManager.default.fileExists(atPath: file)
    }
    
}


extension SoundServiceImpl: AVAudioPlayerDelegate{
    public func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if let msg = error{
            delegate?.errorDidOccurWhenPlay(inService: self, error: msg.localizedDescription)
        }
    }
    
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
       // logger.info("播放结束了player isplaying = \(player.isPlaying)")
        if flag{
            
            switch mode {
            case .single:
                 delegate?.playEnded(inService: self, withFile: self.currentPlayingFile!)
                
            case .multiple:
                if isPlayListEmpty(){
                    delegate?.allPlayEnded(inService: self)
                    
                }else{
                    delegate?.playEnded(inService: self, withFile: self.currentPlayingFile!)
                   
                    let delay = DispatchTime.now() + timeIntervalBetweenSongs!
                    DispatchQueue.main.asyncAfter(deadline: delay) {
                        // 延迟执行
                         self.playNext()
                    }
                   
                }
            default:
                break
            }
            
          
        }
    }
}

