//
//  ViewController.swift
//  ios-foundation-dateformater-demo
//
//  Created by Eiji Kushida on 2017/04/04.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dateFormater = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DateFormatterHelperを初期化
        let dfHelper = DateFormatterHelper()
        
        // Date(現在時刻)をStringに変換
        let now = Date()
        print("stringFromDate: \(dfHelper.dateFormatter.string(from: now))")
        
        // Localeを設定
        dfHelper.setLocale(locale: "ja_JP")
        
        // DateFormatを設定
        dfHelper.setDateFormat(format: "yyyy-MM-dd 'at' HH:mm")
        
        // StringをDateに変換
        let dateStr = "2017-05-19 at 22:30"
        if let date = dfHelper.dateFormatter.date(from: dateStr) {
            print("dateFromString: \(date)")
        }
        
        // 「今日」「昨日」などで表すFormat
        let yesterday = Date(timeIntervalSinceNow: -60*60*24)
        let relativeDateFormatStr = dfHelper.doesRelativeDateFormatting().string(from: yesterday)
        print("relativeDateFormatStr: \(relativeDateFormatStr)")
    }
    
    func setup() {
        
        //ロケール（日本）
        dateFormater.locale = Locale(identifier: "ja_JP")
        
        // yyyy: 年 / MM:月 / dd:日 / HH:時 / mm:分 / ss: 秒
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
    }
    
    /// 文字列　→ 日付へ変換
    func testStr2Date() {
        let date = dateFormater.date(from: "2016/10/3 12:12:12")
        print(date ?? "covert failure")    // 2016-10-03 03:12:12 +0000
    }
    
    /// 日付　→ 文字列へ変換
    func testDate2Str() {
        print(dateFormater.string(from: Date()))    // 2017/04/04 10:44:31
    }
    
    /// DateStyleのパターン
    func testDate2StrForDateStyle() {
        
        //dateStyle : fullの場合
        dateFormater.dateStyle = .full
        print(dateFormater.string(from: Date()))    // 2017年4月4日火曜日
        
        //dateStyle : longの場合
        dateFormater.dateStyle = .long
        print(dateFormater.string(from: Date()))    // 2017年4月4日
        
        //dateStyle : midiumの場合
        dateFormater.dateStyle = .medium
        print(dateFormater.string(from: Date()))    // 2017/04/04
        
        //dateStyle : shortの場合
        dateFormater.dateStyle = .short
        print(dateFormater.string(from: Date()))    // 2017/04/04
        
    }
    
    /// TimeStyleのパターン
    func testDate2StrForTimeStyle() {
        
        //timeStyle : fullの場合
        dateFormater.timeStyle = .full
        print(dateFormater.string(from: Date()))    // 2017/04/04 10時44分31秒 日本標準時
        
        //timeStyle : longの場合
        dateFormater.timeStyle = .long
        print(dateFormater.string(from: Date()))    // 2017/04/04 10:44:31 JST
        
        //timeStyle : mediumの場合
        dateFormater.timeStyle = .medium
        print(dateFormater.string(from: Date()))    // 2017/04/04 10:44:31
        
        //timeStyle : shortの場合
        dateFormater.timeStyle = .short
        print(dateFormater.string(from: Date()))    // 2017/04/04 10:44
    }
}

