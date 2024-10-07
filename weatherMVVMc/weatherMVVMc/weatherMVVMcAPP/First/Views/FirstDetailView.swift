//
//  FirstDetailView.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import SwiftUI

struct FirstDetailView: View {
    
    @ObservedObject var viewModel: FirstTabViewModel
    @State var dayText: String
    @State var weatherStatusText: String
    @State var weatherHiTempText: String
    @State var weatherLowTempText: String
    @State var weatherIcon: Image
    @State var weatherNightTempText: String
    @State var weatherEveningTempText: String
    @State var weatherDayTempText: String
    @State var weatherMorningTempText: String
    @State var weatherhumidityText: String
    @State var weatherGustText: String
    @State var weatherSunriseText: String
    @State var weatherSunsetText: String
    @State var weatherCloudsText: String
    @State var weatherPressureText: String
    @State var weatherWindText: String
    @State var weatherFeelsLikeNText: String
    @State var weatherFeelsLikeEText: String
    @State var weatherFeelsLikeDText: String
    @State var weatherFeelsLikeMText: String
    
    var body: some View {
        VStack {
            Text("\(dayText)")
                .font(Font.robotoTitle)
                .foregroundColor(Color.white)
            HStack {
                VStack {
                    weatherIcon
                        .resizable()
                        .frame(width: 150, height: 150)
                    Text("\(weatherStatusText)")
                        .font(Font.robotoTitle)
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(16)
                VStack {
                    Text("\(weatherHiTempText)")
                        .font(Font.robotoHiTemp)
                        .foregroundColor(Color.white)
                    Text("\(weatherLowTempText)")
                        .font(Font.robotoLowTemp)
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(16)
            }
        }
        .padding(.top, 12)
        .padding(.bottom, 12)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        List {
            Section {
                HStack {
                    Text("Night:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherNightTempText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Evening:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherEveningTempText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Day:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherDayTempText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Morning:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherMorningTempText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            } header: {
                Text("Temperature")
            } footer: {
                Text("imperial units")
            }
            Section {
                HStack {
                    Text("Humidity:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherhumidityText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Gust:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherGustText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Sunrise:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherSunriseText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Sunset:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherSunsetText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                HStack {
                    Text("Clouds:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherCloudsText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Pressure:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherPressureText) hPa")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Wind:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherWindText) km/h E")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            } header: {
                Text("weather")
            } footer: {
                Text("imperial units")
            }
            Section {
                HStack {
                    Text("Night:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherFeelsLikeNText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Evening:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherFeelsLikeEText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Day:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherFeelsLikeDText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Morning:")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(weatherFeelsLikeMText)")
                        .font(Font.robotoListHiTemp)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            } header: {
                Text("Feels Like")
            } footer: {
                Text("imperial units")
            }
        }
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FirstTabViewModel()
        FirstDetailView(viewModel: viewModel,
                        dayText: "October 3",
                        weatherStatusText: "Raining",
                        weatherHiTempText: "80",
                        weatherLowTempText: "69",
                        weatherIcon: Image("art_rain"),
                        weatherNightTempText: "75",
                        weatherEveningTempText: "80",
                        weatherDayTempText: "78",
                        weatherMorningTempText: "75",
                        weatherhumidityText: "53",
                        weatherGustText: "15",
                        weatherSunriseText: "7:30",
                        weatherSunsetText: "7:30",
                        weatherCloudsText: "86",
                        weatherPressureText: "1018",
                        weatherWindText: "8",
                        weatherFeelsLikeNText: "75",
                        weatherFeelsLikeEText: "82",
                        weatherFeelsLikeDText: "78",
                        weatherFeelsLikeMText: "74")
        
    }
}

