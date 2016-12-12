# a guess
# b random_number
# c previous_guesses

def higher?(a,b)
  a>b
end

def lower?(a,b)
  a<b
end

def same?(a,c)
  c.include? a
end

def illogical?(a,b,c)
  (a>b && a>c.max) or (a<b && a<c.min)
end

guess = 0
guess_count = 0
previous_guesses = []

random_number = (Time.now.to_f * 100000).to_i % 100
puts random_number
puts 'please guess a random number...'
guess = gets.chomp.to_i

while guess != random_number and guess_count < 4 do
  if higher?(guess,random_number)
    if guess_count < 4
      puts 'Lower'
      guess_count+=1
      puts 'please guess again...'
      previous_guesses << guess
      guess = gets.chomp.to_i
      while same?(guess,previous_guesses) do
        puts 'you already guessed that, broseph. Try again...'
        guess = gets.chomp.to_i
      end
      if illogical?(guess,random_number,previous_guesses)
        puts 'that guess is illogical. I just told you it was lower!'
      end
    end
  elsif lower?(guess,random_number)
    if guess_count < 4
      puts 'Higher'
      guess_count+=1
      puts 'please guess again...'
      previous_guesses << guess
      guess = gets.chomp.to_i
      while same?(guess,previous_guesses) do
        puts 'you already guessed that, broseph. Try again...'
        guess = gets.chomp.to_i
      end
      if illogical?(guess,random_number,previous_guesses)
        puts 'that guess is illogical. I just told you it was higher!'
      end
    end
  end
end

if guess_count == 4
  puts 'gameover'
end

if guess == random_number
  puts 'YOU GOT IT! YOU WIN $100,000,000.00'
end
