import ArgumentParser
import Foundation

@main
struct XcodeShell: ParsableCommand {
    static var configuration: CommandConfiguration {
        return .init(commandName: "xcodeShell",
                     abstract: "Utilities for xcode",
                     subcommands: [
                         PrettyJSON.self,
                         XCodeSort.self
                     ])
    }
}

struct PrettyJSON: ParsableCommand {
    @Option(help: "exclude patterns. ex: '--exclude .xcassets'")
    private var exclude: [String] = []

    @Option(help: "exclusive patterns. ex: '--exclusive /Fixtures/'")
    private var exclusive: [String] = []

    static var configuration: CommandConfiguration {
        return .init(commandName: "pretty")
    }

    func run() throws {
        let paths = findJSONs(at: FileManager().currentDirectoryPath).filter { path in
            for string in exclusive {
                return path.contains(string)
            }
            return true
        }

        for path in paths {
            do {
                let url = URL(fileURLWithPath: path)
                let dataFile = try Data(contentsOf: url)
                let obj = try JSONSerialization.jsonObject(with: dataFile)
                let dataObj = try JSONSerialization.data(withJSONObject: obj, options: [.prettyPrinted, .sortedKeys])
                if let text = String(data: dataObj, encoding: .utf8) {
                    try (text + "\n").write(to: url, atomically: true, encoding: .utf8)
                } else {
                    try dataObj.write(to: url, options: .atomic)
                }

                print("\(path) - done")
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    private func findJSONs(at path: String) -> [String] {
        for string in exclude {
            if path.contains(string) {
                return []
            }
        }

        var isDirectory: ObjCBool = false
        guard FileManager().fileExists(atPath: path, isDirectory: &isDirectory), isDirectory.boolValue else {
            return path.hasSuffix(".json") ? [path] : []
        }

        var result: [String] = []
        let subpaths = try? FileManager().contentsOfDirectory(atPath: path)
        for sub in subpaths ?? [] {
            result += findJSONs(at: [path, sub].joined(separator: "/"))
        }
        return result
    }
}

struct XCodeSort: ParsableCommand {
    static var configuration: CommandConfiguration {
        return .init(commandName: "sort",
                     abstract: "A utility for xcode")
    }

    func run() throws {
    }
}

private extension Encodable {
    var prettyString: String {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            let data = try encoder.encode(self)
            return String(data: data, encoding: .utf8) ?? "<can't encode string>"
        } catch {
            return error.localizedDescription
        }
    }
}

//private extension ParsableCommand {
//    var scriptURL: URL {
//        return ProcessInfo().environment["PWD"].flatMap(URL.init(string:)).unsafelyUnwrapped
//    }
//}
