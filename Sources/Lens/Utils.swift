//
//  Utils.swift
//  Lens
//
//  Created by Tangent on 2018/6/30.
//

public func id<T>(_ value: T) -> T { return value }

public func const<A, B>(_ a: A) -> (B) -> A {
    return { _ in a}
}

public func |> <A, B> (lhs: A, rhs: (A) -> B) -> B {
    return rhs(lhs)
}

public func >>> <A, B, C> (lhs: @escaping (A) -> B, rhs: @escaping (B) -> C) -> (A) -> C {
    return { $0 |> lhs |> rhs }
}

public func <<< <A, B, C> (lhs: @escaping (B) -> C, rhs: @escaping (A) -> B) -> (A) -> C {
    return { $0 |> rhs |> lhs }
}
