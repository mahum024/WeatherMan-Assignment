# frozen_string_literal: true
module FileRead
  require_relative 'horizontal_charts'
  require_relative 'calculate_tempratures'
  include DisplayHorizontalCharts
  include CalculateTempratureModule
  require 'date'

  def read_by_years
    highest = []
    lowest = []
    humid = []
    date = []
    read_year_data = [highest, lowest, humid, date]

    (1..12).step(1) do |month|
      file = "#{@file_path}/#{@file_path}_#{@time}_#{Date::ABBR_MONTHNAMES[month]}.txt"
      read_file_data(file, read_year_data) if File.exist?(file)
    end

    calculate_max_temprature(highest, date)
    calculate_min_temprature(lowest, date)
    calculate_max_humid(humid, date)
  end

  def read_by_month
    year_month = @time.split('/')
    file = "#{@file_path}/#{@file_path}_#{year_month[0].to_i}_#{Date::ABBR_MONTHNAMES[(year_month[1].to_i)]}.txt"

    highest = []
    lowest = []
    humid = []
    date = []
    read_data = [highest, lowest, humid, date]

    if File.exist?(file)
      read_file_data(file, read_data)

      case @read_option
      when '-a'
        calculate_highest_avg(highest)
        calculate_lowest_avg(lowest)
        calculate_avg_humid(humid)
      when '-c'
        arg = [date, highest, lowest, Date::ABBR_MONTHNAMES[(year_month[1].to_i)], year_month[0].to_i]
        print_highest_and_lowest(arg)
        highest_lowest_combine(arg)
      end

    end
  end

  def read_file_data(file, read_data)

    line_data = []
    index_of_line = 0

    file = File.open(file)
    file.readline

    file.readlines.each do |file_data|
      line_data[index_of_line] = file_data.split(',')
      read_data[0].push(line_data[index_of_line][1])
      read_data[1].push(line_data[index_of_line][3])
      read_data[2].push(line_data[index_of_line][9])
      read_data[3].push(line_data[index_of_line][0])
    end
  end
end
