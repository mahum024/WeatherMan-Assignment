# frozen_string_literal: true
module DisplayInfo
  def print_max_temp_avg(highest_temp_avg_p)
    puts "Highest Average: #{highest_temp_avg_p}C"
  end

  def print_min_temp_avg(min_temp_avg)
    puts "Lowest Average: #{min_temp_avg}C"
  end

  def print_avg_humidity(avg_humidity_p)
    puts "Average Humidity: #{avg_humidity_p}%"
  end

  def print_max_temp(p_max_temp, p_max_temp_date)
    arr = p_max_temp_date.split('-')
    highest_temp_date_string = "#{Date::MONTHNAMES[(arr[1].to_i)]} #{arr[2]}"
    puts "Highest:  #{p_max_temp}C on  #{highest_temp_date_string}"
  end

  def print_min_temp(p_min_temp, p_min_temp_date)
    arr = p_min_temp_date.split('-')
    min_temp_date_string = "#{Date::MONTHNAMES[(arr[1].to_i)]} #{arr[2]}"
    puts "Lowest: #{p_min_temp}C on #{min_temp_date_string}"
  end

  def print_max_humid(p_max_humidity, p_max_humid_day)
    arr = p_max_humid_day.split('-')
    min_temp_date_string = "#{Date::MONTHNAMES[(arr[1].to_i)]} #{arr[2]}"
    puts "Humid: #{p_max_humidity}% on #{min_temp_date_string} "
  end
end
