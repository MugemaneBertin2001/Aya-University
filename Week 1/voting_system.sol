// Simple Voting System in Solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    // Structure to store candidate details
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // Array of candidates
    Candidate[] public candidates;

    // Mapping to check if a candidate exists
    mapping(string => bool) public candidateExists;

    // Mapping to store the address of each voter and the candidate they voted for
    mapping(address => string) public votes;

    // Constructor to add candidates during contract deployment
    constructor(string[] memory candidateNames) {
        for (uint256 i = 0; i < candidateNames.length; i++) {
            addCandidate(candidateNames[i]);
        }
    }

    // Function to add a new candidate
    function addCandidate(string memory name) private {
        require(!candidateExists[name], "Candidate already exists");
        candidates.push(Candidate(name, 0));
        candidateExists[name] = true;
    }

    // Function to cast a vote for a candidate
    function vote(string memory candidateName) public {
        require(candidateExists[candidateName], "Candidate does not exist");
        require(bytes(votes[msg.sender]).length == 0, "You have already voted");

        votes[msg.sender] = candidateName;

        for (uint256 i = 0; i < candidates.length; i++) {
            if (keccak256(bytes(candidates[i].name)) == keccak256(bytes(candidateName))) {
                candidates[i].voteCount++;
                break;
            }
        }
    }

    // Function to get the total votes for a candidate
    function getVotesForCandidate(string memory candidateName) public view returns (uint256) {
        require(candidateExists[candidateName], "Candidate does not exist");

        for (uint256 i = 0; i < candidates.length; i++) {
            if (keccak256(bytes(candidates[i].name)) == keccak256(bytes(candidateName))) {
                return candidates[i].voteCount;
            }
        }

        return 0;
    }

    // Function to get the total number of candidates
    function getTotalCandidates() public view returns (uint256) {
        return candidates.length;
    }
}
