module Primer
  class Message

    def initialize

    end

    def welcome
      puts "\n\n"
      puts "============================================"
      puts "==========> Welcome to PRIMER! <============"
      puts "\n\n"
    end

    def start_prompt
      puts "\n"
      print "What PRIME would you like to find?... "
    end

    def searching(desired_prime)
      puts "\n.... finding prime # #{desired_prime} .... \n"
    end

    def continue
      puts "\nEnter another value or type EXIT to quit!\n\n"
      print " - Desired prime: "
    end

    def solution(desired_prime, solution)
      puts "\n\n"
      puts "==========================================="
      puts "                SOLUTION                   "
      puts "You wanted to find prime number: #{desired_prime}"
      puts "That prime is: #{ solution } !!"
      puts "==========================================="
    end

    def exit
      puts "\n\n"
      puts "===============> Thanks ! <================="
      puts "============================================"
      puts "\n\n"
    end
  end
end