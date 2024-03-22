import UIKit

class Document
{

}

protocol Printer
{
    func print(d: Document)
}

protocol Scanner
{
    func scan(d: Document)
}

protocol Fax
{
    func fax(d: Document)
}

class OridinaryPrinter: Printer
{
    func print(d: Document) {

    }
}

class PhotoCopier: Printer, Scanner
{
    func print(d: Document) {

    }

    func scan(d: Document) {

    }
}

protocol MultiFunctionDevice: Printer, Scanner, Fax
{

}

class MultiFunctionMachine: MultiFunctionDevice
{

    
    let printer: Printer
    let scanner: Scanner
    init(printer: Printer, scanner: Scanner) {
        self.printer = printer
        self.scanner = scanner
    }
    func print(d: Document) {

    }

    func scan(d: Document) {

    }

    func fax(d: Document) {
        
    }
}


