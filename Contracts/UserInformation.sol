pragma solidity ^0.5.0;

contract UserInformation{
	string name;
	uint age;
    string phone;
    string adress;
    string birthdate;
    string gender;
    string race;
    string employeeStatus;
    string email;

	
	constructor() public {
	name = "Sample Name";
        age = 0;
        phone = "Not defined";
        adress = "Not defined";
        birthdate = "Not defined";
        gender = "Not defined";
        race = "Not defined";
        employeeStatus = "Not defined";
        email = "Not defined";
        
	} 
	function setName(string memory newName) public {
		name = newName;
	}
	
	function getName() public view returns (string memory) {
		return name; 
		
	}
	
	function setAge (uint newAge) public{
		age = newAge;
	}
	
	function getAge() public view returns (uint) {
		return age;
	}
	function setPhone(string memory newPhone) public {
		phone = newPhone;
	}
	
	function getPhone() public view returns (string memory) {
		return phone;
	}

    function setAdress(string memory newAdress) public {
		adress = newAdress;
	}
	
	function getAdress() public view returns (string memory) {
		return adress;
	}

    function setBirthdate(string memory newDate) public {
		birthdate = newDate;
	}
	
	function getBirthdate() public view returns (string memory) {
		return birthdate;
	}

  function setGender(string memory newGender) public {
    gender = newGender;
	}
	
	function getGender() public view returns (string memory) {
		return gender;
	}

  function setRace(string memory newRace) public {
   race = newRace;
	}
	
	function getRace() public view returns (string memory) {
	  return race;
	}


  function setEmployeeStatus(string memory newEmployeeStatus) public {
	  employeeStatus = newEmployeeStatus;
	}
	
	function getEmployeeStatus() public view returns (string memory) {
		return employeeStatus;
	}

    function setEmail(string memory newEmail) public {
		email = newEmail;
	}
	
	function getEmail() public view returns (string memory) {
		return email;
	}
}
