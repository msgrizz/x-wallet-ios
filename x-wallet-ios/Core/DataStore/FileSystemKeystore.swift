//
//  FileSystemKeystore.swift
//  demo
//
//  Created by Evrins Hu on 13/03/2018.
//  Copyright © 2018 iClass. All rights reserved.
//

import Foundation

public class FileSystemKeystore {
    public let dataDirectory: URL
    public var fileMap = [DataType: URL]()
    
    init(dataDirectory: URL) throws {
        self.dataDirectory = dataDirectory
        try load()
    }
    
    func load() throws {
        let fm = FileManager.default
        try? fm.createDirectory(at: dataDirectory, withIntermediateDirectories: true, attributes: nil)
        let dataURLs = try fm.contentsOfDirectory(at: dataDirectory, includingPropertiesForKeys: [], options: [.skipsHiddenFiles])
        for url in dataURLs {
            do {
                if (url.isFileURL) {
                    let fileName = url.lastPathComponent
                    var parts = fileName.split(separator: "-", maxSplits: 1)
                    if (parts.count > 1) {
                        let dataType = DataType(rawValue: String(parts[0]))
                        fileMap[dataType!] = url
                    }
                }
            }
        }
    }

    func read<T>(dataType: DataType, password: String) -> [T]{
        let url = fileMap[dataType]
        if (url == nil) {
            return []
        }
        do {
            let dw = try DataWrapper(contentsOf: url!)
            let decryptedData = try dw.decrypt(password: password)
            //let decryptedString = String(data: decryptedData, encoding: .utf8)
            return try JSONDecoder().decode([T].self, from: decryptedData);
        } catch {
            return []
        }
    }

    func write<T: Encodable>(dataType: DataType, password: String, data: [T]) -> Bool {
        var url = fileMap[dataType]
        if (url == nil) {
            url = makeDataStoreURL(for: dataType)
            fileMap[dataType] = url
        }
        do {
            let jsonData = try JSONEncoder().encode(data)
            let dw = try DataWrapper(password: password, dataStore: jsonData, dataType: dataType)
            let json = try JSONEncoder().encode(dw)
            try json.write(to: url!, options: [.atomic])
        } catch {
            return false
        }
        return true
    }

    private func makeDataStoreURL(for dataType: DataType) -> URL {
        return dataDirectory.appendingPathComponent(generateFileName(dataType: dataType))
    }

    func generateFileName(dataType: DataType, date: Date = Date(), timeZone: TimeZone = .current) -> String {
        // keyFileName implements the naming convention for keyfiles:
        // UTC--<created_at UTC ISO8601>-<address hex>
        return "\(dataType)--\(filenameTimestamp(for: date, in: timeZone))"
    }

    private func filenameTimestamp(for date: Date, in timeZone: TimeZone = .current) -> String {
        var tz = ""
        let offset = timeZone.secondsFromGMT()
        if offset == 0 {
            tz = "Z"
        } else {
            tz = String(format: "%02d00", offset/60/60)
        }

        let components = Calendar(identifier: .iso8601).dateComponents(in: timeZone, from: date)
        return String(format: "%04d-%02d-%02dT%02d:%02d:%02d.%03d+%@", components.year!, components.month!, components.day!, components.hour!, components.minute!, components.second!, components.nanosecond! / 1_000_000, tz)
    }

}

