//
//  TimeElement.swift
//  alarm
//
//  Created by Michael Lewis on 3/8/15.
//  Copyright (c) 2015 Kevin Farst. All rights reserved.
//

import Foundation

class TimeElement {
  var hour: Int
  var minute: Int
  var displayStr: String
  var amOrPm: String // either "am" or "pm"


  init(hour: Int, minute: Int) {
    self.hour = hour
    self.minute = minute

    // Special formatting for special times
    if hour == 0 && minute == 0 {
      self.displayStr = "midnight"
    } else if hour == 12 && minute == 0 {
      self.displayStr = "noon"
    } else {
      self.displayStr = String(format: "%02d : %02d", hour, minute)
    }

    // Determine AM vs PM
    if hour < 12 {
      self.amOrPm = "am"
    } else {
      self.amOrPm = "pm";
    }
  }

  // Generate all of the time elements that we will allow
  class func generateAllElements() -> Array<TimeElement> {
    return (0...23).map {
      hour in
      [0, 15, 30, 45].map {
        minute in
        TimeElement(hour: hour, minute: minute)
      }
    }.reduce([], +)
  }
}
