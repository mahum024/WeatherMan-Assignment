# frozen_string_literal: true

require 'colorize'

module DisplayHorizontalCharts

  def print_highest_and_lowest(arg)
    puts("#{arg[3]}  #{arg[4]}")

    30.times do |values|
      print "#{values}  #{('+' * arg[1][values].to_i).to_s.red}#{arg[1][values]}C\n"
      print "#{values}  #{('+' * arg[2][values].to_i).to_s.blue}#{arg[2][values]}C\n"
    end
  end

  def highest_lowest_combine(arg)
    puts 'BONUS TASK '
    puts("#{arg[3]}  #{arg[4]}")

    2.times do |values|
      print "#{values}  #{('+' * arg[2][values].to_i).to_s.blue}#{('+' * arg[1][values].to_i).to_s.red}"
      print "#{arg[2][values]}C-#{arg[1][values]}C\n"
    end
  end
end
