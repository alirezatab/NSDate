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


////////////////////////////////////////
////Working With NSDateComponents///////
////////////////////////////////////////
//you might have to get the day and the month values from a date, or the hour and minutes from the time use is the NSDateComponents class.

let calendar = NSCalendar.current

let dateComponentss = calendar.dateComponents([.day, .month, .year, .weekOfYear, .hour, .minute, .second, .nanosecond], from: currentDate as Date)

print("day = \(dateComponentss.day!)", "month = \(dateComponentss.month!)", "year = \(dateComponentss.year!)", "week of year = \(dateComponentss.weekOfYear!)", "hour = \(dateComponentss.hour!)", "minute = \(dateComponentss.minute!)", "second = \(dateComponentss.second!)", "nanosecond = \(dateComponentss.nanosecond!)" , separator: ", ", terminator: "\n")

// Converting NSDateComponents to NSDate
let components = NSDateComponents()
components.day = 5
components.month = 01
components.year = 2016
components.hour = 19
components.minute = 30
newDate = calendar.date(from: components as DateComponents)

// GMT = Greenwich Mean Time
components.timeZone = NSTimeZone(abbreviation: "GMT") as TimeZone?
newDate = calendar.date(from: components as DateComponents)

// CST = China Standard Time
components.timeZone = NSTimeZone(abbreviation: "CST") as TimeZone?
newDate = calendar.date(from: components as DateComponents)

// CET = Central European Time
components.timeZone = NSTimeZone(abbreviation: "CET") as TimeZone?
newDate = calendar.date(from: components as DateComponents)



/////////////////////////////////////////
////// Comparing Date and Time //////////
/////////////////////////////////////////

dateFormatter.dateFormat = "MMM dd, yyyy zzz"
dateAsString = "Oct 08, 2015 GMT"
var date1 = dateFormatter.date(from: dateAsString)! as NSDate

dateAsString = "Oct 10, 2015 GMT"
var date2 = dateFormatter.date(from: dateAsString)! as NSDate

// Comparing dates - Method #1
print("Earlier date is: \(date1.earlierDate(date2 as Date))\n")

print("Later date is : \(date2.laterDate(date1 as Date))")


// comparing dates - Method #2
if date1.compare(date2 as Date) == ComparisonResult.orderedDescending {
    print("Date1 is later than Date2")
} else if date1.compare(date2 as Date) == ComparisonResult.orderedAscending {
    print("Date1 is Earlier than Date2")
} else if date1.compare(date2 as Date) == ComparisonResult.orderedSame {
    print("Same Dates")
}

// comparing dates - Method #3
if date1.timeIntervalSinceReferenceDate > date2.timeIntervalSinceReferenceDate {
    print("Date1 is Later than Date2")
} else if date1.timeIntervalSinceReferenceDate < date2.timeIntervalSinceReferenceDate {
    print("Date1 is Earlier than Date2")
} else {
    print("Same dates")
}

// comparing time
dateFormatter.dateFormat = "HH:mm:ss zzz"
dateAsString = "14:28:16 GMT"
date1 = dateFormatter.date(from: dateAsString)! as NSDate

dateAsString = "19:53:12 GMT"
date2 = dateFormatter.date(from: dateAsString)! as NSDate

if date1.earlierDate(date2 as Date) == date1 as Date {
    if date1.isEqual(to: date2 as Date) {
        print("Same Time")
    } else {
        print("\(date1) is earlier than \(date2)")
    }
} else {
    print("\(date2) is earlier than \(date1)")
}

print(currentDate)

let monthsToAdd = 2
let daysToAdd = 5

// Metod #1
var calculatedDate = Calendar.current.date(byAdding: .month, value: monthsToAdd, to: currentDate as Date)
calculatedDate = Calendar.current.date(byAdding: .day, value: daysToAdd, to: calculatedDate!)



