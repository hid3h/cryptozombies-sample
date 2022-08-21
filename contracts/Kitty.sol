pragma solidity ^0.8.0;

contract Kitty {
  function getKitty(uint256 _id) external pure returns (
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
  ) {
    siringWithId = 3;
    birthTime = 4;
    matronId = 5;
    sireId = 6;
    generation = 7;
    genes = _id * 2;

    return (
      siringWithId,
      birthTime,
      matronId,
      sireId,
      generation,
      genes
    );
  }
}
