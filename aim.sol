import "libraries/objectives.sol";
contract Aim{
    address public user;
    bytes public ipfs; //ipfs hash
    objectives.objectiveList public current_objectives; //Sorted in order of due date
    //TODO: Implement repeated objectives efficiently. Idea: Implement repeated tsks as single objectives that re-add themselves (low storage, but high computation cost if not updated regularly)
    uint funding;
    bool public funded;
    //Token token; 
    
    function Aiml(){ //Constructor
        
    }
    
    function addobjective(bytes ipfs, uint start, uint end, address validator, uint betterlucknexttime, uint reward, uint freq) public returns (uint ID){
       if(msg.sender != user) throw;
        ID = uint(sha3(msg.sender,validator,start));
        objectives.objective objective;
        objective.user = user;
        objective.objectiveID = ID;
        objective.ipfsData = ipfs;
        objective.startTime = start;
        objective.duration = end-start;
        objective.validator = validator;
        objective.betterlucknexttime= betterlucknexttime;
        objective.reward = reward;
        objective.frequency = freq;
        objectives.add(current_objectives,objective);
    }
    
    
    //function completeobjective(uint index) public {
    //    objectives.complete(current_objectives.objectives[index]);
       // remove(index);
    //}
    

   // function checkFunding() returns (bool){ //aim only begins once contract is funded
   //     return token.balanceOf(this) >= funding;
  //  }
    
    //objective getter functions
    
    function getIpfs(uint ID) public returns(bytes){
        return current_objectives.objectives[objectives.find(current_objectives,ID)].ipfsData;
    }
    
    function getStart(uint ID) public returns (uint){
        return current_objectives.objectives[objectives.find(current_objectives,ID)].startTime;
    }
    
     function getEnd(uint ID) public returns (uint) {
        return current_objectives.objectives[objectives.find(current_objectives,ID)].startTime + current_objectives.objectives[objectives.find(current_objectives,ID)].duration;
    }
    
    function getReward(uint ID) public returns (uint,uint){ //Returns [reward,betterlucknexttime]
        return (current_objectives.objectives[objectives.find(current_objectives,ID)].reward, current_objectives.objectives[objectives.find(current_objectives,ID)].betterlucknexttime);
    }
    
    function getFrequency(uint ID) public returns (uint) {
        return current_objectives.objectives[objectives.find(current_objectives,ID)].frequency;
    }
}
