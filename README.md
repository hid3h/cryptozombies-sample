## CryptoZombies
https://cryptozombies.io/jp/

ブラウザ上ではなくローカル環境でやってみたもの。

## Gethの初期化
```
geth --datadir /app/ init /app/genesis.json
```

## Geth起動
```
geth --networkid "22" --nodiscover --datadir /app --http --http.addr "0.0.0.0" --http.corsdomain "*" --http.api personal,eth,net,web3 --allow-insecure-unlock console 2>> /app/info.log
```

## コンパイル
```
cd contracts
docker-compose run --rm app --abi --bin --overwrite-o /code/solcoutput /code/Contract.sol 
```
