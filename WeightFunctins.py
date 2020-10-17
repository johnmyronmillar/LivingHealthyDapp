# To add a new cell, type '# %%'
# To add a new markdown cell, type '# %% [markdown]'
# %%
# imports?


# %%
# fixed:
CALORIES_PER_POUND = 3500

# inputs from user interface:
units = ''

current_weight = 0
target_weight = 0
height = 0
age = 0
gender = 'M'

time = 0 # in minutes
met = 0

breakfast = 0
lunch = 0
snack = 0
dinner = 0

formula = 'hamwi'

frequency = ''

challenge_name = ''
goal = 0
wager = 0
counter = 0 # do we need a counter to increment number of challenges?


# %%
# outputs:
bmi = 0
calories_burned = 0 # calorie burn by activity
calorie_intake = 0
base_calorie_burn = 0
pounds = 0
inches = 0
ideal_weight = 0
total_cals = 0
winner = ''


# %%
# BMI funciton in metric system
def BMI(units, current_weight, height):
    if units == "metric":
        bmi = current_weight/((height/100)*(height/100))
    
    else:
        kg = current_weight / 2.205 # pounds to kg
        cm = height * 2.54 # inches to cm
        bmi=kg/((cm/100)*(cm/100))
    
    bmi = round(bmi,2)
    return bmi


# %%
def calories_burned(units, time, met, current_weight):
    if units == "metric":
        calories_burned = round((time * met * 3.5 * current_weight / 200), 2)
        
    else:
        kg = current_weight / 2.205 # pounds to kg
        calories_burned = round((time * met * 3.5 * kg / 200), 2)

    return calories_burned


# %%
def pounds(kg):
    if units == 'metric':
        pounds = kg # no conversion
    else:
        pounds = kg * 2.205
    return pounds


# %%
def inch(units, cm):
    if units == 'metric':
        inches = cm / 2.54
    else:
        inches = cm
    return inches


# %%
def ideal_weight_formula(formula, units, gender, height):
    if formula == 'hamwi':
        x = 48
        y = 45.5
        a = 2.7
        b = 2.2
    elif formula == 'devine':
        x = 50
        y = 45.5
        a = 2.3
        b = 2.3
    elif formula == 'robinson':
        x = 52
        y = 49
        a = 1.9
        b = 1.7
    elif formula == 'miller':
        x = 56.2
        y = 53.1
        a = 1.41
        b = 1.36
    else:
        x = 48
        y = 45.5
        a = 2.7
        b = 2.2
        
    if gender == 'M':
        ideal = x + ((inch(units, height) - 60) * a)
    elif gender == 'F':
        ideal = y + ((inch(units, height) - 60) * b)
    else:
        print('error with ideal_weight_formula')
    
    ideal = pounds(ideal)
    
    ideal_weight = round(ideal,2)
    
    return ideal_weight


# %%
def daily_calories(breakfast, lunch, snack, dinner):
    calorie_intake = breakfast + lunch + snack + dinner
    
    return calorie_intake 


# %%
def calorie_burn(gender, age):
    if gender == "F":
        if age <= 8:
            base_calorie_burn = 1200
        elif age <= 13:
            base_calorie_burn = 1600
        elif age <= 18:
            base_calorie_burn = 1800
        elif age <= 30:
            base_calorie_burn = 2000
        elif age <= 50:
            base_calorie_burn = 1800
        elif age >= 51:
            base_calorie_burn = 1600
    else:
        if age <= 8:
            base_calorie_burn = 1400
        elif age <= 13:
            base_calorie_burn = 1800
        elif age <= 18:
            base_calorie_burn = 2200
        elif age <= 30:
            base_calorie_burn = 2400
        elif age <= 50:
            base_calorie_burn = 2200
        elif age >= 51:
            base_calorie_burn = 2000
            
    return base_calorie_burn


# %%
def weight_goal(current_weight, target_weight):
    weight_loss_goal = round(int(current_weight - target_weight), 2)
    
    return weight_loss_goal


# %%
def calorie_diff(base_calorie_burn, calories_burned, calorie_intake):
    calorie_difference = round((base_calorie_burn + calories_burned - calorie_intake), 2)

    return calorie_difference


# %%
def time_required(frequency, current_weight, target_weight, CALORIES_PER_POUND, gender, age, units, time, met, breakfast, lunch, snack, dinner):
    days_required = round((weight_goal(current_weight, target_weight) * CALORIES_PER_POUND / calorie_diff(calorie_burn(gender, age), calories_burned(units, time, met, current_weight), daily_calories(breakfast, lunch, snack, dinner))), 2)
    months_required = round((days_required / 30), 2)
    
    if frequency == 'days':
        return days_required
    elif frequency == 'months':
        return months_required
    else:
        return months_required


# %%
daily_calories(350, 450, 200, 650)


# %%
calorie_burn('F', 18)


# %%
time_required("months", 215, 169, CALORIES_PER_POUND, "M", 41, '', 45, 6, 350, 450, 200, 650)


# %%
calories_burned("", 45, 6, 215)


# %%
BMI("", 215, 71.5)


# %%
ideal_weight_formula('hamwi', '', 'M', 71.5)


# %%
def challenge_set(counter, challenge_name, goal, wager): # this will probably be in solidity
    counter += 1
    challenge = {'Counter': counter, 'Challenge_name': challenge_name, 'Goal': goal, 'Wager': wager}
    
    return challenge


# %%
def challenge_winner(member1_results, member2_results): # this will probably be in Solidity

    if member1_results == member2_results:
        winner = "draw"
    elif member1_results >= member2_results:
        winner = "Member 1 wins"
    else:
        winner = "Member 2 wins"
    
    return winner


