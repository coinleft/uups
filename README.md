
#### how to use 
1. forge install 
```
forge install OpenZeppelin/openzeppelin-contracts-upgradeable
forge install OpenZeppelin/openzeppelin-contracts
```

2. Add remappings.txt
```
@openzeppelin/contracts/=lib/openzeppelin-contracts/contracts/
@openzeppelin/contracts-upgradeable/=lib/openzeppelin-contracts-upgradeable/contracts/
```
3. add .env
KEY=0x123
URL=
```
export $(grep -v '^#' .env | xargs)
```

4. run script
setup owner first in CounterV1.s.sol
```
 forge script script/CounterV1.s.sol:CounterScript --rpc-url $URL --broadcast
```
setup proxy address
```
forge script script/Upgrade.s.sol:UpgradeScript --rpc-url $URL --broadcast  
```

5. reference
https://www.rareskills.io/post/uups-proxy
https://github.com/OpenZeppelin/openzeppelin-contracts
https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable