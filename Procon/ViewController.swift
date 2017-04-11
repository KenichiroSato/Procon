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

    private func start() {

        //import Foundation
        //extension String: Collection {}

        func read() -> String {
            //return readLine()!
            return FileLoader.read()
        }
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
}

//C016:Leet文字列 
func C016() {
    let st = read()
    let newSt = st.replacingOccurrences(of: "A", with: "4")
        .replacingOccurrences(of: "E", with: "3")
        .replacingOccurrences(of: "G", with: "6")
        .replacingOccurrences(of: "I", with: "1")
        .replacingOccurrences(of: "O", with: "0")
        .replacingOccurrences(of: "S", with: "5")
        .replacingOccurrences(of: "Z", with: "2")
    
    print(newSt)
}

//C015:ポイントカードの計算
func C015() {
    let num = Int(read())!
    var sum = 0
    for _ in 0 ..< num {
        let numR = read().split(separator: " ")
        let day = numR[0]
        let b = Double(numR[1])!
        
        let ratio = day.contains("3") ? 0.03 :
            day.contains("5") ? 0.05 : 0.01
        
        sum += Int(b * ratio)
        
    }
    print(sum)
}

//C010:安息の地を求めて
func C010() {
    func printresult(_ ok:Bool) {
        let text = ok ? "silent": "noisy"
        print(text)
    }
    
    let numR = read().split(separator: " ")
    let a = Int(numR[0])!
    let b = Int(numR[1])!
    let R = Int(numR[2])!
    
    let distance2  = { (x:Int,y:Int) in
        return ((a-x)*(a-x) + (y-b)*(y-b))
    }
    
    let isSilent  = { (dis:Int) in
        return (dis >= R*R)
    }
    
    for _ in 0..<Int(read())! {
        let xy:[Int] = read().split(separator: " ").map({Int($0)!})
        let distance = distance2(xy[0],xy[1])
        printresult(isSilent(distance))
    }
}

//C014:ボールが入る箱
func C014() {
    let numR = read().split(separator: " ")
    let n = Int(numR[0])!
    let r = Int(numR[1])!
    
    for i in 1...n {
        let nums:[Int] = read().split(separator: " ").map({Int($0)!})
        if (2*r <= nums.min()!){
            print(i)
        }
    }
    
}

//C008:文字列の抽出
func C008() {
    func result(_ str:String)-> String {
        if str.isEmpty {return "<blank>"}
        return str
    }
    
    let tags = read().split(separator: " ")
    
    let getRange: (String) -> (range:Range<String.Index>, next:String.Index)? = { text in
        guard let startRange = text.range(of: tags[0]) else {return nil}
        guard let endRange = text.range(of: tags[1]) else {return nil}
        let start = startRange.upperBound
        let end = endRange.lowerBound
        return (Range(uncheckedBounds: (start, end)), endRange.upperBound)
    }
    
    var text = read()
    while(true) {
        guard let nextRange = getRange(text) else { break}
        let subString = text.substring(with: nextRange.range)
        text = text.substring(from: nextRange.next)
        print(result(subString))
    }
}


//C013:嫌いな部屋番号が入っているかを調べる
func C013() {
    var printed = false
    let dislike = read()
    let num = Int(read())!
    
    let checkLike: (String) -> Bool = { roomS in
        return !(roomS.characters.contains(Character(dislike)))
    }
    
    for _ in 0..<num {
        let roomS = read()
        if (checkLike(roomS)) {
            print(roomS)
            printed = true
        }
    }
    if (!printed) {
        print ("none")
    }
}

func read() -> String {
    //return readLine()!
    return FileLoader.read()
}

