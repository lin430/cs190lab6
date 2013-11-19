def main
  # check the number of commandline arguments
  if(ARGV.length < 1)
    puts "Usage: ruby text_mutator.rb [--reverse --upper --lower --upsidedown] <input text>"
    exit
  end
  
  # store modifier text into modification variable
  modification = ARGV[0]

  # store input text into text variable
  text = ARGV[1]

  # modify text accordingly
  # methods supported
  methods = %w(reverse upper lower upsidedown)
  methods = methods.map { |meth| meth = "--#{meth}" }
  if methods.include? modification
    mod_text = send(modification.gsub("--","") + "_mod", text)
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
  return input.tr(
    letters = 'ahbmfnjpdrutwqye',
    letters.reverse).reverse
end

# Call main method
main()
