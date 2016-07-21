//
//  GreaterThan.swift
//  Pods
//
//  Created by FrogRain on 06/02/16.
//
//

import Foundation

public class GreaterThan : BeNotNil {
    private var limit:NSNumber
    private var includeLimit:Bool
    
    public init(limit: NSNumber, includeLimit:Bool?) {
        self.limit = limit
        if let include = includeLimit {
            self.includeLimit = include
        }else{
            self.includeLimit = false
        }
        super.init()
    }
    
    override public func performValidation(object: AnyObject?) -> Bool {
        if(!super.performValidation(object)) {
            return false
        }else{
            guard let value = object as? NSNumber else {
                return false
            }
            var result = value.compare(self.limit) == .OrderedDescending
            if(self.includeLimit){
                result = result || (value == self.limit)
            }
            return result
        }
    }
    
    override func errorMessage(subject: String, failValue: AnyObject?, context: AnyObject) -> String {
        let errMessage = self.errorTextLocalized()
        return String(format: errMessage, subject, self.limit, self.optionalValueDescription(failValue))
    }
    
    override func errorMessageExtended(subject: String, failValue: AnyObject?, context: AnyObject) -> String {        
        let errMessage = self.errorTextExtendedLocalized()
        return String(format: errMessage, subject, self.limit, self.optionalValueDescription(failValue))
    }
}