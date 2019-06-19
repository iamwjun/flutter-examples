## Problems and solutions

01 - Unable to load asset
- Import static resources into the pubspec.yaml file
- 静态资源需要先写puspec.yaml文件,图片、字体等

02 - Program linking failed
- Flutter clean
- 项目目录下运行：Flutter clean
```bash
   Flutter clean
```

03 - Error connecting to the service protocol: HttpException: Connection closed before full header was received
- Android Virtual Device Using the Android version is too high
- Android Virtual Device 使用的Android版本太高，降低版本

04 - shader compilation error
- use flutter stable version, flutter channel stable
- 使用flutter稳定版本，目前该问题出现在1.6.0 至 1.7.4 dev版本中
```bash
   flutter channel stable
```
04 - BoxConstraints has both a negative minimum width and a negative minimum height.
- The double type passed when setting Icon size and Text fontSize needs to take the absolute value.
- 设置 Icon size和Text fontSize时传入的double类型需要取绝对值
- example: lib\pages\Quiz\correctWrongOverlay.dart line 52 and line 58