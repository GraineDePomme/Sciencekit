import Testing
@testable import ScienceKit

@Test func test1() async throws {
    func f(_ x: Double) -> Double { return .exp(x) }
    func df(_ x: Double) -> Double { return .exp(x) }
    
    let x: Double = 1
    let expectedValue: Double = df(x)
    
    let (forwardValue, forwardError) = Calculus.forwardDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}


@Test func test2() async throws {
    func f(_ x: Double) -> Double { return .pow(x, 1.5) }
    func df(_ x: Double) -> Double { return 1.5 * .sqrt(x) }
    
    let x: Double = 0.1
    let expectedValue: Double = df(x)
    
    let (forwardValue, forwardError) = Calculus.forwardDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}

@Test func test3() async throws {
    func f(_ x: Double) -> Double { return .sin(1/x) }
    func df(_ x: Double) -> Double { return -1/(x*x) * .cos(1/x) }
    
    let x: Double = 0.45
    let expectedValue: Double = df(x)
    
    let (forwardValue, forwardError) = Calculus.forwardDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}


@Test func test4() async throws {
    func f(_ x: Double) -> Double { return .exp(-x * x) }
    func df(_ x: Double) -> Double { return -2 * x * .exp(-x * x) }
    
    let x: Double = 0.5
    let expectedValue: Double = df(x)
    
    let (forwardValue, forwardError) = Calculus.forwardDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}


@Test func test5() async throws {
    func f(_ x: Double) -> Double { return x * x }
    func df(_ x: Double) -> Double { return 2 * x }
    
    let x: Double = 0
    let expectedValue: Double = df(x)
    
    let (forwardValue, forwardError) = Calculus.forwardDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}


@Test func test6() async throws {
    func f(_ x: Double) -> Double { return 1 / x }
    func df(_ x: Double) -> Double { return -1 / (x * x) }
    
    let x: Double = 10
    let expectedValue: Double = df(x)
    
    let (forwardValue, forwardError) = Calculus.forwardDerivative(of: f, at: x)
    let (centralValue, centralError) = Calculus.centralDerivative(of: f, at: x)
    let (backwardValue, backwardError) = Calculus.backwardDerivative(of: f, at: x)
    
    #expect(forwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: forwardError))
    #expect(centralValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: centralError))
    #expect(backwardValue.isApproximatelyEqual(to: expectedValue, absoluteTolerance: backwardError))
}
