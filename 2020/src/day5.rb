# frozen_string_literal: true

require 'pry'

# Puzzle: https://adventofcode.com/2020/day/3

def parse(source_file)
  File.read(source_file).split("\n")
end

def bin_search_row(index, row_str, lo, hi)
  letter = row_str[index]
  mid = (lo + hi) / 2
  if letter == 'F'
    if index == 6
      mid
    else
      bin_search_row(index + 1, row_str, lo, mid)
    end
  elsif index == 6
    mid + 1
  else
    bin_search_row(index + 1, row_str, mid + 1, hi)
  end
end

def bin_search_col(index, col_str, lo, hi)
  letter = col_str[index]
  mid = (lo + hi) / 2
  if letter == 'L'
    if index == 2
      mid - 1
    else
      bin_search_col(index + 1, col_str, lo, mid)
    end
  elsif index == 2
    mid
  else
    bin_search_col(index + 1, col_str, mid + 1, hi)
  end
end

def run(source_file)
  passes = parse(source_file)
  seats = passes.map do |pass|
    row_str = pass.slice(0..6)
    col_str = pass.slice(7..9)

    row = bin_search_row(0, row_str, 0, 127)
    col = bin_search_col(0, col_str, 0, 8)

    seat = row * 8 + col
  end

  # binding.pry
  # seats

  sorted_seats = seats.sort

  sorted_seats.each_with_index do |seat, index|
    if index.positive?
      binding.pry if seat != sorted_seats[index - 1] + 1
    end
  end
end

run('../input/day5.txt')
