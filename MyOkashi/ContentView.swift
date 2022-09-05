//
//  ContentView.swift
//  MyOkashi
//
//  Created by 伊藤浩之 on 2022/09/05.
//

import SwiftUI

struct ContentView: View {
    //OkashiDataを参照する状態状態変数
    @StateObject var okashiDataList = OkashiData()
    //入力された文字列を保持する状態変数
    @State var inputText = ""
    
    
    var body: some View {
        //垂直にレイアウト
        VStack{
            //文字を受け取るTextFieldを表示する
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    //Taskは非同期で処理を実行できる
                    Task {
                        //入力完了直後に検索をする
                        await okashiDataList.searchOkashi(keyword: inputText)
                    }
                }
                //キーボードの改行を検索に変更する
                .submitLabel(.search)
                //上下左右に変換
                .padding()
            
        }//VStack
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}