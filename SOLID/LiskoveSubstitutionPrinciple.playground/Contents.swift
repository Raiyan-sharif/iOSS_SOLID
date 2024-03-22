import Foundation

class Rectangle: CustomStringConvertible{
    private var _width = 0
    private var _height = 0

    var width: Int
    {
        get{ return _width }
        set(value){ _width = value }
    }

    var height: Int
    {
        get{ return _height }
        set(value){ _height = value }
    }

    init(){

    }

    init(_ width: Int, _ height: Int){
        _width = width
        _height = height
    }

    var area: Int{
        return width*height
    }

    public var description: String
    {
        return "Width: \(width), height: \(height)"
    }

}

func setAndMeasure(_ rc: Rectangle)
{
    rc.width = 3
    rc.height = 4
    print("Expected area to be 12 but got \(rc.area)")
}

func main(){
    let rc = Rectangle()
    setAndMeasure(rc)
}

main()
