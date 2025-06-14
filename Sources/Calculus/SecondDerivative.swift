import Foundation
import Numerics


public extension Calculus {
    
    static func forwardSecondDerivative<ℝ: Real>(of f: (ℝ) -> ℝ, at x: ℝ) -> (ℝ, ℝ) {
        // Defining the rounding error for the current data type
        let ε: ℝ = ℝ.ulpOfOne
        
        // Computing an estimation of the third derivative at x
        var h: ℝ = .pow(16 * ε, ℝ(1)/ℝ(4))
        let thirdDerivative: ℝ = (-f(x) + 3 * f(x + h) - 3 * f(x + 2 * h) + f(x + 3 * h)) / (h * h * h)
        
        // Computing the optimal value of h
        // We ignore f(x) / f'''(x) if one of them is 0 so we still have the best possible value for h
        if f(x) * thirdDerivative == 0 {
            h = .pow(8 * ε, ℝ(1)/ℝ(3))
        } else {
            h = .pow(8 * ε * abs(f(x) / thirdDerivative), ℝ(1)/ℝ(3))
        }
        
        // Computing the forward second derivative and its absolute error
        let secondDerivative: ℝ = (f(x) - 2 * f(x + h) + f(x + 2 * h)) / (h * h)
        print(secondDerivative)
        let error: ℝ = {
            let a: ℝ = 4 * ε * abs(f(x)) / (h * h)
            let b: ℝ = h * abs(thirdDerivative)
            return a + b
        }()
        
        return (secondDerivative, error)
    }
    
    
    static func backwardSecondDerivative<ℝ: Real>(of f: (ℝ) -> ℝ, at x: ℝ) -> (ℝ, ℝ) {
        // Defining the rounding error for the current data type
        let ε: ℝ = ℝ.ulpOfOne
        
        // Computing an estimation of the third derivative at x
        var h: ℝ = .pow(16 * ε, ℝ(1)/ℝ(4))
        let thirdDerivative: ℝ = (-f(x-3*h) + 3*f(x-2*h) - 3*f(x-h) + f(x)) / (h * h * h)
        
        // Computing the optimal value of h
        // We ignore f(x) / f'''(x) if one of them is 0 so we still have the best possible value for h
        if f(x) * thirdDerivative == 0 {
            h = .pow(8 * ε, ℝ(1)/ℝ(3))
        } else {
            h = .pow(8 * ε * abs(f(x) / thirdDerivative), ℝ(1)/ℝ(3))
        }
        
        // Computing the forward derivative and its absolute error
        let secondDerivative: ℝ = (f(x-2*h) - 2*f(x-h) + f(x)) / (h * h)
        let error: ℝ = {
            let a: ℝ = 4 * ε * abs(f(x)) / (h * h)
            let b: ℝ = h * abs(thirdDerivative)
            return a + b
        }()
        
        return (secondDerivative, error)
    }
    
    
    static func centralSecondDerivative<ℝ: Real>(of f: (ℝ) -> ℝ, at x: ℝ) -> (ℝ, ℝ) {
        // Defining the rounding error for the current data type
        let ε: ℝ = ℝ.ulpOfOne
        
        // Computing an estimation of the fourth derivative at x
        var h: ℝ = .pow(300 * ε, ℝ(1)/ℝ(6))
        let fourthDerivative: ℝ = (f(x-2*h) - 4*f(x-h) - 4*f(x+h) + f(x+2*h)) / (h * h * h * h)
        
        // Computing the optimal value of h
        // We ignore f(x) / f''''(x) if one of them is 0, so we still have the best possible value for h
        if f(x) * fourthDerivative == 0 {
            h = .pow(48 * ε, ℝ(1)/ℝ(4))
        } else {
            h = .pow(48 * ε * abs(f(x) / fourthDerivative), ℝ(1)/ℝ(4))
        }
        
        // Computing the forward derivative and its absolute error
        let secondDerivative: ℝ = (f(x-h) - 2*f(x) + f(x+h)) / (h * h)
        let error: ℝ = {
            let a: ℝ = 4 * ε * abs(f(x)) / (h * h)
            let b: ℝ = (ℝ(1)/ℝ(12)) * h * h * abs(fourthDerivative)
            return a + b
        }()
        
        
        return (secondDerivative, error)
    }
    
}
