pragma solidity 0.5.8;

interface IModifyBeneficiary {
    enum OwnerState {ALIVE, DIESOON, DEAD}
    function changeBeneficiary (address newBeneficiary) external;
}


contract Beneficiary is IModifyBeneficiary {
    address public beneficiary;
    event BeneficiaryChanged(address newBeneficiary);
    OwnerState public currentOwnerState;
    
    constructor (address _beneficiary) public{
        beneficiary = _beneficiary;
    }
    
    function changeBeneficiary(address newBeneficiary) public {
        beneficiary = newBeneficiary;
        emit BeneficiaryChanged(newBeneficiary);
    } 
}