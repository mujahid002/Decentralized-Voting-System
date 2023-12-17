// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract DeVote{

    struct pollStruct{
        uint _startsAt;
        uint _endsAt;
        uint _totalVotes;

    }
    struct Canditate{
        address _paryAddress;
        string _partyName;
        string _partyLogo;
        uint _votes;
    }

    struct Voter{
        address _userAddress;
        bool _verifyAddress;
        bool _voteAccess;
    }

}