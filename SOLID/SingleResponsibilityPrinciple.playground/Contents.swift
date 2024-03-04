import Foundation

class Journal : CustomStringConvertible
{
    var entries = [String]()
    var count = 0

    var description: String
    {
        return entries.joined(separator: "\n")
    }
    func addEntry(_ text: String) -> Int
    {
        count += 1
        entries.append("\(count): \(text)")
        return count-1
    }

    func removeEntry(_ index: Int)
    {
        entries.remove(at: index)
    }
}

class Persistence
{
    func saveToFile(_ journal: Journal, _ filename: String, _ overwrite: Bool = false)
    {

    }
}

func main(){
    let j = Journal()
    let _ = j.addEntry("I had Breakfast Today")
    let bug = j.addEntry("I had Dinner last day")
    print(j)
    j.removeEntry(bug)
    print("===========")
    print(j)

    let p = Persistence()
    let filename = "student\\learn"
    p.saveToFile(j, filename, false)

}

main()
