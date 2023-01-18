# INTEGRATING BLOCKCHAIN TECHNOLOGY WITHIN IOT (SMART GRID) FOR SECURE AUTHENTICATION AND AUTHORIZATION

This repository contains the source codes  for testing the functionality of the blockchain protocol deployed for securing user access in IoT systems. For the purpose of this project, we have limited the scope  to only smart grid systems.



# Smart contracts directory

1. Code for the Table contract is Table.sol
2. Code for the Authentication contract is Authentication.sol
3. Code for the Authorization contract is Authorization.sol


# Steps in executing the codes on Ethereum online blockchain platform
For testing of this codes, Ganache App have to be downloaded on the computer, which ia available from https://truffleframework.com/ganache

1. Enter the online version of remix ethereum on https://remix.ethereum.org 
2. Create a new work space
3. Create 3 new files under the contract folder and name them as follow:
    --Table.sol 
    --Authentication.sol
    --Authorization.sol

4.  i)Copy and paste the Authentication contract code into the  Authentication.sol.
    ii) Copy and paste the Table contract code from the repositoy into the Table.sol file
    iii)  Copy and paste the Authorization contract code from the repositoy into the Authorization.sol file
    iv) copy and paste the Asset contract code from the repository into the Asset.sol file

5. On the left hand side of the remixethereum platform, click on the "SOLIDITY-COMPILER" button. And change the compiler to  "0.6.7+commit.b8d736ae". 
6. Download and Install Ganache on the computer.
7. After installing Ganache, Click on "Quickstart"
8. On ganache app, Copy the "RPC SERVER" address at the top of the screen.
9. On the remix-ethereum platform, click on the "DEPLOY and RUN transaction" button at the left side of the page.
10. Click on the ENVIRONMENT drop down button, and change it to "Ganache provider". 
11. On the small page shown, input the "RPC SERVER" address and connect.
12. Now, Ethereum  should now be connected to the Ganache network. For confirmation, Under the  ENVIRONMENT dropdown button, you should see Ganache network connected.
13. You can then, test the functionality of the contracts, by clicking  deploy.


