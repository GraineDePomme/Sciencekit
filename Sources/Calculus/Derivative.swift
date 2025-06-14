import Foundation
import Numerics


public extension Calculus {
    
    static func forwardDerivative<ℝ: Real>(of f: (ℝ) -> ℝ, at x: ℝ) -> (ℝ, ℝ) {
        // Defining the rounding error for the current data type
        let ε: ℝ = ℝ.ulpOfOne
        
        // Computing an estimation of the second derivative at x
        let (secondDerivative, _) = Calculus.forwardSecondDerivative(of: f, at: x)
        
        // Computing the optimal value of h
        // We ignore f(x) / f''(x) if at least one of them is 0, so we still have the best possible value for h
        var h: ℝ = 0
        if f(x) * secondDerivative == 0 {
            h = (4 * ε).squareRoot()
        } else {
            h = (4 * ε * abs(f(x) / secondDerivative)).squareRoot()
        }
        
        // Computing the forward derivative and its absolute error
        let derivative: ℝ = (f(x + h) - f(x)) / h
        let error: ℝ = {
            let a: ℝ = 2 * ε * abs(f(x)) / h
            let b: ℝ = h / 2 * abs(secondDerivative)
            return a + b
        }()
        
        return (derivative, error)
    }
    
    
    static func backwardDerivative<ℝ: Real>(of f: (ℝ) -> ℝ, at x: ℝ) -> (ℝ, ℝ) {
        // Defining the rounding error for the current data type
        let ε: ℝ = ℝ.ulpOfOne
        
        // Computing an estimation of the second derivative at x
        let (secondDerivative, _) = Calculus.backwardSecondDerivative(of: f, at: x)
        
        // Computing the optimal value of h
        // We ignore f(x) / f''(x) if at least one of them is 0, so we still have the best possible value for h
        var h: ℝ = 0
        if f(x) * secondDerivative == 0 {
            h = (4 * ε).squareRoot()
        } else {
            h = (4 * ε * abs(f(x) / secondDerivative)).squareRoot()
        }
        
        // Computing the backward derivative and its absolute error
        let derivative: ℝ = (f(x) - f(x-h)) / h
        let error: ℝ = {
            let a: ℝ = 2 * ε * abs(f(x)) / h
            let b: ℝ = h * abs(secondDerivative) / 2
            return a + b
        }()
        
        return (derivative, error)
    }
    
    
    static func centralDerivative<ℝ: Real>(of f: (ℝ) -> ℝ, at x: ℝ) -> (ℝ, ℝ) {
        // Defining the rounding error for the current data type
        let ε: ℝ = ℝ.ulpOfOne
        
        // Computing an estimation of the third derivative at x
        var h: ℝ = .pow(9 * ε, ℝ(1)/ℝ(5))
        let thirdDerivative: ℝ = {
            let a: ℝ = -f(x-2*h) / 2 + f(x-h)
            let b: ℝ = -f(x+h) + f(x+2*h) / 2
            return (a + b) / (h * h * h)
        }()
        
        // Computing the optimal value of h
        // We ingore f(x) / f'''(x) if one of them is 0, so we still have the best possible value for h
        if f(x) * thirdDerivative == 0 {
            h = (3 * ε).squareRoot()
        } else {
            h = (3 * ε * abs(f(x) / thirdDerivative)).squareRoot()
        }
        
        // Computing the central derivative and its absolute error
        let derivative: ℝ = (f(x+h) - f(x-h)) / (2 * h)
        let error: ℝ = {
            let a: ℝ = ε * abs(f(x)) / h
            let b: ℝ = h * h * abs(derivative) / 6
            return a + b
        }()
        
        return (derivative, error)
    }
    
}
