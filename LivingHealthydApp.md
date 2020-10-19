# Living Healthy dApp

## Members: 
* Aaron Packard
* John Millar
* Ricky Henderson

## Corporate Proposal:
Employee Living Healthy Dapp (LHD). Start with ICO to create tokens Employees can earn for completely health tasks including: Exercise, Calorie Count, Weight Tracker and Challenges. Corporation provides the initial investment to mint the HealthLivingCoins (HLC). Employees complete activities for a healthy living each day. Dapp allows employees to enter tasks listed above, then runs solidity contract(s) to determine token balance per employee. Code to calculate BMI, ideal weight and calories (probably not time to complete calorie counter in 1 week), but determine calorie goal based on Gender, Age and Activity level (Sedentary, Moderate or Active). Utilize ideal weight, current weight and daily calorie goal to determine timeframe to reach ideal weight or timeframe to determine daily calorie goal. Initial supply of coins is 100,000 for all employees to earn as quickly as possible.

## Questions
* Can we utilize a Dapp to influence employee actions?
* Can we run a Dapp through AWS hosting our Python code and Solidity contracts managing payouts?

## dApp creation

* 

### IPFS

### Python

### Solidity

### AJAX

## Set up
* Mint Coins through Solidity Contract
* Send coins to HR address (tracking employees)
* Front-end captures user inputs and runs calculations utilizing Python
* Solidity runs contracts - Ricky
* distribute as employees hit goal

### Assumptions:
* Member Already Signed In

* contact to capture goal, activate and wager (like bids)
* contact with Events to determine winner (simple for demo)
* contact to cash out winnings
* capture inputs
* Events
* Python - John
* user inputs (weight, age, gender)
* activity inputs (MET, time, user data)
* calorie inputs (break, lunch, snack, dinner)
* challenge inputs (address of challenger, address of user, wager, goal, activity)
* outputs (winner and winnings)
* Integrate Dapp, Solidity and Python (AWS)
* Test
* Demo
* Make Money

## Use Cases
### Use Case 1
* Employee starts with entering user inputs and address for payout
### Use Case 2
* Employee enters activity inputs
* Employee enters calorie inputs
* Returns goal info (how'd you do)
* Solidity contract pays out if goal reached
### Use Case 3
* Employee starts challenge with address of challenger and activity (goal based on activity for now)
* Enters activity inputs
* Returns Total Calories for the challenge 
* Solidity contract pays out to address with highest activity reached (e.g most calories burned in a day or biggest diff between burned and consumed)



