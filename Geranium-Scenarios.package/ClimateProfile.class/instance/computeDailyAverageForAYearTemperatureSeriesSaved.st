accessing
computeDailyAverageForAYearTemperatureSeriesSaved
"it seems this one takes time"
	|avDailyTempSeries |

	avDailyTempSeries := 
			(0 to: 364) collect: 
				[  :day | (((self computeYearlyTemperatureSeries) collect:
								[ :t | t ] from: day*24+1 to: (day+1)*24) sum)/24].
	
	^ avDailyTempSeries.