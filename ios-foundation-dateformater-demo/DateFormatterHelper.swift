//
//  DateFormatterHelper.swift
//  ios-foundation-dateformater-demo
//
//  Created by OkuderaYuki on 2017/05/13.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import Foundation

/// DateFormatterのヘルパークラス
final class DateFormatterHelper {
    
    private(set) var dateFormatter: DateFormatter
    
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - locale: (default: en_US_POSIX)
    ///   - dateFormat: (default: yyyy/MM/dd HH:mm:ss)
    required init(locale: Locale = Locale(identifier: "en_US_POSIX"), dateFormat: String = "yyyy/MM/dd HH:mm:ss") {
        dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = dateFormat
    }
    
    /// TimeZoneを設定する
    ///
    /// - Parameter timeZone: TimeZone identifier
    func setTimeZone(timeZone: String) {
        dateFormatter.timeZone = TimeZone(identifier: timeZone)!
    }
    
    /// Localeを設定する
    ///
    /// - Parameter locale: Locale identifier
    func setLocale(locale: String) {
        dateFormatter.locale = Locale(identifier: locale)
    }
    
    
    /// DateFormatを設定する
    ///
    /// - Parameter format: DateFormat
    func setDateFormat(format: String) {
        dateFormatter.dateFormat = format
    }
    
    /// TimeZoneのIDを取得する
    func currentTimeZone() -> String {
        return dateFormatter.timeZone.identifier
    }
    
    /// Locale: "en_US_POSIX"
    /// -> Today at 1:27 AM
    ///    Yesterday at 1:31 AM
    ///    Tomorrow at 1:32 PM
    ///    Thursday, May 18, 2017 at 1:34 AM
    ///    Friday, May 19, 2017 at 1:34 AM
    ///
    /// Locale: "ja_JP"
    /// -> 今日 1:28
    ///    昨日 1:30
    ///    明日 13:33
    ///    明後日 1:33
    ///    2017年5月19日金曜日 1:35
    func doesRelativeDateFormatting() -> DateFormatter {
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter
    }
}
