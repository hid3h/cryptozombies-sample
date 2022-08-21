pragma solidity ^0.8.0;

import "./ZombieFactory.sol";

abstract contract KittyInterface {
  function getKitty(uint256 _id) virtual external view returns (
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
  );
}

contract ZombieFeeding is ZombieFactory {

  address ckAddress = 0xB262459E4112B34170e6bf0Fd01a8F898f526A8C;

  KittyInterface ckContract = KittyInterface(ckAddress);

  function feedAndMultiply(uint _zombieId, uint _targetDna, string memory _species) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    // zombieIdはzombiesのindexなので
    Zombie storage myZombie = zombies[_zombieId];

    _targetDna = _targetDna % dnaModulus;
    uint newDna = (myZombie.dna + _targetDna) / 2;

    if (keccak256(bytes(_species)) == keccak256("kitty")) {
      newDna = newDna - newDna % 100 + 99;
    }

    _createZombie("NoName", newDna);
  }

  function feedOnKitty(uint _zombieId, uint _kittyId) public {
    uint kittyDna;
    (,,,,,kittyDna) = ckContract.getKitty(_kittyId);
    feedAndMultiply(_zombieId, kittyDna, "kitty");
  }
}
