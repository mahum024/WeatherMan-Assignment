# frozen_string_literal: true

class Weatherman
  require_relative 'file_read'
  require_relative 'horizontal_charts'
  require_relative 'calculate_tempratures'
  require_relative 'display'

  include DisplayHorizontalCharts
  include CalculateTempratureModule
  include DisplayInfo
  include FileRead
  require 'date'

  def initialize(*args)
    a = args.flatten

    @read_option = a[0]
    @time = a[1]
    @file_path = a[2]
  end
end

if ARGV.length < 3
  puts 'Please Pass correct number of arguments '
  exit
else
  file_read_arguments = [ARGV[0], ARGV[1], ARGV[2]]

  case ARGV[0]

  when '-e'

    Weatherman.new(file_read_arguments).read_by_years
  when '-a'
    Weatherman.new(file_read_arguments).read_by_year_and_month_a
  when '-c'
    Weatherman.new(file_read_arguments).read_by_year_and_month_c
  else
    puts 'Invalid Command Please pass correct flag'
  end
end
