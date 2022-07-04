# frozen_string_literal: true

require 'colorize'

module DisplayHorizontalCharts
  def print_highest_and_lowest(arg)
    date = arg[0]
    highest = arg[1]
    lowest = arg[2]
    month = arg[3]
    year = arg[4]

    day = []
    date.each do |d|
      day << d.split('-')
    end
    puts("#{month}  #{year}")
    date.length.times do |values|
      print "#{day[values][2]}  #{('+' * highest[values].to_i).to_s.red}#{highest[values]}C\n"
      print "#{day[values][2]}  #{('+' * lowest[values].to_i).to_s.blue}#{lowest[values]}C\n"
    end
  end

  def highest_lowest_combine(arg)
    date = arg[0]
    highest = arg[1]
    lowest = arg[2]
    month = arg[3]
    year = arg[4]

    day = []
    date.each do |d|
      day << d.split('-')
    end

    # Bonus task
    puts 'BONUS TASK '
    puts("#{month}  #{year}")
    2.times do |values|
      print "#{day[values][2]}  #{('+' * lowest[values].to_i).to_s.blue}#{('+' * highest[values].to_i).to_s.red}"
      print "#{lowest[values]}C-#{highest[values]}C\n"
    end
  end
end
