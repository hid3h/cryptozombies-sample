pragma solidity ^0.8.0;

contract ZombieFactory {
  event NewZombie(uint zombieId, string name, uint dna);

  uint dnaDigits = 16;
  uint dnaModulus = 10 ** dnaDigits;

  struct Zombie {
    string name;
    uint dna;
  }

  Zombie[] public zombies;

  // 関数はデフォルトでパブリックになるのでprivateにしたかったらprivateと付ける必要がある
  // https://cryptozombies.io/jp/lesson/1/chapter/9
  function _createZombie(string memory _name, uint _dna) private {
    zombies.push(Zombie(_name, _dna));
    uint id = zombies.length - 1;
    emit NewZombie(id, _name, _dna);
  }

  // viewを付けると読み取り専用になり、アプリ内のデータを編集できなくなる
  // https://cryptozombies.io/jp/lesson/1/chapter/10
  function _generateRandomDna(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(bytes(_str)));
    return rand % dnaModulus;
  }

  function createRandomZombie(string memory _name) public {
    uint randDna = _generateRandomDna(_name);
    _createZombie(_name, randDna);
  }
}
