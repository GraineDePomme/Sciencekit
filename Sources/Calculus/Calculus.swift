import Foundation
import Numerics


enum DerivativeMethod {
    case forwardDerivative
    case centralDerivative
    case backwardDerivative
}


public enum Calculus {
    
    static func derivative<ℝ: Real>(of f: (ℝ) -> ℝ, at x: ℝ, using method: DerivativeMethod = .centralDerivative) -> (ℝ, ℝ) {
        var result: (ℝ, ℝ) = (0, 0)
        
        switch method {
        case .forwardDerivative:
            result = forwardDerivative(of: f, at: x)
        case .centralDerivative:
            result = centralDerivative(of: f, at: x)
        case .backwardDerivative:
            result = backwardDerivative(of: f, at: x)
        }
        
        return result
    }
    
    static func secondDerivative<ℝ: Real>(of f: (ℝ) -> ℝ, at x: ℝ, using method: DerivativeMethod = .centralDerivative) -> (ℝ, ℝ) {
        var result: (ℝ, ℝ) = (0, 0)
        
        switch method {
        case .forwardDerivative:
            result = forwardSecondDerivative(of: f, at: x)
        case .centralDerivative:
            result = centralSecondDerivative(of: f, at: x)
        case .backwardDerivative:
            result = backwardSecondDerivative(of: f, at: x)
        }
        
        return result
    }
}
