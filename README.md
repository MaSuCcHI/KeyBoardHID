# 実現できず．
### 方針等
HOGPのhid service をアドバタイズしています．

HID プロファイル対応の接続先から接続要求をしても　
func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest])　
などにリクエストが来ず接続ができません．

パケットを覗いてみると接続要求後    Read By Group Type Response　が永遠に送信・受信されています．

アプリケーションの起動後Bluetooth EXplorerでデバイス情報を確認するとHIDservice　は対応していないと表示されます．

http://sassembla.github.io/Public/2014:09:14%2014-40-08/2014:09:14%2014-40-08.html　こちらの記事でも試されていますが，UUIDの設定でエラーが出なかったのでいけるかと思いやりましたが，ちょっと無理そうです．

何かわかる人がいれば教えてください．

## 参考サイト
- http://sassembla.github.io/Public/2014:09:14%2014-40-08/2014:09:14%2014-40-08.html
- https://builderscon.io/builderscon/tokyo/2016/session/84890125-4acb-44af-a6a7-679d45b93043
- https://www.bluetooth.com/ja-jp/specifications/gatt/
- https://developer.apple.com/documentation/corebluetooth

