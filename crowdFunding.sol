pragma solidity 0.5.8;

contract ProjectStatus { //abstract
    address public owner; 
    constructor () public {
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }
    event Funding(uint256 _balance);
    enum ProjectState {OPEN, CLOSED, GOALREACHED}
    ProjectState projectstatus;
    modifier OpenProject {
        require(projectstatus == ProjectState.OPEN);
        _;
    }
}
contract Project is ProjectStatus {
    struct projects{
        address addr;
        string projectName;
        uint256 fundingGoal;
        ProjectState projectstatus;
    }
    mapping (address => uint256) private GOAL;
    mapping (address => projects) public ProjectInfo;
    projects [] public projectList;
    event newProject(address addr, string projectName, uint fundingGOAL, ProjectState projectstatus);
    function addProject (address _addr, string memory _projectName, uint _fundingGOAL) public payable returns(address, string memory, uint, ProjectState){
        ProjectInfo[_addr]=projects(_addr, _projectName, _fundingGOAL, ProjectState.OPEN);
        projectList.push(ProjectInfo[_addr]);
        emit newProject(_addr, _projectName, _fundingGOAL, projectstatus);
        return (_addr, _projectName, _fundingGOAL, ProjectState.OPEN);
    }
    
    function closeProject(address addr) public OpenProject onlyOwner{
        ProjectInfo[addr].projectstatus = ProjectState.CLOSED;
    }
    function fundPledged(address addr) public view returns(uint256){
        return addr.balance;
    }
    function funded(address addr) public returns(bool){
         if (addr.balance > GOAL[addr]) {
            ProjectInfo[addr].projectstatus = ProjectState.GOALREACHED;
            log0("YES");
        } else {
            log0("NO");
        }
    }
    
    function withdrawFees(address addr, uint256 serviceFee)public onlyOwner returns (bool){
        require(addr.balance > GOAL[addr], "the project hasn't reached the goal yet :/");
        msg.sender.transfer(serviceFee);
        return true;
    }
}
