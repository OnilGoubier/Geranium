accessing
computeDailyAverageForAYearTemperatureSeries

	|avDailyTempSeries |

	avDailyTempSeries := 
			(0 to: 364) collect: 
				[  :day | (((self temperatureSeries) collect:
								[ :t | t ] from: day*24+1 to: (day+1)*24) sum)/24].
	
	^ avDailyTempSeries.