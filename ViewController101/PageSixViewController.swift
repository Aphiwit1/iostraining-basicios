//
//  PageSixViewController.swift
//  ViewController101
//
//  Created by AphiwitSCB on 13/7/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit
import Charts
import DynamicColor

class PageSixViewController: UIViewController {
    
    @IBOutlet weak var mChartView: LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

       self.createLineChart()
    }
    
    func createLineChart() {
        // Chart Configure
        mChartView.chartDescription?.text = "www.codemobiles.com"
        mChartView.setExtraOffsets(left: 0, top: 0, right: 30, bottom: 0)
        
        mChartView.chartDescription?.font = UIFont.boldSystemFont(ofSize: 15)
        mChartView.xAxis.labelPosition = .bottom
        mChartView.leftAxis.enabled = true
        mChartView.rightAxis.enabled = false
        
        // Set colors
        view.backgroundColor = UIColor(hexString: "#ffffff")
        mChartView.chartDescription?.textColor = UIColor(hexString: "#FFFFFF").withAlphaComponent(0.9)
        mChartView.leftAxis.labelTextColor = UIColor(hexString: "#FFFFFF").withAlphaComponent(0.3)
        mChartView.leftAxis.gridColor = UIColor(hexString: "#FFFFFF").withAlphaComponent(0.1)
        mChartView.legend.textColor = UIColor(hexString: "#FFFFFF").withAlphaComponent(0.3)
        mChartView.xAxis.gridColor = UIColor(hexString: "#000000").withAlphaComponent(0.3)
        mChartView.xAxis.labelTextColor = UIColor(hexString: "#FFFFFF").withAlphaComponent(0.3)
        mChartView.backgroundColor = UIColor.clear
        mChartView.gridBackgroundColor = UIColor.clear
        
        let chartData = LineChartData()
        chartData.addDataSet(getDataSet1())
        //        chartData.addDataSet(dataSet)
        
        mChartView.data = chartData
    }
    
    func getDataSet1() -> LineChartDataSet {
        let rawData = [3.55, 2.67, 2.23, 3.90]
        var dataEntry: [ChartDataEntry] = []
        
        for i in 0 ... 3 {
            dataEntry.append(ChartDataEntry(x: Double(i), y: rawData[i]))
        }
        
        // Graphic configure
        let dataSet = LineChartDataSet(entries: dataEntry, label: "GOLD")
        
        dataSet.valueFont = UIFont.boldSystemFont(ofSize: 14)
        dataSet.valueFormatter = ValueFormatter()
        
        //        dataSet.drawFilledEnabled = true
        //        dataSet.fillColor = UIColor(hexString: "#6D95E8")
        //        dataSet.fillAlpha = 0.3
        dataSet.lineWidth = 4
        dataSet.mode = .linear
        dataSet.circleRadius = 10
        dataSet.circleHoleRadius = 7
        dataSet.colors = [UIColor(hexString: "#6cd3eb")]
        dataSet.setCircleColor(UIColor(hexString: "#252934"))
        dataSet.valueColors = [UIColor(hexString: "#2c2c2c").withAlphaComponent(0.5)]
        dataSet.circleHoleColor = UIColor(hexString: "FFFFF")
        
        return dataSet
    }
    
    @objc(ValueFormatter)
    public class ValueFormatter: NSObject, IValueFormatter {
        public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
            return String(format: "%.0f", locale: Locale.current, Double(value))
        }
    }
    
    
    

   

}
