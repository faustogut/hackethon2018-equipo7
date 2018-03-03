pragma solidity ^0.4.17;

contract Professional {
  struct Title {
    string id;
    address institution;
    bool validated;
  }

  address owner;
  string id;
  Title[] public titles;

  function Professional() public {
    owner = msg.sender;
  }

  modifier onlyOwner {
    if (owner != msg.sender) {
      revert();
    } else {
      _;
    }
  }

  function getTitles() public constant returns (Title[]) {
    return titles;
  }

  function addTitle(string _id, address _institution) public onlyOwner returns (Title[]) {
    Title memory newTitle = Title({
      id: _id,
      institution: _institution,
      validated: false
    });
    titles.push(newTitle);
    return titles;
  } 

  function validate(string _id) public returns (bool) {
    for (uint i = 0; i < titles.length; ++i) {
      if (keccak256(titles[i].id) == keccak256(_id) && titles[i].institution == msg.sender) {
        titles[i].validated = true;
      }
    }

    return false;
  }

}