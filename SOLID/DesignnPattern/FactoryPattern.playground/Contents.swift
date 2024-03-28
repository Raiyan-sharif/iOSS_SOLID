import Foundation

class Point : CustomStringConvertible
{
    var x, y: Double

    static let factory = PointFactory.instance

    private init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    private init(rho: Double, theta: Double){
        x = rho * cos(theta)
        y = rho * sin(theta)
    }

    var description: String
    {
        return "x = \(x), y = \(y)"
    }
    class PointFactory
    {
        static let instance = PointFactory()
        private init()
        {

        }

        func createCartesian(x: Double, y: Double) -> Point
        {
            return Point(x: x, y: y)
        }

        func createPolar(rho: Double, theta: Double) -> Point
        {
            return Point(rho: rho, theta: theta)
        }
    }
}


func main()
{
    let p = Point.factory.createCartesian(x: 1, y: 2)
}

main()

