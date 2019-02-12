//
//  ViewController.swift
//  L4S_09_TechPod
//
//  Created by 鍋島 由輝 on 2019/02/09.
//  Copyright © 2019 ValJapan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //StoryBoardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    //曲名を入れるための配列
    var songNameArray = [String]()
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    //音楽家の画像を入れるための配列
    var imageNameArray = [String]()

    //音楽を再生するための変数
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //テーブルビューのてデータソースメソッドはviewControllerクラスに書くよ、という設定
        table.dataSource = self

        //テーブルビューのsでデリゲートメソッドはViewControllerのメソッドに書くよ、という設定
        table.delegate = self

        //songNameArrayに曲名を入れておく
        songNameArray = ["カノン", "エリーゼのために", "G船上場のアリア"]

        //fileNameArrayにファイル名を入れていく
        fileNameArray = ["cannon", "elise", "aria"]

        //imageNameArrayに曲の画像の名前を入れていく
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }

    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }

    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」を表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        //セルにsongNameArrayの曲名を表示する
        cell?.textLabel?.text = songNameArray[indexPath.row]

        //セルに音楽家の画像を表示する
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])

        return cell!
    }

    //セルが押されたときに呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました！")

        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)

        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)

        //音楽を再生
        audioPlayer.play()
    }

}

