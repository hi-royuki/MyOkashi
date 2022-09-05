//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 伊藤浩之 on 2022/09/05.
//

import Foundation

//お菓子データ検索用クラス
class OkashiData: ObservableObject{
    //JSONのデータ構造
    struct ResultJson: Codable {
        //JSONのitem内のデータ構造
        struct Item: Codable {
            //お菓子の名称
            let name = String?
            //URL
            let url = URL?
            //画像URL
            let image = URL?
            
        }
        //複数要素
        let item: [Item]?
    }
    
    //Web API検索用メソッド　第一引数: keyword 検索したいワード
    func searchOkashi(keyword: String) async {
        //デバックエリアに出力
        print(keyword)
        //お菓子の検索キーワードをURLエンコードする.
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            else {
            return
        }
        
        //リクエストURLの組み立て
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json$keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
    }
}
