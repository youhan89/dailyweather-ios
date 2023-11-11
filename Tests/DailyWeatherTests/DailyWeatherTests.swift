import XCTest
@testable import DailyWeather

final class DailyWeatherTests: XCTestCase {
    func testSunnyForecast() throws {
        let forecast = DailyForecast.stubSunnyDay()
        
        XCTAssertEqual(forecast.highTemperature.value, 30.0)
        XCTAssertEqual(forecast.lowTemperature.value, 25.0)
        
        XCTAssertEqual(forecast.sfSymbol, "sun.max")
        
        XCTAssertEqual(forecast.weekday, "Sunday")
        
        XCTAssertEqual(forecast.description, "Sun")
    }
    
    func testRainForecast() throws {
        let forecast = DailyForecast.stubRainyDay()
        
        XCTAssertEqual(forecast.highTemperature.value, 20.0)
        XCTAssertEqual(forecast.lowTemperature.value, 10.0)
        
        XCTAssertEqual(forecast.sfSymbol, "cloud.rain.fill")
        
        XCTAssertEqual(forecast.weekday, "Sunday")
        
        XCTAssertEqual(forecast.description, "Light rain")
    }
    
    func testSnowForecast() throws {
        let forecast = DailyForecast.stubSnowDay()
        
        XCTAssertEqual(forecast.highTemperature.value, 0.0)
        XCTAssertEqual(forecast.lowTemperature.value, -5.0)
        
        XCTAssertEqual(forecast.sfSymbol, "cloud.snow")
        
        XCTAssertEqual(forecast.weekday, "Sunday")
        
        XCTAssertEqual(forecast.description, "Snow")
    }
    
    func testWind() {
        let forecast = DailyForecast.stubRainyDay()
        
        XCTAssertEqual(forecast.wind.compassDirection, .south)
        XCTAssertEqual(forecast.wind.speed.value, 8.0)
        XCTAssertEqual(forecast.wind.gusts?.value, 12.0)
    }
    
    func testPrecipitation() {
        let forecast = DailyForecast.stubRainyDay()
        
        XCTAssertEqual(forecast.precipitation.chance, 0.3)
        XCTAssertEqual(forecast.precipitation.rainfallAmount.value, 0.5)
        XCTAssertEqual(forecast.precipitation.snowfallAmount.value, 0.0)
    }
}
