// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The SubscriptionPayment contract allows users to subscribe to a service with a recurring payment.
contract SubscriptionPayment {
    // State variable to store the address of the contract owner
    address public owner;

    // The fee that users need to pay to subscribe
    uint public subscriptionFee;

    // The period of time for which a subscription is valid (in seconds)
    uint public subscriptionPeriod;

    // Mapping to store the timestamp when each user's subscription expires
    mapping(address => uint) public nextPaymentDue;

    // Modifier that restricts access to only the owner of the contract
    modifier onlyOwner() {
        // Ensure that only the owner can call the function
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Constructor that sets the subscription fee, period, and assigns the contract deployer as the owner
    constructor(uint _fee, uint _period) {
        owner = msg.sender;  // Set the contract deployer as the owner
        subscriptionFee = _fee;  // Set the subscription fee
        subscriptionPeriod = _period;  // Set the subscription period
    }

    // Function that allows users to subscribe by sending the exact subscription fee
    function subscribe() public payable {
        // Ensure the correct subscription fee is sent
        require(msg.value == subscriptionFee, "Incorrect subscription fee");

        // If the user is subscribing for the first time, set the subscription expiration to the current time + subscription period
        if (nextPaymentDue[msg.sender] == 0) {
            nextPaymentDue[msg.sender] = block.timestamp + subscriptionPeriod;
        } else {
            // If the user is already subscribed, extend the subscription period by adding more time
            nextPaymentDue[msg.sender] += subscriptionPeriod;
        }
    }

    // Function to check if a user's subscription is still active
    function isActiveSubscriber(address _user) public view returns (bool) {
        // Return true if the current time is less than the user's subscription expiration
        return block.timestamp < nextPaymentDue[_user];
    }

    // Function that allows the owner to withdraw the balance (collected subscription fees) from the contract
    function withdraw() public onlyOwner {
        // Transfer the contract's balance to the owner's address
        payable(owner).transfer(address(this).balance);
    }
}
