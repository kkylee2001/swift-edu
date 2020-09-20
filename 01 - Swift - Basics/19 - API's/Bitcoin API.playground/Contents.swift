import UIKit
struct BitcoinData: Codable{
    let rate: Double
}

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "?apikey=17F49E2C-1476-4283-9316-3F7F6B72EACE"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(_ currency: String){
       let urlString = baseURL+currency+apiKey
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil{
                    print(error!)
                }
                if let safeData = data{
                    let coinsRates = self.parseJSON(safeData)
                    let stringRate = String(format: "%.0f", coinsRates!)
                    print("The Rate of Exchange for Bitcoin (BTC) and \(currency.uppercased()) is \(stringRate) of \(currency.uppercased()) per BTC")
                }}
            
            task.resume()}}
    
    
    func parseJSON(_ data: Data) -> Double?{
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode(BitcoinData.self, from: data)
            let rate = decodedData.rate
            return rate
        } catch {
            print(error)
            return nil}}
    
    
    func fetchRates(_ currency: String){
        getCoinPrice(currency)}}


let bitcoin = CoinManager()

print("The possible choices for Rate Comparison are \(bitcoin.currencyArray)")
bitcoin.getCoinPrice("GBP")

