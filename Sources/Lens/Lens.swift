//
//  Lens.swift
//  Lens
//
//  Created by Tangent on 2018/6/30.
//

public typealias Lens<Subpart, Whole> = (@escaping (Subpart) -> (Subpart)) -> (Whole) -> Whole

public func lens<Subpart, Whole>(view: @escaping (Whole) -> Subpart, set: @escaping (Subpart, Whole) -> Whole) -> Lens<Subpart, Whole> {
    return { mapper in { set(mapper(view($0)), $0) } }
}

public func over<Subpart, Whole>(mapper: @escaping (Subpart) -> Subpart, lens: Lens<Subpart, Whole>) -> (Whole) -> Whole {
    return lens(mapper)
}

public func set<Subpart, Whole>(value: Subpart, lens: Lens<Subpart, Whole>) -> (Whole) -> Whole {
    return over(mapper: const(value), lens: lens)
}

public func %~ <Subpart, Whole>(lhs: Lens<Subpart, Whole>, rhs: @escaping (Subpart) -> Subpart) -> (Whole) -> Whole {
    return over(mapper: rhs, lens: lhs)
}

public func .~ <Subpart, Whole>(lhs: Lens<Subpart, Whole>, rhs: Subpart) -> (Whole) -> Whole {
    return set(value: rhs, lens: lhs)
}

extension WritableKeyPath {
    var toLens: Lens<Value, Root> {
        return lens(view: { $0[keyPath: self] }, set: {
            var copy = $1
            copy[keyPath: self] = $0
            return copy
        })
    }
}

public func %~ <Value, Root>(lhs: WritableKeyPath<Root, Value>, rhs: @escaping (Value) -> Value) -> (Root) -> Root {
    return over(mapper: rhs, lens: lhs.toLens)
}

public func .~ <Value, Root>(lhs: WritableKeyPath<Root, Value>, rhs: Value) -> (Root) -> Root {
    return set(value: rhs, lens: lhs.toLens)
}
