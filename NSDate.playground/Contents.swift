//: Playground - noun: a place where people can play

import UIKit

let dateComponents = NSDateComponents()
let day = dateComponents.day
let month = dateComponents.month

let currentDate = NSDate()

//NSDateFormatter object is going to make conversions from dates to strings and back:
let dateFormatter = DateFormatter()

//ateFormatter uses locale settings of the device by default, unless another locale explicitly set
dateFormatter.locale = NSLocale.current

// setting locale - Greek and French
///dateFormatter.locale = NSLocale(localeIdentifier: "el_GR") as Locale!
///dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!

//  NSDateFormatterStyle enum. Each single value of it represents a different type of formatting
//fullstyle
dateFormatter.dateStyle = DateFormatter.Style.full
var convertedDate = dateFormatter.string(from: currentDate as Date)

//long style
dateFormatter.dateStyle = DateFormatter.Style.long
convertedDate = dateFormatter.string(from: currentDate as Date)

//Medium style
dateFormatter.dateStyle = DateFormatter.Style.medium
convertedDate = dateFormatter.string(from: currentDate as Date)


