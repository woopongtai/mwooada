# Cohort 14 Coding Chellenge: Ada State Fair

# contents:

# 0 notes

# 1 create hashs for party totals

# 2 Introductory information

# 3.0 Party information input loop

# 3.1 Per party inputs

# 3.2 Confirmaiton line

# 3.3 Converting inputs into dollar amounts

# 3.4 Convert dollar amounts into totals

# 3.5 Assigning data into hash

# 3.6 Swtching loop to next party

# 4 create loop with party totals for analyzing purposes

# 5 configure floats to produce two decimals

# 6 Produce summary

# ==================================================

# 0 notes:

# note 1: ideally this program would not have a specific limit on the number of parties, instead running a loop (i.e. if p = 1) and creating copies (.clone) of a template hash until the user inputed that no further parties were to be added, which would close the loop (p = 0) and proceed to the summaries. This theoretically would allow parties to be added ad infinitum absent a direction to the contrary or unless a limit was placed in the code (number of tickets sold, number of parties, etc.). For the purposes of this code, I will stick to the three parties to stick to the requested prompt for simplicity (and trying to avoid going down a rabbithole on trying to create a hash cloning piece of code that I had inadvertently started going down and attempting something potentially way more complex than the challenge asked for and beyond my current skill set.). 

# note 2: throughout this code, you will see numerous "# puts "test [item] #{value}." These pieces were used to check calculations in progress and insure that equasions and codes worked properly and as intended. Once their information were no longer needed, they were instead saved as notes 

# 1: create hashs with applicable information for each party: cash on tickets, cash on food, total cash spent

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

# 2: introductory information

puts "Welcome to the Ada State Fair Income Tracking program. Authorized staff only."
puts ""
puts "Please provide the requested information. If you input the wrong values, proceed to the end of the party inputs to reinput the correct values."
puts " "

# 3.0 Party information input loop

p = 1

# p referrs to the party #. 

while p < 4
  
  # 3.1 Per party inputs. Program opted to calculate money totals post confirmation rather than in the process of inputing. Alternatives may be to provide total cost following input and/or to have confirmations after each query that then saves the value to the corresponding hash and key. Inputs are reduced to integers as it does not appear partial inputs are an option. 
  
  puts "Please input the following for party ##{p}"
  puts " "
  print "The number of tickets purchased:"
  ti = gets.chomp.to_i
  puts " "
  print "Number of servings of cotton candy:"
  cc = gets.chomp.to_i
  puts " "
  puts "Number of orders of Curly Fries (Small/Large):"
  print "      Small:"
  cfs = gets.chomp.to_i
  print "      Large:"
  cfl = gets.chomp.to_i
  puts " "

  # 3.2: Confirmation query

  puts "Please verify the above values are correct and that there are no typos. If you do not confirm the inputted values, you will need to reinput all values for this party."
  puts " "
  print "Are all of the values correct? (Y/N):"
  confirm = gets.chomp.upcase
  puts " "
  if confirm == "Y" || confirm == "YE" || confirm == "YES" || confirm == "YES."
    
    # 3.3: Convert inputs into float (.to_f) (i.e. $ amounts)  at the rates proscribed

    ticash = (((( ti.to_f - ( ti.to_f % 4 ) ) / 4) * 112.00) + (35.00 * ( ti.to_f % 4 ))) 
    cccash = ( cc.to_f * 1.25 )
    cfscash = ( cfs.to_f * 2.50 )
    cflcash = ( cfl.to_f * 4.00 )
  
    # puts " "
    # puts "test ticket cash: $#{ticash}"
    # puts "test cotton candy cash: $#{cccash}"
    # puts "test curly fries small cash: $#{cfscash}"
    # puts "test curly fries large cash: $#{cflcash}"
  

    # 3.4: convert dollar amounts into combined totals 

    foocash = cccash + cfscash + cflcash
    totcash = ticash + foocash

    # puts "test food cash $#{foocash}"
    # puts "test total cash $#{totcash}"
    
    # 3.5: Assigning data into correct hash

    if p == 1
      party1[:cashtic] = ticash
      party1[:cashfoo] = foocash
      party1[:cashtot] = totcash
    elsif p == 2
      party2[:cashtic] = ticash
      party2[:cashfoo] = foocash
      party2[:cashtot] = totcash
    elsif p == 3
      party3[:cashtic] = ticash
      party3[:cashfoo] = foocash
      party3[:cashtot] = totcash
    end
   
   
    puts "Data saved for party #{p}."
    puts " "

    # 3.6: switch to next party

    p += 1
    puts " "
  elsif confirm == "N" || confirm == "NO" || confirm == "NO."
    puts "Data not saved. Please reinput values for this party."
    puts " "
  else
    puts "Input not recognized. You did not confirm your inputs. Data not saved. Please reinput values for this party."
    puts " "
  end
  
end

# print "Test hash Party 1: #{party1}"
# puts " "
# print "Test hash Party 2: #{party2}"
# puts " "
# print "Test hash Party 3: #{party3}"

# 4: create simple array to determine which party spent the most.

partytotals = [party1[:cashtot], party2[:cashtot], party3[:cashtot]]

# puts " " 
# print partytotals

# 5: configure floats to produce a specific number of decimal places and create string (found and copied via google search: "https://www.ruby-forum.com/t/always-show-2-decimal-places/96642/4")

class Float
  def to_s(digits)
    sprintf("%.#{digits}f", self)
  end
end

# 6: produce summary
puts " "
puts "Summary:"
puts " "
puts "Party 1 spent a total of $#{party1[:cashtic].to_s(2)} on tickets and $#{party1[:cashfoo].to_s(2)} on food for a total of $#{party1[:cashtot].to_s(2)}."
puts "Party 2 spent a total of $#{party2[:cashtic].to_s(2)} on tickets and $#{party2[:cashfoo].to_s(2)} on food for a total of $#{party2[:cashtot].to_s(2)}."
puts "Party 3 spent a total of $#{party3[:cashtic].to_s(2)} on tickets and $#{party3[:cashfoo].to_s(2)} on food for a total of $#{party3[:cashtot].to_s(2)}."
puts " "
puts "In this session, the Ada State Fair earned $#{(party1[:cashtot] + party2[:cashtot] + party3[:cashtot]).to_s(2)}."
puts "The total spent on concessions was $#{(party1[:cashfoo] + party2[:cashfoo] + party3[:cashfoo]).to_s(2)}."
puts "Party #{(partytotals.rindex(partytotals.max) + 1)} spent the most money for a total of $#{partytotals.max.to_s(2)}."
