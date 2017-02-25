//
//  ViewController.swift
//  TableView_LiT!
//
//  Created by 矢頭春香 on 2017/02/25.
//  Copyright © 2017年 矢頭春香. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var listTableView: UITableView!
    
    var wholeArray = [AnyObject]()
    
    let iphoneDictionary = ["name": "iPhoneアプリ開発コース", "picture": "eyecatch-iphone.jpg"]
    let androidDictionary = ["name": "Androidアプリ開発コース", "picture": "eyecatch-android.jpg"]
    let twoDgameDictionary = ["name": "ゲームクリエイター入門(2D)", "picture": "eyecatch-2d.jpg"]
    let UnityDictionary = ["name": "Unityゲームプログラミングコース(2D・3D)", "picture": "eyecatch-3d.jpg"]
    let webDesignDictionary = ["name": "Webデザインコース", "picture": "eyecatch-webdesign.jpg"]
    let webProgrammingDictionary = ["name": "Webサービスコース", "picture": "eyecatch-webservice.jpg"]
    let desingnerDictionary = ["name": "デザイナーコース", "picture": "eyecatch-designer.jpg"]
    let animationDictionary = ["name": "アニメーションコース", "picture": "eyecatch-animation.jpg"]
    let videoDictionary = ["name": "映像編集コース", "picture": "eyecatch-videoedit.jpg"]
    let mediaArtDictionary = ["name": "メディアアートコース", "picture": "eyecatch-mediaart.jpg"]
    let dtmDictionary = ["name": "デジタルミュージックコース", "picture": "eyecatch-dtm.jpg"]
    let minecraftDictionary = ["name": "MINECRAFTコース", "picture": "eyecatch-minecraft.jpg"]
    let mikuDictionary = ["name": "初音ミクV3コース", "picture": "eyecatch-miku.jpg"]
    let lineDictionary = ["name": "LINEスタンプクリエイターコース", "picture": "eyecatch-stamp.jpg"]
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        wholeArray = []
        if saveData.object(forKey: "courseArry") != nil {
            wholeArray = saveData.object(forKey: "courseArry") as! Array
        }else{
            wholeArray = [iphoneDictionary as AnyObject,androidDictionary as AnyObject,
                          twoDgameDictionary as AnyObject,UnityDictionary as AnyObject,webDesignDictionary as AnyObject,webProgrammingDictionary as AnyObject,desingnerDictionary as AnyObject,animationDictionary as AnyObject,videoDictionary as AnyObject,mediaArtDictionary as AnyObject,dtmDictionary as AnyObject,minecraftDictionary as AnyObject,mikuDictionary as AnyObject,lineDictionary as AnyObject]
        }
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        listTableView.register(UINib(nibName:"courseTableViewCell", bundle:nil), forCellReuseIdentifier: "myCell")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wholeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! courseTableViewCell
        
        let nowIndexPathDictionary: (AnyObject) = wholeArray[indexPath.row]
        //Cellに値を設定する
        cell.courseLable!.text = nowIndexPathDictionary["name"] as? String
        cell.courseImageView!.image = UIImage(named: nowIndexPathDictionary["picture"] as! String)
        return cell
    
    }
    
    //セルが選択されたら
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nowIndexPathDictionary: (AnyObject) = wholeArray[indexPath.row]
        NSLog("%d番目 == %@", indexPath.row, nowIndexPathDictionary["name"] as! String)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            wholeArray.remove(at: indexPath.row)
            saveData.set(wholeArray, forKey: "courseArray")
            listTableView.reloadData()
        }
    }
    
    @IBAction func reset(){
        wholeArray = [iphoneDictionary as AnyObject,androidDictionary as AnyObject,
                      twoDgameDictionary as AnyObject,UnityDictionary as AnyObject,webDesignDictionary as AnyObject,webProgrammingDictionary as AnyObject,desingnerDictionary as AnyObject,animationDictionary as AnyObject,videoDictionary as AnyObject,mediaArtDictionary as AnyObject,dtmDictionary as AnyObject,minecraftDictionary as AnyObject,mikuDictionary as AnyObject,lineDictionary as AnyObject]
        saveData.set(wholeArray, forKey: "courseArray")
        listTableView.reloadData()
    }

}

