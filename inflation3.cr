require "benchmark"

INFLATION_BY_YEAR = {
  1990 => 5.4, 1991 => 4.2, 1992 => 3.0, 1993 => 2.7, 1994 => 2.7,
  1995 => 2.8, 1996 => 3.0, 1997 => 2.3, 1998 => 1.6, 1999 => 2.2,
  2000 => 3.4, 2001 => 2.8, 2002 => 1.6, 2003 => 2.3, 2004 => 2.7,
  2005 => 3.4, 2006 => 3.2, 2007 => 2.8, 2008 => 3.8, 2009 => -0.4,
  2010 => 1.6, 2011 => 3.2, 2012 => 2.1, 2013 => 1.5, 2014 => 1.6,
  2015 => 0.1, 2016 => 1.3, 2017 => 2.1, 2018 => 2.4, 2019 => 1.8,
  2020 => 1.4
}

def original_inflation_calculator
  year = rand(1990..2020)
  income = rand(2000..75000)

  income_in_2020 = income
  (year...2020).each do |y|
    income_in_2020 *= 1 + INFLATION_BY_YEAR[y]/100.0
  end

  income
end

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

Benchmark.ips do |x|
  x.report("original") do
    original_inflation_calculator
  end

  x.report("new") do
    crystalized_inflation_calculator
  end
end
