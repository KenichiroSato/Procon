//
//  ViewController.swift
//  Procon
//
//  Created by 2ndDisplay on 2017/02/09.
//
//

import UIKit


extension String: Collection {}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    

    private func start() {

        func read() -> String {
            //return readLine()!
            return FileLoader.read()
        }
    
        let params = read().split(separator: " ").map{Int($0)!}
        let numItems = params[0]
        let numMan = params[1]
        let topK = params[2]
        
        let points = read().split(separator:" ").map{Double($0)!}
        
        let scores: [Double] =
            (0..<numMan)
                .map{ _ ->[Double] in
                    read().split(separator: " ").map({Double($0)!})
                }.map{ d -> Double in
                    d.enumerated().reduce(0, {x, y in x + y.element*points[y.offset]})
                }.sorted(by: {(d1:Double, d2:Double) -> Bool in return d1 > d2})
    /*
        for i in 0..<numMan {
            let num = read().split(separator: " ").map{Int($0)!}
            var score = 0.0
            for j in 0..<points.count{
                score += points[j] * Double(num[j])
            }
            scores[i] = score
            //scores.append(score)
        }
         */
        //let results = scores.sorted(by: {$1 < $0})

        for i in 0..<topK {
            print(Int(scores[i].rounded()))
        }

    
    
    
    
    }

}


