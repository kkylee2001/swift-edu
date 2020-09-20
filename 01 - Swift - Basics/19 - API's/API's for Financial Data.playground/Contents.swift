import UIKit


//periods are either FIFTEEN (15) or THIRTY (30)

func getMedianListingPrice(day: Int, month: Int, year: Int, periods: Int){
    let month = String(month)
    let day = String(day)
    let year = String(year)
    let periods = String(periods)
    let date = "\(year)-\(month)-\(day)"
    let urlString = "https://www.quandl.com/api/v3/datasets/FMAC/\(periods)US.json?start_date=\(date)&end_date=\(date)&api_key=xPNb7-w8tCe6MeZcyEcx"
    print(urlString)
    let url = URL(string: urlString)
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url!) {data, response, error in
        if let safeData = data{
            let interestRate = parseJSON(safeData)
            print(interestRate!)
            //print("On the day \(interestRate?.date ?? "NO DATA FOUND"), the U.S. Interest Rate was \(interestRate?.rate ?? 0.0)%, according to Freddie Mac.")
        }}
    task.resume()
}

func parseJSON(_ data: Foundation.Data) -> dataset?{
    let decoder = JSONDecoder()
    do {
        let decodedData = try decoder.decode(ResponseData.self, from: data)
        let parsedData = decodedData.dataset
        return parsedData
        //let dateTime = parsedData.startIndex
        //let rates = parsedData.endIndex
        //return InterestRate(date: dateTime, rate: rates)
    } catch {
        return nil
    }
}

struct InterestRate{
    var date: Any
    var rate: Any
}

struct ResponseData: Codable{
    var dataset: dataset
}
struct dataset: Codable{
    var data: data
}
struct data: Codable{
    var values: [String: Int]
}


getMedianListingPrice(day: 25, month: 06, year: 2020, periods: 15)
