//
//  YSRxCocoa.swift
//  RxCocoa missing methods
//
//  Created by Aleksey Cherepanov on 03.02.17.
//
//

import RxCocoa

func castOptionalOrFatalError<T>(_ value: Any?) -> T? {
    if value == nil {
        return nil
    }
    let v: T = castOrFatalError(value)
    return v
}

func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }
    
    return returnValue
}

func castOptionalOrThrow<T>(_ resultType: T.Type, _ object: AnyObject) throws -> T? {
    if NSNull().isEqual(object) {
        return nil
    }
    
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }
    
    return returnValue
}

func castOrFatalError<T>(_ value: AnyObject!, message: String) -> T {
    let maybeResult: T? = value as? T
    guard let result = maybeResult else {
        fatalError(message)
    }
    
    return result
}

func castOrFatalError<T>(_ value: Any!) -> T {
    let maybeResult: T? = value as? T
    guard let result = maybeResult else {
        fatalError("Failure converting from \(value) to \(T.self)")
    }
    
    return result
}

