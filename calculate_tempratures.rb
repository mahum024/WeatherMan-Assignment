# frozen_string_literal: true

module CalculateTempratureModule
  require_relative 'display'
  include DisplayInfo

  def calculate_max_temprature(highest, date)
    highest.map!(&:to_i)
    highest_temprature = highest.max
    highest_temprature_index = highest.index(highest_temprature)
    date_of_highest_temprature = date[highest_temprature_index]
    print_max_temp(highest_temprature, date_of_highest_temprature)
  end

  def calculate_min_temprature(lowest, date)
    lowest.map!(&:to_i)
    lowest_temprature = lowest.min
    lowest_temprature_index = lowest_temprature
    date_of_lowest_temprature = date[lowest_temprature_index]
    print_min_temp(lowest_temprature, date_of_lowest_temprature)
  end

  def calculate_max_humid(humid, date)
    humid.map!(&:to_i)
    highest_humid = humid.max
    highest_humid_index = highest_humid
    date_of_highest_humid = date[highest_humid_index]
    print_max_humid(highest_humid, date_of_highest_humid)
  end

  def calculate_highest_avg(highest)
    highest.map!(&:to_i)
    avg_highest = highest.sum(0.0) / highest.size
    print_max_temp_avg(avg_highest)
  end

  def calculate_lowest_avg(lowest)
    lowest.map!(&:to_i)
    avg_lowest = lowest.sum(0.0) / lowest.size
    print_min_temp_avg(avg_lowest)
  end

  def calculate_avg_humid(humid)
    humid.map!(&:to_i)
    avg_humidity = humid.sum(0.0) / humid.size
    print_avg_humidity(avg_humidity)
  end
end
