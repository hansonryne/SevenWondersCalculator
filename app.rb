#An app to calculate the score of a Seven Wonders game.
#This does not work for the expansions.  I will add that to a later version.



=begin
Future Ideas:
Organize the table by total score
Identify the winner's strongest section
Save game data to a database
Input validation
Load into a Rails web application
Make game a little less verbose (most feedback was for debugging/development purposes)
=end

require_relative 'playerclass'
require 'terminal-table'

puts 'Welcome to the 7 Wonders score calculator'
sleep 1

#This section starts the calculator by asking how many players there were in the game
is_right = false
until is_right
  puts 'How many players were there in the game?'
  $num_players = gets.chomp.to_i
  puts "You had #{$num_players} players."
  sleep 1
  puts 'Is that right?'
  sleep 1
  puts '1. Yes'
  puts '2. No'
  answer = gets.chomp.to_i
  if answer == 1
    print "Starting calculator with #{$num_players} players."
    3.times do
      print '.'
      sleep 1
    end
    print "\n"
    is_right = true
  else
    print 'Starting over'
    3.times do
      print '.'
      sleep 1
    end
    print "\n"
  end
end

player_array = []

#Set player names
for i in 1..$num_players
  puts "What is player #{i}'s name?"
  player_array[i-1] = Player.new("#{gets.chomp}")
  puts "You entered #{player_array[i-1].name}"
  print "\n\n"
end

#Set military scores
for i in 1..$num_players
  puts "What is #{player_array[i-1].name}'s military score?"
  player_array[i-1].redScore = gets.chomp.to_i
  puts "You entered #{player_array[i-1].redScore}"
  print "\n\n"
end

#Set coin scores
for i in 1..$num_players
  puts "How many points for coins did #{player_array[i-1].name} get?"
  player_array[i-1].coinScore = gets.chomp.to_i
  puts "You entered #{player_array[i-1].coinScore}"
  print "\n\n"
end

#Set wonder scores
for i in 1..$num_players
  puts "What is #{player_array[i-1].name}'s wonder score?"
  player_array[i-1].wonderScore = gets.chomp.to_i
  puts "You entered #{player_array[i-1].wonderScore}"
  print "\n\n"
end

#Set blue card score
for i in 1..$num_players
  puts "How many blue card points did #{player_array[i-1].name} get?"
  player_array[i-1].blueScore = gets.chomp.to_i
  puts "You entered #{player_array[i-1].blueScore}"
  print "\n\n"
end

#Set yellow card score
for i in 1..$num_players
  puts "How many yellow card points did #{player_array[i-1].name} get?"
  player_array[i-1].yellowScore = gets.chomp.to_i
  puts "You entered #{player_array[i-1].yellowScore}"
  print "\n\n"
end

#Set purple card score
for i in 1..$num_players
  puts "How many purple card points did #{player_array[i-1].name} get?"
  player_array[i-1].purpleScore = gets.chomp.to_i
  puts "You entered #{player_array[i-1].purpleScore}"
  print "\n\n"
end

#Science is a little more complicated
for i in 1..$num_players
  puts "How many cogs did #{player_array[i-1].name} have?"
  player_array[i-1].cogs = gets.chomp.to_i
  puts "You entered #{player_array[i-1].cogs}"
  print "\n\n"

  puts "How many compasses did #{player_array[i-1].name} have?"
  player_array[i-1].compass = gets.chomp.to_i
  puts "You entered #{player_array[i-1].compass}"
  print "\n\n"

  puts "How many tablets did #{player_array[i-1].name} have?"
  player_array[i-1].tablets = gets.chomp.to_i
  puts "You entered #{player_array[i-1].tablets}"
  print "\n\n"

#Individual score for the gear cards (I don't know why I called them cogs but it was too far gone by the time I noticed)
  player_array[i-1].scoreCogs
#Individual score for the compass cards
  player_array[i-1].scoreCompass
#Individual score for the tablet cards
  player_array[i-1].scoreTablet
#Individual score for sets of science cards
  player_array[i-1].scoreSets

#Totals all the science and prints the result
  puts "#{player_array[i-1].name}'s science score is #{player_array[i-1].scoreScience}"
  print "\n\n"
end

#Calculate total score
player_array.each do |x|
  puts "#{x.name} scored #{x.sayTotalScore} points."
  print "\n\n"
end

#Tabulate results
table_rows = []
player_array.each do |x|
  table_rows << [x.name, x.redScore, x.coinScore, x.wonderScore, x.blueScore, x.yellowScore, x.purpleScore, x.scienceScore, x.totalScore]
end

table = Terminal::Table.new
table.title = 'Final Scores'
table.headings = %w(Player Military Coin Wonder Blue Yellow Purple Science Total)
table.rows = table_rows
table.style = {:all_separators => true}


puts table
