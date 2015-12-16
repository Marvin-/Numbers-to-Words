module NumberToWords
  def to_words(number = self)
    change = number.to_s.split("")

    numbers = { 1 => "One", 2 => "Two", 3 => "Three", 4 =>"Four", 5 =>"Five", 6 =>"Six", 7 =>"Seven", 8 =>"Eight", 9 => "Nine" }
    teen = {11 => "Eleven", 12 => "Twelve", 13 => "Thirteen", 14 => "Fourteen", 15 => "Fifteen", 16 => "Sixteen", 17 => "Seventeen", 18 => "Eighteen", 19 => "Nineteen"}
    tens = {10 =>"Ten", 20 =>"Twenty", 30 =>"Thirty", 40 =>"Fourty", 50 =>"Fifty", 60 =>"Sixty", 70 =>"Seventy", 80 =>"Eighty", 90 =>"Ninety"}
    big = {100 =>"Hundred", 1000 =>"Thousand", 1000000 =>"Million"}
    
    two_zeros = true if change[1].to_i == 0 && change[2].to_i == 0 
    three_zeros = true if two_zeros && change[3].to_i == 0

    if change.size < 3    #if less than 100
      if change.size < 2      #if less than 10
        numbers[number]        
      elsif change[1].to_i == 0     # if tens
        tens[change[0].to_i * 10]
      elsif change[0].to_i == 1     #if teens
        teen[10 + change[1].to_i]
      else
        tens[change[0].to_i * 10] + " " + numbers[change[1].to_i]        
      end              
    elsif change.size == 3      #if in hundreds
      if two_zeros
        numbers[change[0].to_i] + " " + big[100]
      else
        n = change[1].to_i * 10 + change[2].to_i
        numbers[change[0].to_i] + " " + big[100] + " " + to_words(n)
      end
    elsif change.size == 4 #if in thousands
      if three_zeros
        numbers[change[0].to_i] + " " + big[1000]
      else
        n = change[1].to_i * 100 + change[2].to_i * 10 + change[3].to_i
        numbers[change[0].to_i] + " " + big[1000] + " " + to_words(n)
      end
    end
  end

end

class Fixnum
  include NumberToWords
end