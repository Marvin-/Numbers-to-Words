module NumberToWords
  def to_words(number = self)
    change = number.to_s.split("")

    numbers = { 1 => "one", 2 => "two", 3 => "three", 4 =>"four", 5 =>"five", 6 =>"six", 7 =>"seven", 8 =>"eight", 9 => "nine" }
    teen = {11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}
    tens = {10 =>"ten", 20 =>"twenty", 30 =>"thirty", 40 =>"fourty", 50 =>"fifty", 60 =>"sixty", 70 =>"seventy", 80 =>"eighty", 90 =>"ninety"}
    big = [100 =>"hundred", 1000 =>"thousand", 1000000 =>"million"]
    
    if change.size < 3    
      if change.size < 2      
        numbers[number].capitalize        
      elsif change[1].to_i == 0
        tens[change[0].to_i * 10].capitalize
      elsif change[0].to_i == 1
        teen[10 + change[1].to_i].capitalize
      else
        tens[change[0].to_i * 10].capitalize + " " + numbers[change[1].to_i].capitalize        
      end              
    end 

  end
end

class Fixnum
  include NumberToWords
end