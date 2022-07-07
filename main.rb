# frozen_string_literal: true

class Weatherman
  require_relative 'file_read'
  require_relative 'horizontal_charts'
  require_relative 'calculate_tempratures'
  require_relative 'display'
  require 'date'
  include DisplayHorizontalCharts
  include CalculateTempratureModule
  include DisplayInfo
  include FileRead

  def initialize(*file_read_arguments)
    arguments_for_file_open = file_read_arguments.flatten

    @read_option = arguments_for_file_open[0]
    @time = arguments_for_file_open[1]
    @file_path = arguments_for_file_open[2]
  end
end

if ARGV.length < 3 || ARGV.length > 3
  puts 'Please Pass correct number of arguments '
  exit
elsif ARGV.length == 3
  file_read_arguments = [ARGV[0], ARGV[1], ARGV[2]]

  case ARGV[0]
  when '-e'
    Weatherman.new(file_read_arguments).read_by_years
  when '-a'
    Weatherman.new(file_read_arguments).read_by_month
  when '-c'
    Weatherman.new(file_read_arguments).read_by_month
  else
    puts 'Invalid Command Please pass correct flag'
  end
end
