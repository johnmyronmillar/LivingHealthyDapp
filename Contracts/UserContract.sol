pragma solidity 0.5.0;


contract MyHealthyLifeContract{
	string public name;
  string public gender;
	uint public age;
  uint public height;
  uint public weight;
	string value;
	
	constructor() public {
		value = "myValue";
	}
	
	function setName(string memory newName) public {
		name = newName;
	}
	
	function getName() public view returns (string memory) {
		return name;
	}
  
	function setGender(string memory newGender) public {
		name = newGender;
	}
	
	function getGender() public view returns (string memory) {
		return gender;
	}
	function setAge (uint newAge) public{
		age = newAge;
	}
	
	function getAge() public view returns (uint) {
		return age;
	}
  function setHeight (uint newAge) public{
		age = newHeight;
	}
	
	function getHeight() public view returns (uint) {
		return height;
	}
  
		function setWeight (uint newAge) public{
		age = newWeight;
	}
	
	function getWeight() public view returns (uint) {
		return weight;
	}
	function get() public view returns(string memory) {
		return value;
	}
	
	function set(string memory _value) public {
		value = _value;
	}
}
