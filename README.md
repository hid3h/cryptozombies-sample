## CryptoZombies
https://cryptozombies.io/jp/

ブラウザ上ではなくローカル環境でやってみたもの。

## Gethの初期化
```
geth --datadir /app/ init /app/genesis.json
```

## Geth起動
```
geth --networkid "22" --nodiscover --datadir /app --http --http.addr "0.0.0.0" console 2>> /app/info.log
```
