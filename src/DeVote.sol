// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/access/Ownable.sol";

abstract contract DeVote is Ownable {
    address private _owner;

    struct PollStruct {
        uint256 StartsAt;
        uint256 EndsAt;
        uint256 TotalVotesReceived;
        uint256 TotalVoters;
        uint256 TotalParties;
    }

    struct Candidate {
        uint PartyId;
        string PartyName;
        bytes32 PartyLogo;
        uint256 PartyVotes;
    }

    struct Voter {
        address VoterAddress;
        bool VerifyVoterAccess;
        bool IsVoted;
    }

    PollStruct public _pollStruct;
    Candidate[] public _candidates;
    Voter[] public _voters;

    constructor(uint256 _pollStart, uint256 _pollEnd) {
        _owner = _msgSender();
        _pollStruct.StartsAt = _pollStart;
        _pollStruct.EndsAt = _pollEnd;
    }

    function _CandidateCreation(
        uint _partyId,
        string memory _partyName,
        bytes32 _partyLogo
    ) external onlyOwner {
        Candidate memory newCandidate;
        newCandidate.PartyId = _partyId;
        newCandidate.PartyName = _partyName;
        newCandidate.PartyLogo = _partyLogo;
        newCandidate.PartyVotes = 0;

        _candidates.push(newCandidate);
        _pollStruct.TotalParties++;
    }

    function _voterRegister(
        address _voterAddress,
        bool _verifyVoterAccess,
        bool _isVoted
    ) external {
        Voter memory newVoter;
        newVoter.VoterAddress = _voterAddress;
        newVoter.VerifyVoterAccess = _verifyVoterAccess;
        newVoter.IsVoted = _isVoted;

        _voters.push(newVoter);
        _pollStruct.TotalVoters++;
    }

    function _doVote(address _voterAddress, bool _verifyVoterAccess, bool _isVoted) external {
        
    }
}
