# Living Healthy dApp

## Members: 
* Aaron Packard
* John Millar
* Ricky Henderson

## Corporate Proposal

The new Living Healthy dApp (LHD) helps companies motivate employees to make healtheir choices. LHD accomplishes this goal by motivating employees through money. We start with allowing companies to run their own ICO to create tokens Employees can earn for completing healthy tasks including: Exercise, Calorie Count, Weight Tracker and Challenges with Wagers. The corporation provides the initial investment to LHD to mint the LivingHealthyCoins (LHC). The Solidity contracts provide the corporate address with the newly minted coins. Then employees are able to start competing for their share of the LHC. The corporation can control the exchange rate and in the end the employees can convert there LHC into real money.

runs solidity contract(s) to determine token balance per employee. Code to calculate BMI, ideal weight and calories (probably not time to complete calorie counter in 1 week), but determine calorie goal based on Gender, Age and Activity level (Sedentary, Moderate or Active). Utilize ideal weight, current weight and daily calorie goal to determine timeframe to reach ideal weight or timeframe to determine daily calorie goal. Initial supply of coins is 100,000 for all employees to earn as quickly as possible.

## Process

### Set up
* Connect dApp to Pyton code, IPFS, and Solidity contracts
* Mint Coins through Solidity Contract
* Send coins to HR address (tracking employees)
* Enroll employee addresses on dApp and Solidity contracts

### Process Flow
* dApp sends user attributes to Python
* Python calculates Ideal Weight and BMI for display on dApp

* dApp captures tracking information
* IPFS saves image for verifiction
* Python calculates weight loss goals and time to reach goals

* dApp captures challenges, wagers and completion
* Challenge recorded on blockchain
* Solidity Contract accepts wager
* Solidity Pays out winnings at the end of the challenge

Capture initial user dataFront-end captures user inputs and runs calculations utilizing Python
* Solidity runs contracts - Ricky
* distribute as employees hit goal


* contact to capture goal, activate and wager (like bids)
* contact with Events to determine winner (simple for demo)
* contact to cash out winnings

* Events
* user inputs (weight, age, gender)
* activity inputs (MET, time, user data)
* calorie inputs (break, lunch, snack, dinner)
* challenge inputs (address of challenger, address of user, wager, goal, activity)
* outputs (winner and winnings)



## Programs

### dApp

* Capture user data (height, weight, age, gender)
* Capture employee challenges and wagers
* Capture tasks completions

### IPFS

* Capture images to very the completion of tasks and challenges

### Python

* Calculate BMI, Ideal Weight and time to reach Ideal Weight based on Calorie Burn and Calories In-take 

### Solidity

* Contracts to Mint coins
* Contracts to control the transfer of coins based on tasks, challenges and wagers
* Contracts to cash out 

### AJAX

* Integration of dApp with IPFS and Python code

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

### Assumptions:
* Member Already Signed In




