accessing
computeDailyAverageForAYearHumiditySeries

	|avDailyHumSeries |

	avDailyHumSeries := 
			(0 to: 364) collect: 
				[  :day | (((self computeYearlyHumiditySeries) collect:
								[ :t | t ] from: day*24+1 to: (day+1)*24) sum)/24].
	
	^ avDailyHumSeries.