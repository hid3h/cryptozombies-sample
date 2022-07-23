// バージョンプラグマの指定
pragma solidity >= 0.4.0 < 0.9.0;

// コントラクトを宣言
contract StorageSample {
  uint storedData;

  function set(uint x) public {
    storedData = x;
  }

  function get() public view returns (uint) {
    return storedData;
  }
}
