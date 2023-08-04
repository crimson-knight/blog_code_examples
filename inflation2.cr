INFLATION_BY_YEAR_STATIC_ARRAY = StaticArray[
  5.4, 4.2, 3.0, 2.7, 2.7, # 1990 - 1994
  2.8, 3.0, 2.3, 1.6, 2.2, # 1995 - 1999
  3.4, 2.8, 1.6, 2.3, 2.7,  # 2000 - 2004
  3.4, 3.2, 2.8, 3.8, -0.4, # 2005 - 2009
  1.6, 3.2, 2.1, 1.5, 1.6,  # 2010 - 2014
  0.1, 1.3, 2.1, 2.4, 1.8,  # 2015 - 2019
  1.4 # 2020
]

def crystalized_inflation_calculator
  year = rand(0..19)
  income = rand(2000..75000)
  iterations_to_loop = INFLATION_BY_YEAR_STATIC_ARRAY.size - year

  income_in_2020 = income
  iterations_to_loop.times do |y|
    income_in_2020 *= 1 + INFLATION_BY_YEAR_STATIC_ARRAY[y]/100.0
    year += 1
  end

  income
end

1000000.times do
  crystalized_inflation_calculator
end
