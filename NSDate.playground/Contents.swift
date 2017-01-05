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



/////////////////////////////////////////////////////////////////////
///  NSDateFormatterStyle enum. Each single value of it represents a different type of formatting
///////////////////////////////////////////////////////////////////////

//fullstyle
dateFormatter.dateStyle = DateFormatter.Style.full
var convertedDate = dateFormatter.string(from: currentDate as Date)

//long style
dateFormatter.dateStyle = DateFormatter.Style.long
convertedDate = dateFormatter.string(from: currentDate as Date)

//Medium style
dateFormatter.dateStyle = DateFormatter.Style.medium
convertedDate = dateFormatter.string(from: currentDate as Date)

///usin different locales
dateFormatter.dateStyle = DateFormatter.Style.full

// current locale
dateFormatter.locale = NSLocale.current
convertedDate = dateFormatter.string(from: currentDate as Date)

// Greek Locale
dateFormatter.locale = NSLocale(localeIdentifier: "el_GR") as Locale!
convertedDate = dateFormatter.string(from: currentDate as Date)

// French Locale
dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
convertedDate = dateFormatter.string(from: currentDate as Date)



///////////////////////////////////////
///using specifiers to formate the date
////////////////////////////////////////
dateFormatter.locale = NSLocale.current
dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
convertedDate = dateFormatter.string(from: currentDate as Date)

dateFormatter.dateFormat = "HH:mm:ss"
convertedDate = dateFormatter.string(from: currentDate as Date)

// converting from String to NSDate
var dateAsString = "24-12-2015 23:59"
dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
var newDate = dateFormatter.date(from: dateAsString)

// more complex with timezone included
//change between 9:22 to 12:22 is cause of specfied GMT Time zone
dateAsString = "Thu, 08 Oct 2015 09:22:33 GMT"
dateFormatter.dateFormat = "EEEE, dd MM yyyy HH:mm:ss zzz"
newDate = dateFormatter.date(from: dateAsString)




