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

1000000.times do
  original_inflation_calculator
end
