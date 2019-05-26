# smart-contract
# crowdFunding management contract

This project consists of 2 smart contracts, project status change contract and Project contract. 

The whole project is designed for changing the status of the crowd funding projects, creating new crowdfunding project, checking if the crowdfunding project is funded or not, and if the crowdfunding project reached the funding goal or not, getting the project's information, and check the list of all the crowdfunding project managed by the owner of the contract, and the owner of the contract would receive the service fee from the projects after the project reached the funding goal. 

For each of the crowdfunding project on this smart contract, it has 4 elements, the address, name of the project, funding goal of the project, and the status of the project. 

Function addProject is for adding/creating new project, the inputs it takes are those 4 elements described in the struct of the contract. 

Function closeProject can only be used by the owner of the contract, which means only owner can decide which project to keep under his/her management. (For example, if it's a shitty project, owner can decide to close it) 

Function FundPledged is for checking the amount of fund has been pledged to the project.

Function Funded is for checking if the funding of the project (address of the project) has reached the funding goal or not. 

Function withdrawFees is for owner to charge the service/management fee on the project after the project reached its funding goal. 
