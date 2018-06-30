//
//  Operations.swift
//  Lens
//
//  Created by Tangent on 2018/7/1.
//

precedencegroup ApplyPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup LensPrecedence {
    associativity: right
    higherThan: ApplyPrecedence
}

precedencegroup CompositionLeftPrecedence {
    associativity: left
    higherThan: LensPrecedence
}

precedencegroup CompositionRightPrecedence {
    associativity: left
    higherThan: CompositionLeftPrecedence
}

infix operator >>> : CompositionLeftPrecedence
infix operator <<< : CompositionRightPrecedence
infix operator |> : ApplyPrecedence

/// Lens Writer
infix operator %~ : LensPrecedence
infix operator .~ : LensPrecedence
