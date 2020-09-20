import UIKit

//MARK: - FOUR STEPS OF NETWORKING
    //1. CREATE A URL
    //2. CREATE A URL SESSSION
    //3. GIVE THE SESSION A TASK
    //4. START THE TASK

//MARK: - FIRST STRUCT: HOW WE WANT THE WEATHER TO LOOK
struct WeatherModel{
        let conditionId: Int
        let cityName: String
        let temperature: Int
        var roundedTemp: String{
            return String(format: "%.1f", temperature)}}

//MARK: - HOW THE DATA IN THE JSON FILE LOOKS
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]}

struct Main: Codable {
    let temp: Double}

struct Weather: Codable {
    let id: Int}

//MARK: - ESTABLISHING THE DELEGATE PATTERN
protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManageer: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

//MARK: - THE FOUR STEPS IN A STRUCT
struct WeatherManager{
    var delegate: WeatherManagerDelegate?
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=59a74eeee4b3b2c8da640dc71ad6afbb&units=imperial"
                                                                //MARK: - 1. MAKE A URL
    func fetchWeather(_ cityName: String){
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString)
    }
                                                                //MARK: - 2. Create a Session
    func performRequest(_ urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
                                                                //MARK: - 3. Give the Session a Task
            let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return}
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }}}
                                                                //MARK: - 4. Start the Task
            task.resume()
        }}
                                                                //MARK: - Part of the Task
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: Int(temp))
            print("The Temperature in \(weather.cityName) is \(weather.temperature)°F.")
            return weather
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }}}
                                                                //MARK: - New Class, Testing the Code
class WeatherAPI: WeatherManagerDelegate{
    var weatherManager = WeatherManager()
        func didUpdateWeather(_ weatherManageer: WeatherManager, weather: WeatherModel) {
        weatherManager.delegate = self}
    func didFailWithError(error: Error) {
        print(error)}
    
    func getTheWeather(location: String){
        let requestedLocation = location
         weatherManager.fetchWeather(requestedLocation)}}

let catchTheWeather = WeatherAPI()
catchTheWeather.getTheWeather(location: "spring")

