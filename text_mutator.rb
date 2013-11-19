def main
  # check the number of commandline arguments
  if(ARGV.length < 1)
    puts "Usage: ruby text_mutator.rb [--reverse --upper --lower] <input text>"
    exit
  end
  
  # store modifier text into modification variable
  modification = ARGV[0]

  # store input text into text variable
  text = ARGV[1]

  # modify text accordingly
  case modification
  when "--reverse"
    mod_text = reverse_mod text
  when "--upper"
    mod_text = upper_mod text
  when "--lower"
    mod_text = lower_mod text
  else
    puts "ERROR: Unrecognized modifier!"
    exit
  end

  # output modified text
  puts mod_text
end

############ Modification methods ##############

def reverse_mod input 
  input.reverse
end

def upper_mod input
  input.upcase
end

def lower_mod input
  input.downcase
end

# Call main method
main
