//
//  YSRangeSlider+RxSwift.swift
//  Pods
//
//  Created by Aleksey Cherepanov on 03.02.17.
//
//

import RxCocoa

public extension YSRangeSlider {
    
    var rx_delegate: DelegateProxy {
        return RxYSRangeSliderDelegateProxy.proxyForObject(self)
    }
    
    public var rangeChanged: ControlEvent<YSRangeSliderValues> {
        
        let source = rx_delegate.methodInvoked(#selector(YSRangeSliderDelegate.rangeSliderDidChange(_:minimumSelectedValue:maximumSelectedValue:)))
            .map({ (a) -> YSRangeSliderValues in
                let minValue = try castOrThrow(CGFloat.self, a[1])
                let maxValue = try castOrThrow(CGFloat.self, a[2])
                return YSRangeSliderValues(min: minValue, max: maxValue)
            })
        return ControlEvent(events: source)
    }
    
}

class RxYSRangeSliderDelegateProxy: DelegateProxy, DelegateProxyType, YSRangeSliderDelegate {
    class func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let slider:YSRangeSlider = castOrFatalError(object)
        slider.delegate = castOptionalOrFatalError(delegate)
    }
    
    class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let slider:YSRangeSlider = castOrFatalError(object)
        return slider.delegate
    }
}


