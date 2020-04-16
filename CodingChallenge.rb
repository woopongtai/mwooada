# outline:

# create 3 cycle loop (one for each party).
# Loop should contain user inputs for tickets, orders of cotton candy, orders of curly fries (large, small). 
# ticket intake needs to take into account discount for 4 tickets (remainder tool?).
# post loop: create two arrays and one hash
# array 1: total cash earned by fair
# array 2: total amount spent on concessions
# hash: party number and amount spent

# note: ideally this program would not have a specific limit on the number of parties, instead running a loop (i.e. if p = 1) and creating copies (.clone) of a template hash until the user inputed that no further parties were to be added, which would close the loop (p = 0) and proceed to the summaries. This theoretically would allow parties to be added ad infinitum absent a direction to the contrary or unless a limit was placed in the code (number of tickets sold, number of parties, etc.). For the purposes of this code, I will stick to the three parties to stick to the requested prompt for simplicity (and trying to avoid going down a rabbithole on trying to create a hash cloning piece of code which I had inadvertently started). 

# 1 create hashs with applicable information for each party: cash on tickets, cash on food, total cash spent

party1 = {
  cashtic: nil,
  cashfoo: nil,
  cashtot: nil
}

party2 = {
  cashtic: nil,
  cashfoo: nil,
  cashtot: nil
}

party3 = {
  cashtic: nil,
  cashfoo: nil,
  cashtot: nil
}

# 2 introductory command prompts

puts "Welcome to the Ada State Fair Expense Tracking program."
puts ""
puts "Please provide the requested information."

# create system to be able to shift 

p = 1

while p < 4
  print "Please input the following for party ##{p}"

  p += 1
end
