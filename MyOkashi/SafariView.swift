//
//  SafariView.swift
//  MyOkashi
//
//  Created by 伊藤浩之 on 2022/09/07.
//

import SwiftUI
import SafariServices

//SESafariViewControllerを起動する構造体
struct SafariView: UIViewControllerRepresentable {
    //表示するホームページのURLを受ける変数
    var url: URL
    
    //表示するViewを生成する時に実行
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    //Viewが更新せれた時に実行
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        //処理なし
    }
}
