def main
  # check the number of commandline arguments
  if(ARGV.length < 2)
    puts "Usage: ruby text_mutator.rb [--reverse --upper --lower --upsidedown] <input text>"
    exit
  end
  
  # store modifier text into modification variable
  modification = ARGV[0]

  # store input text into text variable
  text = ARGV[1]

  case modification
  when "--reverse"
    mod_text = reverse_mod(text)
  when "--upper"
    mod_text = upper_mod(text)
  when "--lower"
    mod_text = lower_mod(text)
  when "--upsidedown"
    mod_text = upsidedown_mod(text)
    puts 4
  else
    puts "ERROR: Unrecognized modifier!"
    exit
  end

  # output modified text
  puts mod_text
end

############ Modification methods ##############

def reverse_mod(input)
  return input.reverse
end

def upper_mod(input)
  return input.upcase
end

def lower_mod(input)
  return input.lower
end

def upsidedown_mod(input)
  #TODO
end

# Call main method
main()
