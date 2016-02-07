module NumberToWords
  def to_words(number = self)
    change = number.to_s.split("")

    numbers = { 1 => "One", 2 => "Two", 3 => "Three", 4 =>"Four", 5 =>"Five", 6 =>"Six", 7 =>"Seven", 8 =>"Eight", 9 => "Nine", 
              10 => "Ten",11 => "Eleven", 12 => "Twelve", 13 => "Thirteen", 14 => "Fourteen", 15 => "Fifteen", 16 => "Sixteen", 
              17 => "Seventeen", 18 => "Eighteen", 19 => "Nineteen"}
    tens = { 10 =>"Ten", 20 =>"Twenty", 30 =>"Thirty", 40 =>"Fourty", 50 =>"Fifty", 60 =>"Sixty", 70 =>"Seventy", 80 =>"Eighty", 90 =>"Ninety"}
    big = { 100 =>"Hundred", 1000 =>"Thousand", 1000000 =>"Million"}
    
    two_zeros = true if change[1].to_i == 0 && change[2].to_i == 0 
    three_zeros = true if two_zeros && change[3].to_i == 0
    four_zeros = true if three_zeros && change[4].to_i == 0

    if number < 100    
      if number < 20      
        numbers[number]        
      else     
        change[1].to_i == 0 ? tens[change[0].to_i * 10] :
        tens[change[0].to_i * 10] + " " + numbers[change[1].to_i]        
      end              
    elsif change.size == 3
      if two_zeros
        numbers[change[0].to_i] + " " + big[100]
      else
        n = change[1].to_i * 10 + change[2].to_i
        numbers[change[0].to_i] + " " + big[100] + " " + to_words(n)
      end
    elsif change.size == 4 
      if three_zeros
        numbers[change[0].to_i] + " " + big[1000]
      elsif
        n = change[1].to_i * 100 + change[2].to_i * 10 + change[3].to_i
        numbers[change[0].to_i] + " " + big[1000] + " " + to_words(n)
      end
    elsif number < 100000
      n = change[2].to_i * 100 + change[3].to_i * 10 + change[4].to_i 
      first_two = change[0] + change[1]
      if number < 20000
        to_words(first_two.to_i) + " " + big[1000] + " " + to_words(n)
      else
        four_zeros ? to_words(first_two.to_i) + " " + big[1000] : 
                     to_words(first_two.to_i) + " " + big[1000] + " " + to_words(n)
      end
      
    end
  end

end

class Integer
  def digits
    Enumerator.new do |x|
      to_s.chars.map{|c| x << c.to_i }
    end
  end
end
class Fixnum
  include NumberToWords
end