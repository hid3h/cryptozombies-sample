## CryptoZombies
https://cryptozombies.io/jp/

ブラウザ上ではなくローカル環境でやってみたもの。

## Gethの初期化
```
geth --datadir /app/ init /app/genesis.json
```

## Geth起動
```
geth --networkid "22" --nodiscover --datadir /app --http --http.addr "0.0.0.0" --http.corsdomain "*" --http.api personal,eth,net,web3 --allow-insecure-unlock --ws --ws.addr "0.0.0.0" --ws.api personal,eth,net,web3 console 2>> /app/info.log
```

## コンパイル
```
cd contracts
docker-compose run --rm app --abi --bin --overwrite -o /code/solcoutput /code/ZombieFeeding.sol 
```

## デプロイ
```
docker-compose exec app1 /bin/sh
# Geth起動
bin = "0x"
abi = []
contract = eth.contract(abi)
# アンロックが必要であればpersonal.unlockAccount(eth.accounts[0])
myContract = contract.new({ from: eth.accounts[0], data: bin})
```
