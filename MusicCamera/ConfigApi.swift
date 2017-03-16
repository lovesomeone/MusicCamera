//
//  ConfigApi.swift
//  StartV3.0
//
//  Created by 程平 on 16/10/26.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation

// 测试机器
//let baseUrl = "http://119.145.5.77:8001"
// 发布
let baseUrl = "http://tbx.kingsun.cn"

let videoUrl = "http://video.kingsun.cn/"


protocol EnumeratableEnumType {
    static var allValues: [Self] {get}
}

// 用户操作处理后台接口API
let userBackendApiUrl = baseUrl+"/api/Account/"
enum UserApi: String{
    
    case AppLogin //登录
    case AppLoginOut //注销
    case AppRegister //注册
    case SendShortMessages //发送手机短信
    case UpdateUsers // 修改用户昵称或者学校
    case DecidePhoneCode //验证短信验证码是否正确
    case AppResetPassWord //重置密码
    case AppModifyPassWord //修改密码
    case CheckPhone //验证手机号是否使用
    
    var url:String{
        switch self {
        case .AppLogin ,.AppLoginOut,.AppRegister,.SendShortMessages,.UpdateUsers,
             .DecidePhoneCode, .AppResetPassWord,.AppModifyPassWord,.CheckPhone:
            return userBackendApiUrl+self.rawValue
            
        default:
            return baseUrl
        }
    }
    
}
extension UserApi : EnumeratableEnumType{
     static var allValues: [UserApi] {
        return [AppLogin,AppLoginOut,AppRegister,SendShortMessages,
                UpdateUsers,DecidePhoneCode,AppResetPassWord,AppModifyPassWord,CheckPhone]
    }

    
}


// 应用版本处理后台接口API
let applicationVersionBackendApiUrl = baseUrl+"/api/ApplicationVersion/"
enum ApplicationVersionApi:String{
    case GetNewVersions //获取应用更新
    case AddUserFeedback //意见反馈
    var url:String{
        switch self {
        case .GetNewVersions ,.AddUserFeedback:
            return applicationVersionBackendApiUrl+self.rawValue
            
        default:
            return baseUrl
        }
    }

}

extension ApplicationVersionApi: EnumeratableEnumType{
    static var allValues: [ApplicationVersionApi] {
        return [GetNewVersions,AddUserFeedback]
    }

    
}


// 登陆处理后台接口API
let bookBackendApiUrl = baseUrl+"/Api/DataHand/"
enum BookApi: String{
    
    case GetEditionList //获取版本
    case GetCatalogueLists //获取目录信息
    case GetModularUpdate //获取模块资源版本更新
    case GetModularLatestVersion //获取模块资源最新版本
    case RequestCheckUpdate //检测书本更新
    case GetCourseList // 获取版本下的课程信息列表(年级）
    case GetModuleConfigurationByFirstIDSecondID
    case AddBookHistorys  //增加用户选择的书本历史
    case GetPointReadAssetsWithBookID
    
    var url:String{
        switch self {
        case .GetEditionList ,.GetCatalogueLists,.GetModularUpdate,.GetModularLatestVersion,.RequestCheckUpdate,
             .GetCourseList, .GetModuleConfigurationByFirstIDSecondID,.AddBookHistorys,.GetPointReadAssetsWithBookID:
            return bookBackendApiUrl+self.rawValue
            
        default:
            return baseUrl
        }
    }
    
}
extension BookApi: EnumeratableEnumType{
     static var allValues: [BookApi] {
        return [GetEditionList,GetCatalogueLists,GetModularUpdate,GetModularLatestVersion,
        RequestCheckUpdate,GetCourseList,GetModuleConfigurationByFirstIDSecondID,
        AddBookHistorys,GetPointReadAssetsWithBookID]
    }

    
}



// 趣配音处理后台接口API
let vedioBackendApiUrl = baseUrl+"/api/VedioInfo/"
enum VideoApi: String{
    
    case GetVideoInforList // 获取已发布/未发布的视频
    case UpdateVedioInfo  // 修改已发布/未发布视频状态（0-删除 1-已发布 2-未发布）
    case PlayTimes  //增加播放次数
    case PublishVedioInfor //发布配音视频
    case GetVideoList // 获取已发布/未发布的视频
    case AddNumberOfOraise  //增加点赞数量
    case DeleteNumberOfOraise // 减少点赞数量
    case InsertVideoInfo // 提交用户配音完的视频信息
    case VideoRankingInfo //获取视频已发布者排行信息列表
    case SelectPraise  // 查询用户点赞记录
    case VideoAchievementInfo // 获取视频详细成绩相关信息
    case GetUserUseTime //得到每个页面的统计
    
    var url:String{
        switch self {
        case .GetVideoInforList ,.UpdateVedioInfo,.PlayTimes,.PublishVedioInfor,.GetVideoList,
             .AddNumberOfOraise, .DeleteNumberOfOraise,.InsertVideoInfo,.VideoRankingInfo,
             .SelectPraise,.VideoAchievementInfo,.GetUserUseTime:
            return vedioBackendApiUrl+self.rawValue
            
        default:
            return baseUrl
        }
    }
    
}
extension VideoApi: EnumeratableEnumType{
    static var allValues: [VideoApi] {
        return [GetVideoInforList,UpdateVedioInfo,PlayTimes,PublishVedioInfor,
        GetVideoList,AddNumberOfOraise,DeleteNumberOfOraise,InsertVideoInfo,
        VideoRankingInfo,SelectPraise,VideoAchievementInfo,GetUserUseTime]
    }

    
}



// 我的班级处理后台接口API
let classInfoBackendApiUrl = baseUrl+"/api/ClassInfo/"
enum ClassInfoApi:String{
    case GetUserSchoolAndClass // 获取用户学校班级信息
    case GetClassInfor   // 获取班级信息
    case BundleUserAndClass // 用户与班级绑定
  
    var url:String{
        switch self {
        case .GetUserSchoolAndClass ,.GetClassInfor,.BundleUserAndClass:
            return classInfoBackendApiUrl+self.rawValue
            
        default:
            return baseUrl
        }
    }
    
}
extension ClassInfoApi: EnumeratableEnumType{
    static var allValues: [ClassInfoApi] {
        return [GetUserSchoolAndClass,GetClassInfor,BundleUserAndClass]
    }

    
}




// 说说看处理后台接口API
let speakBackendApiUrl = baseUrl+"/api/HearResources/"
enum SpeakApi:String{
    case GetListenSpeakAchievement //获取一级模块下，用户在二级模块的得分情况
    case GetListenSpeakList  //获取模块下听说信息列表
    case SummitOralMarks //提交用户的跟读情况
    case ConfirmFileID  //确认上传
    
    var url:String{
        switch self {
        case .GetListenSpeakAchievement ,.GetListenSpeakList,.SummitOralMarks,.ConfirmFileID:
            return speakBackendApiUrl+self.rawValue
            
        default:
            return baseUrl
        }
    }
    
}
extension SpeakApi: EnumeratableEnumType{
    static var allValues: [SpeakApi] {
        return [GetListenSpeakAchievement,GetListenSpeakList,SummitOralMarks,ConfirmFileID]
    }
    
    
}


// 万圣节处理后台接口API
let activeInfoBackendApiUrl = baseUrl+"/api/ActiveVideoInfo/"
enum ActiveVideoInfoApi:String{
    case GetActiveVideoInforList
    case GetModularLatestVersion

    
    var url:String{
        switch self {
        case .GetActiveVideoInforList ,.GetModularLatestVersion:
            return activeInfoBackendApiUrl+self.rawValue
            
        default:
            return baseUrl
        }
    }
    
}
extension ActiveVideoInfoApi: EnumeratableEnumType{
    static var allValues: [ActiveVideoInfoApi] {
        return [GetActiveVideoInforList,GetModularLatestVersion]
    }
    
    
}


// 深圳版app版本号
let appId = "241ea176-fce7-4bd7-a65f-a7978aac1cd2"
