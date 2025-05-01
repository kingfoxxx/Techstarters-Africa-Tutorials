#STRING FUNCTIONS
# CONCAT, LENGTH, RIGHT, LEFT, LTRIM, RTRIM, TRIM, REPLACE, LOCATE, SUBSTRING, UPPER, LOWER

# CONCAT
SELECT CONCAT("I love", " ", "sql") concatenate_i_love_sql;

# create a new column called fullname from the employees firstname and lastname
select concat(first_name, " ", last_name) full_name from employee_demographics;

#LENGTH
SELECT length("I LOVE CHELSEA FOOTBALL CLUB") string_length;

# FETCH THE LENGTH OF THE FIRST_NAME OF ALL EMPLOYEES
SELECT first_name, LENGTH(FIRST_NAME) firstname_length FROM employee_demographics;

# RIGHT 
select right("i love sql", 6);

# fetch the last three letters of all employees lastname
select right(last_name, 3) last_3_letters FROM employee_demographics;

# LEFT
select LEFT("i love sql", 6);

# fetch the FIRST three letters of all employees lastname
select LEFT(last_name, 3) FIRST_3_letters FROM employee_demographics;

#LTRIM (REMOVE UNWANTED SPACING FROM THE LEFT HAND SIDE)
select ltrim("       i love       sql     ") ;

#RTRIM (REMOVE UNWANTED SPACING FROM THE RIGHT HAND SIDE)
select rtrim("       i love       sql     ") ;

#TRIM (REMOVE UNWANTED SPACING FROM both left and RIGHT HAND SIDE)
select trim("       i love       sql     ") ;

# regex_replace (regular expression replace)

SELECT 
  TRIM(
      REPLACE(
        REPLACE("       i love       sql     ", '    ', ' '), 
      '   ', ' ')
  ) AS cleaned_text;
  
  
  # REPLACE ( TO REMOVE A STRING AND REPLACE WITH ANOTHER)
  SELECT REPLACE("I LOVE MANCHESTER UNITED", "MANCHESTER UNITED", "CHELSEA") replace_string;
  
  # locate (To find the position of a character in a string)
  select locate("d", "I love data analysis") match_position;
  
  # "Ajayi-tobi" to "Ajayi tobi"
  select replace("Ajayi-tobi", "-", " ");
  
  # SUBSTRING (TO GET A SUBSTRING FROM A STRING)
  SELECT substring("I LOVE SQL", 3, 4) substring;
  
  # UPPER (converts a lower case text into upper case)
  select upper("i love sql") capital_letters;
  
  # convert all employee lastname to uppercase in employee demographics table
  select last_name, upper(last_name) from employee_demographics;

  # LOWER (converts a upper case text into lower case)
  select lower("I LOVE SQL") small_letters;
  
  # convert all employee lastname to lowercase in employee demographics table
  select last_name, lower(last_name) from employee_demographics;
  
  