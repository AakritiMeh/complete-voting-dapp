//SPDX-License-Identifier:Unlicensed

pragma solidity ^0.8.9;
import "hardhat/console.sol";

contract Create {
    uint256 public _voterId;
    uint256 public _candId;
    address public votingOrganizer;

    struct Candidate {
        uint256 CandidateId;
        string age;
        string name;
        string image;
        uint256 voteCount;
        address _address;
        string ipfs;
    }

    event CandidateCreate(
        uint256 indexed CandidateId,
        string age,
        string name,
        string image,
        uint256 voteCount,
        address _address,
        string ipfs
    );

    address[] public candidateAddress;
    mapping(address => Candidate) public candidates;

    address[] public votedVoters;
    address[] public votersAddress;
    mapping(address => Voter) public voters;

    struct Voter {
        uint256 voter_voterId;
        string voterName;
        string voterImage;
        address voterAddress;
        uint256 voterAllowed;
        bool voted;
        uint256 voterVote;
        string voterIpfs;
    }

    event voterCreated(
        uint256 voter_voterId,
        string voterName,
        string voterImage,
        address voterAddress,
        uint256 voterAllowed,
        bool voted,
        uint256 voterVote,
        string voterIpfs
    );

    constructor() {
        votingOrganizer = msg.sender;
    }

    function setCandidate(
        address _address,
        string memory _age,
        string memory _name,
        string memory _ipfs,
        string memory _image
    ) public {
        require(
            msg.sender == votingOrganizer,
            "only Organizer can set the candidate"
        );
        _candId++;
        uint256 idNumber = _candId;
        Candidate storage candidate = candidates[_address];
        candidate.age = _age;
        candidate.name = _name;
        candidate.CandidateId = idNumber;
        candidate.ipfs = _ipfs;
        candidate.voteCount = 0;
        candidateAddress.push(_address);
        emit CandidateCreate(
            idNumber,
            _age,
            _name,
            _image,
            candidate.voteCount,
            _address,
            _ipfs
        );
    }

    function getCandidate() public view returns (address[] memory) {}

    function getCandidateLength() public view returns (uint256) {}

    function getCandidateData(
        address _address
    )
        public
        view
        returns (
            string memory,
            string memory,
            uint256,
            string memory,
            uint256,
            string memory,
            address
        )
    {
        return (
            candidates[_address].age,
            candidates[_address].name,
            candidates[_address].CandidateId,
            candidates[_address].image,
            candidates[_address].voteCount,
            candidates[_address].ipfs,
            candidates[_address]._address
        );
    }

    function voterRight(
        address _address,
        string memory _name,
        string memory _image,
        string memory _ipfs
    ) public {
        require(
            msg.sender == votingOrganizer,
            "only voting organizer can create a voter"
        );
        _voterId++;
        Voter storage voter = voters[_address];
        require(voter.voterAllowed == 0, "Already registered");
        voter.voterAllowed = 1;
        voter.voterName = _name;
        voter.voterImage = _image;
        voter.voterIpfs = _ipfs;
        voter.voter_voterId = _voterId;
        voter.voterAddress = _address;
        voter.voterVote = 1000;
        voter.voted = false;

        votersAddress.push(_address);
        emit voterCreated(
            _voterId,
            _name,
            _image,
            _address,
            voter.voterAllowed,
            false,
            voter.voterVote,
            voter.voterIpfs
        );
    }

    function vote(
        address _candidateAddress,
        uint256 _candidateVoteId
    ) external {
        Voter storage voter = voters[msg.sender];
        require(!voter.voted, "already voted");
        require(voter.voterAllowed != 0, "not have right to vote");
        voter.voted = true;
        voter.voterVote = _candidateVoteId;
        votedVoters.push(msg.sender);
        candidates[_candidateAddress].voteCount++;
    }

    function getVoterLength() public view returns (uint256) {
        return votersAddress.length;
    }

    function getVoterData(
        address _address
    )
        public
        view
        returns (
            uint256,
            string memory,
            string memory,
            address,
            string memory,
            string memory,
            bool
        )
    {
        return (
            voters[_address].voter_voterId,
            voters[_address].voterName,
            voters[_address].voterImage,
            voters[_address].voterAddress,
            voters[_address].voterIpfs,
            voters[_address].voterImage,
            voters[_address].voted
        );
    }

    function getVotedVotersList() public view returns (address[] memory) {
        return votedVoters;
    }

    function getVoterList() public view returns (address[] memory) {
        return votersAddress;
    }
}
