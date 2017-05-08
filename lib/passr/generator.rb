module Passr
  # 2-D array of all possible characters that can be used in a password
  CHARACTERS = [['!','$','%','+','/','=','@','~'],
                ('0'..'9').to_a,
                ('a'..'z').to_a]

  # Handles account/ username creation and respective password generation
  class Generator
    # Generates password of given length
    #
    # @param [Integer] length length of characters for generated password
    # @return [String] generated password of give length
    def self.password(length = nil)
      length = 15 if length.nil? || length.to_i > 40
      generated = Array.new(length).map { random_character }.join('')
      sanitize(generated)
    end

    # Sanitize password to ensure there are all unique characters and there is at
    # least one special character, capital letter, lowercase letter, and number
    #
    # @param [String] password pre-sanitized/ initially generated password
    # @return [String] sanitized and completely unique password
    def self.sanitize(password)
      password.add_special!(CHARACTERS[0]) if password.scan(/[!@#$%^&*()]/).empty?
      password.add_number!(CHARACTERS[1]) if password.scan(/[0-9]/).empty?
      password.add_capital_letter!(CHARACTERS[2]) if password.scan(/[A-Z]/).empty?
      password.unique_chars!
      sanitize(password) unless is_sanitary?(password)
      return password
    end

    # @return [String] a random character from the constant CHARACTERS
    def self.random_character
      character_set = CHARACTERS[rand(3)]
      character_set[rand(character_set.length)]
    end

    # Get a unique character that is not in current password
    #
    # @param [String] password generated password
    # @return [String] unique character that is not present in password
    def self.new_character(password)
      CHARACTERS.each do |set|
        set.each do |char|
          return char unless password.include?(char)
          return char.upcase unless password.include?(char.upcase)
        end
      end
    end

    # Determine if password meets all security parameters
    #
    # @param [String] password generated password
    # @return [Boolean] true if password meets are required security measures
    def self.is_sanitary?(password)
      password.scan(/[!@#$%^&*()]/).count > 0 &&
      password.scan(/[0-9]/).count > 0 &&
      password.scan(/[A-Z]/).count > 0 &&
      password.scan(/[a-z]/).count > 0 &&
      is_all_unique_characters?(password)
    end


    # Determine if password has all unique characters
    #
    # @param [String] password generated password
    # @return [Boolean] true if password has all unique characters
    def self.is_all_unique_characters?(password)
      password.length.times do |i|
        password.chars.each_with_index do |char, index|
          unless i == index
            return false if password[i] == char
          end
        end
      end
      true
    end
  end
end

# Extends Ruby String Class to handle special bang methods for password generating
class String
  # Add a special character to given string
  #
  # @param [Array] special_chars list of special characters
  # @return [String] replaces self with a special character in the place another random character
  def add_special!(special_chars)
    sanitized = self
    sanitized[rand(sanitized.length)] = special_chars[rand(special_chars.length)]
    self.replace(sanitized)
  end

  # Add a number to given string
  #
  # @param [Array] numbers list of numbers, preferably single digits (0-9)
  # @return [String] replaces self with a number in the place another random character
  def add_number!(numbers)
    sanitized = self
    sanitized[rand(sanitized.length)] = numbers[rand(numbers.length)]
    self.replace(sanitized)
  end

  # Add a capital letter to given string
  #
  # @param [Array] letters list of letters, preferably entire lowercase alphabet (a-z)
  # @return [String] replaces self with an upper case letter in the place another random character
  def add_capital_letter!(letters)
    sanitized = self
    sanitized[rand(sanitized.length)] = letters[rand(letters.length)].upcase
    self.replace(sanitized)
  end

  # Make string entirely unique characters
  #
  # @return [String] replaces self with a string that is made up of all unique characters
  def unique_chars!
    sanitized = self
    sanitized.length.times do |i|
      sanitized.chars.each_with_index do |char, index|
        unless i == index
          sanitized[i] = Passr::Generator.new_character(sanitized) if sanitized[i] == char
        end
      end
    end
    self.replace(sanitized)
  end
end
