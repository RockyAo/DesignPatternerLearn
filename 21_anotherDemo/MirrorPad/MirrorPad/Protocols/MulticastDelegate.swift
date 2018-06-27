//
//  MulticastDelegate.swift
//  MirrorPad
//
//  Created by Yun Ao on 2018/6/27.
//  Copyright © 2018 Razeware, LLC. All rights reserved.
//

import Foundation

public class MulticastDelegate<ProtocolType> {
    private class DelegateWrapper {
        weak var delegate: AnyObject?
        
        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }
    
    private var delegateWrappers: [DelegateWrapper]
    
    public var delegates: [ProtocolType] {
        delegateWrappers = delegateWrappers.filter{ $0.delegate != nil }
        return delegateWrappers.map { $0.delegate! } as! [ProtocolType]
    }
    
    public init(delegates: [ProtocolType] = []) {
        delegateWrappers = delegates.map {
            DelegateWrapper($0 as AnyObject)
        }
    }
    
    public func addDelegate(_ delegate: ProtocolType) {
        let wrapper = DelegateWrapper(delegate as AnyObject)
        delegateWrappers.append(wrapper)
    }
    
    public func removeDelegate(_ delegate:ProtocolType) {
        guard let index = delegateWrappers.index(where: { $0.delegate === (delegate as AnyObject) }) else { return }
        delegateWrappers.remove(at: index)
    }
    
    public func invokeDelegates(_ closure: (ProtocolType) -> ()) {
        delegates.forEach { closure($0) }
    }
}
