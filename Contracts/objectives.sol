pragma solidity ^0.5.0;

contract Validator{ //Abstract contract defining validator ABI
    function validate(uint objectiveID, bytes data) returns (bool val);
}
library objectives {
    
    
    struct objectiveList {
        uint80 first;
        uint80 last;
        uint80 count;
        objective[] objectives;
    }
    uint80 constant None = uint80(0);
    struct objective { //TODO: Define objectives
        address user;
        uint objectiveID;
        bytes ipfsData; //note: ipfs uses arbitrary-length addresses
        uint startTime;
        uint duration;
        address validator;
        uint betterlucknexttime; //betterlucknexttime; for not completing, denominated in whatever token the Goal uses
        uint reward;
        uint frequency; // 0 if single objective, repeat period if > 0
        uint80 prev;  //linked list structure 
        uint80 next;
    }
    
    //Checks that objective is within valid time range and calls validator contract
    function validate(objective storage self, bytes validationData) returns (bool){
        if(block.timestamp > self.startTime && block.timestamp < self.startTime + self.duration){
            return  Validator(self.validator).validate(self.objectiveID, validationData);
        }
        return false;
    }
    
    function complete(objectiveList storage self, uint ID, bytes validationData) returns (uint reward){ //validate, re-add, and return reward amount
        uint penalty = clean(self);
        uint80 index = find(self,ID);
        if(validate(self.objectives[index], validationData)){
            reward += self.objectives[index].reward;
            remove(self, index);
        } 
                //TODO: Implement self-adding objectives
        
    }

    
    function append(objectiveList storage self, objective storage newobjective) {
        var index = uint80(self.objectives.push(newobjective));
        if (self.last == None)
        {
            if (self.first != None || self.count != 0) throw;
            self.first = self.last = index;
            self.count = 1;
        }
        else
        {
            self.objectives[self.last - 1].next = index;
            self.last = index;
            self.count ++;
        }
    }
    
    function add(objectiveList storage self, objective storage newobjective){
        uint80 index; 
        for(uint80 j; j < self.objectives.length; j++){ //Insert objective into array
            if(self.objectives[j].objectiveID == 0){
                self.objectives[j] = newobjective;
                index = j;
            }
            else if(i==self.objectives.length-1){
                self.objectives.push(newobjective);
            }
        }
        uint80 i = self.last;
        while(self.objectives[i].startTime+self.objectives[i].duration > newobjective.startTime + newobjective.duration){
            i=self.objectives[i].prev;
        }
        self.objectives[self.objectives[i].next].prev = index;
        self.objectives[i].next = index;
        self.count++;
        
    }
    
    /// Removes the element identified by the iterator
    /// `_index` from the list `self`.
    function remove(objectiveList storage self, uint80 _index) {
        objective item = self.objectives[_index - 1];
        if (item.prev == None)
            self.first = item.next;
        if (item.next == None)
            self.last = item.prev;
        if (item.prev != None)
            self.objectives[item.prev - 1].next = item.next;
        if (item.next != None)
            self.objectives[item.next - 1].prev = item.prev;
        delete self.objectives[_index - 1];
        self.count--;
    }
    /// @return an iterator pointing to the first element whose ID
    /// is `ID` or an invalid iterator otherwise.
    function find(objectiveList storage self, uint ID) returns (uint80) {
        var it = iterate_start(self);
        while (iterate_valid(self, it)) {
            if (iterate_getID(self, it) == ID)
                return it;
            it = iterate_next(self, it);
        }
        return it;
    }
    
    function clean(objectiveList storage self) returns (uint){ //cleans list and tallies penalties
        uint betterlucknexttime;
        uint80 i = self.first;
        while (self.objectives[i].startTime+self.objectives[i].duration< block.timestamp){
            betterlucknexttime+=self.objectives[i].betterlucknexttime;
            remove(self, i);
        }
        return betterlucknexttime;
    }
    
    function iterate_start(objectiveList storage self) returns (uint80) { return self.first; }
    function iterate_valid(objectiveList storage self, uint80 _index) returns (bool) { return _index - 1 < self.objectives.length; }
    function iterate_prev(objectiveList storage self, uint80 _index) returns (uint80) { return self.objectives[_index - 1].prev; }
    function iterate_next(objectiveList storage self, uint80 _index) returns (uint80) { return self.objectives[_index - 1].next; }
    function iterate_getID(objectiveList storage self, uint80 _index) returns (uint) { return self.objectives[_index - 1].objectiveID; }
    
    
}
