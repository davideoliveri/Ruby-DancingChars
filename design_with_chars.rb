=begin
*** 	Design_with_chars 	***
### 	Davide Oliveri 		###

After a workshop from CodingGrace [http://tmblr.co/Z3Bb1v184mQAj]

A ruby script to draw "floating" charachters.

Follow the instruction on screen after laucnhing the script; 

You can choose the charachters to perform the "dance" or just let
the default dancing for you! 

This script demonstrate Array, Hash, Conditionals, Block, loops and sleep(t), enjoy
=end

i = 1
index =  0


#default values:
defaultrotation = true
char = ["/", "#", "#", "\\"]
amt = 40
direction = 1
s = 0.015
speed = {"slow" => 0.025, "medium" => 0.015, "fast" => 0.005}



puts "\nLet's start here, and give me a string\nbe sure you put strange characters like '#' or \\ ok? No spaces allowed\ntry the default first \"/##\\\" hitting RETURN\n\n"

str = gets.chomp
if str.size > 0
	if str.size != 4
		defaultrotation = false
	end
	str.each_char { |c|
		if c != ' ' 
			char[index] = c
			index += 1
		end
	}
end


puts "\nHow fast do you want the dance to go? type \"slow\" or \"medium\" (default) or \"fast\""

wantedspeed = gets.chomp
speed.select{|ws, v| 
	if wantedspeed == ws 
		s = v 
	end}

print "using #{char}\n\n"

while i<600
	if direction > 0
		n = (i%amt)
		m = (amt-n)
	else 
		m = (i%amt)
		n = (amt-m)
	end

	if n != 0 && m != 0 
		print char[0]*m 
		print char[1]*(n)
		print char[2]*m 
		print char[3]*(n)
		print "\n" 
	else
		if !defaultrotation
			char.rotate!
		end		
	end

	if (i%amt == 0) 
		direction *= -1		
	end
	i+=1	
	sleep(s)
end

