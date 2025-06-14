import Testing
@testable import ScienceKit

@Test func test7() async throws {
    func f(_ x: Double) -> Double { return .exp(x) }
    func df2(_ x: Double) -> Double { return .exp(x) }
    
    let x: Double = 1
    let expectedValue: Double = df2(x)
    
    let (forwardValue, forwardError) = Calculus.forwardSecondDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralSecondDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardSecondDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}


@Test func test8() async throws {
    func f(_ x: Double) -> Double { return .pow(x, 1.5) }
    func df2(_ x: Double) -> Double { return 0.75 / .sqrt(x) }
    
    let x: Double = 0.1
    let expectedValue: Double = df2(x)
    
    let (forwardValue, forwardError) = Calculus.forwardSecondDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralSecondDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardSecondDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}


@Test func test9() async throws {
    func f(_ x: Double) -> Double { return .sin(1/x) }
    func df2(_ x: Double) -> Double { return (2 * x * .cos(1/x) - .sin(1/x)) / .pow(x, 4) }
    
    let x: Double = 0.45
    let expectedValue: Double = df2(x)
    
    let (forwardValue, forwardError) = Calculus.forwardSecondDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralSecondDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardSecondDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}


@Test func test10() async throws {
    func f(_ x: Double) -> Double { return .exp(-x * x) }
    func df(_ x: Double) -> Double { return (4 * x * x - 2) * .exp(-x * x) }
    
    let x: Double = 0.5
    let expectedValue: Double = df(x)
    
    let (forwardValue, forwardError) = Calculus.forwardSecondDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralSecondDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardSecondDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}


@Test func test11() async throws {
    func f(_ x: Double) -> Double { return x * x }
    func df(_ x: Double) -> Double { return 2 }
    
    let x: Double = 0
    let expectedValue: Double = df(x)
    
    let (forwardValue, forwardError) = Calculus.forwardSecondDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralSecondDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardSecondDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}


@Test func test12() async throws {
    func f(_ x: Double) -> Double { return 1 / x }
    func df(_ x: Double) -> Double { return 2 / (x * x * x) }
    
    let x: Double = 10
    let expectedValue: Double = df(x)
    
    let (forwardValue, forwardError) = Calculus.forwardSecondDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralSecondDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardSecondDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}
