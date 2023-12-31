//
//  ProfitCountDataModel.swift
//  Metric WidgetExtension
//
//  Created by Ondrej Barta on 18.11.23.
//

import Foundation

struct ProfitDataPoint: Codable, Identifiable {
    let t: Int
    let v: Double
    var id: Int { t }
}

// To handle the full data as an array of data points
typealias ProfitData = [ProfitDataPoint]

func loadProfitData() -> ProfitData? {
    guard let url = Bundle.main.url(forResource: "profit_count", withExtension: "json") else {
        print("Profit data JSON file not found")
        return nil
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let profitData = try decoder.decode(ProfitData.self, from: data)
        return profitData
    } catch {
        print("Error decoding profit data: \(error)")
        return nil
    }
}
