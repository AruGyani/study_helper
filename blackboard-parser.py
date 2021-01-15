# open file
file = open("input-study-helper.txt")
# read lines from file
lines = file.readlines()
# index check to see if we reached new section
index_check = 0
# student name
student_name = ""
# section lists of lists
section1 = []
section2 = []
# go through each line and make lists
for line in lines:
	if line == '\n':
		index_check += 1
		# skip this since we reached new section
	else:
		# first line is student name
		if index_check == 0:
			# removes \n char
			line = line[:-1]
			# remove spaces
			line = line.replace(" ", "")
			# lower case all 
			line = line.lower()
			student_name = line
		# first section of file
		elif index_check == 1:
			# removes \n char
			line = line[:-1]
			my_list = line.split(",")
			section1.append(my_list)
		# second section of file
		elif index_check == 2:
			# removes \n char
			line = line[:-1]
			my_list = line.split(",")
			section2.append(my_list)
print(section1)
print(section2)
file.close()

# write to file
f = open("header.pl","w")

f.write('student('+student_name+').\n\n')

# write classes
f.write('% classes\n')
for cls in section1:
	output = "class(" + cls[0] + ").\n"
	f.write(output)
f.write('\n')

# write taking
f.write('% taking\n')
f.write('% student is taking class with grade g\n')
for cls in section1:
	output = "taking(" + student_name + "," + cls[0] + "," + cls[1] + ").\n"
	f.write(output)
f.write('\n')

# write coursework and types
f.write('% class gives coursework due in x days\n')
for crs in section2:
	output = "coursework(" + crs[0] + "," + crs[1] + "," + crs[3] + ").\n"
	out = ""
	if crs[2] == "HOMEWORK":
		out = "homework(" + crs[1] + ").\n"
	
	elif crs[2] == "QUIZ":
		out = "quiz(" + crs[1] + ").\n"
		
	elif crs[2] == "PROJECT":
		out = "project(" + crs[1] + ").\n"
	
	elif crs[2] == "MIDTERM":
		out = "midterm(" + crs[1] + ").\n"
	
	elif crs[2] == "FINAL":
		out = "final(" + crs[1] + ").\n"

	f.write(output)
	f.write(out)
