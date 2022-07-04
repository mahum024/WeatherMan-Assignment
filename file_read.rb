# frozen_string_literal: true

module FileRead
  require_relative 'horizontal_charts'
  require_relative 'calculate_tempratures'
  include DisplayHorizontalCharts
  include CalculateTempratureModule
  require 'date'
  def read_by_years
    index_of_line = 0
    highest = []
    lowest = []
    line_data = []
    humid = []
    date = []

    (1..12).step(1) do |month|
      file = "#{@file_path}/#{@file_path}_#{@time}_#{Date::ABBR_MONTHNAMES[month]}.txt"
      if File.exist?(file)
        file = File.open(file)
        file.readline
        file.readlines.each do |file_data|
          line_data[index_of_line] = file_data.split(',')
          highest.push(line_data[index_of_line][1])
          lowest.push(line_data[index_of_line][3])
          humid.push(line_data[index_of_line][9])
          date.push(line_data[index_of_line][0])
          index_of_line += 1
        end
      end
    end

    calculate_max_temprature(highest, date)
    calculate_min_temprature(lowest, date)
    calculate_max_humid(humid, date)
  end

  def read_by_year_and_month_a
    year_month = @time.split('/')
    file_name = "#{@file_path}/#{@file_path}_#{year_month[0].to_i}_#{Date::ABBR_MONTHNAMES[(year_month[1].to_i)]}.txt"

    index_of_line = 0

    highest = []
    lowest = []
    line_data = []
    humid = []
    date = []

    if File.exist?(file_name)
      file = File.open(file_name)
      file.readline
      file.readlines.each do |file_data|
        line_data[index_of_line] = file_data.split(',')
        highest << line_data[index_of_line][1]
        lowest << line_data[index_of_line][3]
        humid << line_data[index_of_line][8]
        date << line_data[index_of_line][0]
        index_of_line += 1
      end

      calculate_highest_avg(highest)
      calculate_lowest_avg(lowest)
      calculate_avg_humid(humid)

    end
  end

  def read_by_year_and_month_c
    year_month = @time.split('/')
    file_name = "#{@file_path}/#{@file_path}_#{year_month[0].to_i}_#{Date::ABBR_MONTHNAMES[(year_month[1].to_i)]}.txt"

    index_of_line = 0

    high = []
    lowest = []
    line_data = []
    date = []

    file = File.open(file_name)
    file.readline
    file.readlines.each do |file_data|
      line_data[index_of_line] = file_data.split(',')
      high << line_data[index_of_line][1]
      lowest << line_data[index_of_line][3]
      date << line_data[index_of_line][0]
      index_of_line += 1
    end
    arg = [date, high, lowest, Date::ABBR_MONTHNAMES[(year_month[1].to_i)], year_month[0].to_i]
    print_highest_and_lowest(arg)
    highest_lowest_combine(arg)
  end
end
