# root-protobuf

[Protocol Buffer Basics C++ Protocol Buffers Google Developers](https://developers.google.com/protocol-buffers/docs/cpptutorial)を参考に作成

* [ROOT_ analyzing petabytes of data, scientifically. - ROOT](https://root.cern/)

## ビルド

### 必要なパッケージ

* C++11
* GCC 4.8以降
* ROOT 6.0以降
* Google Protocol Buffers (protobuf) 3.6以降

### ビルド

```shell
git clone https://github.com/mashiya85/root-protobuf.git
cd root-protobuf
make
```

## 実行

1. 以下のような`.rootlogon.C`を作成し、ROOT起動時に読み込むようにしておくと良い。
```cpp
{
    // Add link for Google Protocol Buffers.
    gROOT->ProcessLine(".include /path/to/install-protobuf-dir/include");
    gSystem->Load("/path/to/install-protobuf-dir/lib/libprotobuf.so");
}
```
2. .pbファイルを作成する。
```
$ root -b -l -q AddressbookWrite.C

Processing AddressbookWrite.C...
addressbook.pb: File not found.  Creating a new file.
Enter person ID number: 1
Enter name: fred
Enter email address (blank for none): foobar@example.com
Enter a phone number (or leave blank to finish): 0123456789
Is this a mobile, home, or work phone? home
Enter a phone number (or leave blank to finish):
```
3. 作成された.pbファイルを読み込む。
```
$ root -b -l -q AddressbookRead.C

Processing AddressbookRead.C...
Person ID: 1
  Name: fred
  E-mail address: foobar@example.com
  Home phone #: 0123456789
```
