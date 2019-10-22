当前目录中baksmali和smali版本是 2.3.4

baksmali disassemble app.apk -o app
smali assemble app -o classes.dex

或者

java -jar baksmali.jar disassemble app.apk -o app
java -jar smali.jar assemble app -o classes.dex



