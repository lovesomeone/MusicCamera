//
//  Course.swift
//  Study
//
//  Created by 程平 on 16/12/1.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import ObjectMapper



public struct Book{
    var bookID:Int? //书本ID
    var teachingNaterialName:String? //课程名字
    var state:Bool? //是否启用
    var textbookVersion:String? //版本名称
    var editionID:Int? //版本ID
    var gradeID:Int? //年级ID
    var juniorGrade:String?//年级名称
    var courseCover:String?  //封面图地址
    var stageID:Int? //阶段ID
    var educationLevel:String? //阶段ID
    var subjectID:Int? //科目ID
    var courseCategory:String? //科目名称
    var breelID:Int?
    var teachingBooks:String? //学期名称 上下册
    var iD:Int?
    var userName:String?
    var createDate:String?
    
}
//   <- map[""]
extension Book : Mappable{
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        bookID <- map["BookID"]
        teachingNaterialName <- map["TeachingNaterialName"]
        state <- map["State"]
        textbookVersion <- map["TextbookVersion"]
        editionID <- map["EditionID"]
        gradeID <- map["GradeID"]
        juniorGrade <- map["JuniorGrade"]
        courseCover <- map["CourseCover"]
        stageID <- map["StageID"]
        educationLevel <- map["EducationLevel"]
        subjectID <- map["SubjectID"]
        courseCategory <- map["CourseCategory"]
        breelID <- map["BreelID"]
        teachingBooks <- map["TeachingBooks"]
        iD <- map["ID"]
        userName <- map["UserName"]
        createDate <- map["CreateDate"]
    }
}

/*
 var bookID:String? //书本ID
 var TeachingNaterialName:String? //课程名字
 var State:String? //是否启用
 var TextbookVersion:String? //版本名称
 var EditionID:String? //版本ID
 var GradeID:String? //年级ID
 var JuniorGrade:String?//年级名称
 var CourseCover:String?  //封面图地址
 var StageID:String? //阶段ID
 var EducationLevel:String? //阶段ID
 var SubjectID:String? //科目ID
 var CourseCategory:String? //科目名称
 var BreelID:String?
 var TeachingBooks:String? //学期名称 上下册
 var ID:String?
 var UserName:String?
 var CreateDate:String?

 */
