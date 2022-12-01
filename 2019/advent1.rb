# frozen_string_literal: true

require 'bigdecimal/util'
require 'pry'

def total_fuel_required
  File
    .read('advent1.txt')
    .split("\n")
    .map(&:to_i)
    .sum { |module_mass| calculate_fuel(module_mass) }
end

def calculate_fuel(mass)
  calculated_mass = (mass.to_d / 3).floor - 2
  if calculated_mass <= 0
    0
  else
    fuel_mass = calculate_fuel(calculated_mass)

    calculated_mass + fuel_mass
  end
end

p total_fuel_required
# p calculate_fuel(12)
# p calculate_fuel(14)
# p calculate_fuel(1969)
# p calculate_fuel(100_756)
