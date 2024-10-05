# Subscription Payment Contract

The Subscription Payment Contract automates recurring payments for subscription-based services. Users can subscribe to a service by paying a recurring fee, and the contract automatically manages and tracks whether a user’s subscription is active based on the last payment date.

## Features

- **Subscription Management:** Allows users to subscribe to a service by paying a recurring fee.
- **Active Subscription Tracking:** Tracks whether a user’s subscription is active or expired based on the last payment date.
- **Auto-Renewal:** Users can renew their subscriptions by sending the required fee again, extending their subscription period.
- **Withdrawal:** The contract owner can withdraw the collected subscription fees at any time.

## How It Works

### 1. Deploy the Contract
The owner of the service deploys the contract and sets key parameters such as:
- **Subscription Fee:** The amount users must pay to subscribe.
- **Subscription Period:** The duration of the subscription (e.g., monthly, weekly).

### 2. Subscribe to the Service
Users can subscribe by sending the required subscription fee using the `subscribe()` function. The contract will record the user’s subscription and the start date.

### 3. Renew Subscription
When a user’s subscription is about to expire, they can extend it by sending the subscription fee again. The contract will update the expiration date accordingly.

### 4. Withdraw Funds
The owner of the contract can withdraw the accumulated subscription fees by calling the `withdraw()` function. This transfers the collected funds to the owner's address.

