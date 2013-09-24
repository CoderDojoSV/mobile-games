--# An Introduction to Lua

function consider(thought) 
	return
end

-- The Lua programming language was created in Brazil in 1993 to be used
-- as the language to enter and fetch data in a larger system. Because it was
-- so small, simple, and *fast* it became the language of choice for video
-- game developers who wanted to write their game engine in a systems language
-- like C but allow the game designers to make surface changes using a much
-- simpler language.

-- Today Lua is one of the most popular programming languages for games
-- development. It's used by Valve, Blizzard, Crytek, BioWare, and Sonic Team, 
-- as well as many others.

--## Lua Values

-- The Lua language has three types of scalar (singular) values:

-- ### Strings

-- Strings are words for people and they are written using double quotes (" ").
-- Lua ignores the words in strings and treats all other words as Lua code.

consider( "hello" ) 
consider( "Do you know the way to San Jose?" )

-- ### Numbers

-- Numbers are just like you remember them from math! You can perform arithmetic
-- on them and use Lua as your calculator if you want.
consider( 5 )
consider( 4 + 3 )

-- Operations in Lua follow the algebraic order of operations. Remember PEMDAS?

-- * __P__arentheses
consider( (5 + 3) * 2 )
-- * __E__xponents
consider( 2 ^ 4 )
-- * __M__ultiplication
consider( 2 * 6 )
-- * __D__ivision
consider( 6 / 3 )
-- * __A__ddition
consider( 5 + 9 )
-- * __S__ubtraction
consider( 9 - 3 )

-- Numbers in Lua are all decimals. Some languages treat whole numbers and
-- decimal numbers differently, but Lua doesn't. There is one operation that we
-- haven't mentioned yet. It's called "mod" or "remainder" and uses the `%` sign
-- but it's not a percentage. It's the remainder left over after you do long
-- division.

-- For example, if you want to find out whether a number is even or
-- odd, you can check by looking at the remainder when you divide by two. If
-- it's 1, the number is odd. Otherwise it's 0.
consider( 5 % 2 == 1 )
consider( 6 % 2 == 0 )

-- You can even do this for super huge numbers like 17^13
consider( 17^13 % 2 == 0 )

-- ### True, false, and nil

-- `true` and `false` are called "boolean" values, named after George Boole, an
-- English mathematician who studied logic. His work laid the foundations for
-- the computers of today!

-- Lua has boolean values `true` and `false` and a special value called `nil`.
consider( true )
consider( false )

-- Nil means "no value".
consider( nil )

-- There are also logical operations that take boolean values and return
-- different boolean values based on rules. Just like addition with numbers.

-- `and` is only true of both the left and right side are true
consider( true and true == true )
consider( true and false == false )
consider( false and true == false )
consider( false and false == false )

-- `or` is true of either the left or the right side are true
consider( true or true == true )
consider( true or false == true )
consider( false or true == true )
consider( false or false == false )

-- `not` just reverses the value!
consider( not true == false )
consider( not false == true )

-- Can you spot the difference between these two? Order of operations applies to
-- both numbers and booleans.
consider( not ( true and false ) == true )
consider( ( not true ) and false == false )

-- ## Comparing values

-- Values by themselves are quite useful. But it's also really handy to be able
-- to compare different values. For example, you might want to rank players by
-- how high there score is, or sort names in an address book alphabetically. You
-- do this in Lua with Comparison Operators.

-- ### Are these equal?

-- To test if two values are the same, use the `==` operator. It's important to
-- use two equals signs otherwise Lua will think you're assigning a value to a
-- variable.

-- Think of one equals sign as the statement "Make `x` be `5`.
local x = 5

-- And two equals `==` signs as the question "Is `x` the same as `5`?".
consider( x == 5 )

-- If you actually want to know when things are *not* equal, you can use the
-- `~=` operator.
local remaining_lives = 3
local keep_playing = remaining_lives ~= 0

-- ### Which comes first?

-- When things aren't the same, it's often handy to sort them. For example we
-- could sort names in alphabetical order or numbers from largest to smallest
-- but we need to know which numbers are bigger and which letters come first.
-- We can do that with the "greater than" operator `>` and the "less than" `<`.

-- Because 5 is greater than 3. This is true.
consider( 5 > 3 == true )

-- Since 11 is much smaller than 106. This is false.
consider( 106 < 11 == false )

-- Here's an interesting one. Is 6 greater than 6? No. Is 6 smaller than 6?
-- No. So both of these operations return false. If we wanted to include
-- 6 in one side or the other, we could use the "greater than or equal to"
-- operator `>=` or the "less than or equal to" operator `<=`.

-- These operations are actually just shorthand.
consider( (6 >= 3) == (6 > 3 or 6 == 3) )

-- ## Lua Variables

-- In Lua, you keep track of your stuff with variables. A variable isn't like
-- a variable in algebra. It's really just a name you give to something so you
-- can refer to it later. You could also think of variables as a box that you'll
-- put values into. There are two types of variables in Lua, local and global.

-- ### Local variables

-- Local variables are created with the `local` keyword. They belong to the area
-- around the variable declaration.
local my_name

-- You can also create a variable with a starting value. If you don't specify a
-- starting value, the variable will start out as `nil`.
local my_favorite_color = "purple"

-- ### Global variables

-- Sometimes you want a variable to be shared across your entire game. You can
-- use a global variable to do this. Maybe you want to keep track of whose turn
-- it is in a game. To create a global variable, just assign a value to a new
-- variable without using the `local` keyword.
current_turn = 1

-- ### Accessing a variable's value

-- To access a variable's value, just use the variable's name where you want the
-- value to be used.
if current_turn == 1 then
	consider( "it's player one's turn" )
else
	consider( "it's player two's turn" )
end


--## Lua Tables

-- Most of the time we don't just want a single variable; we have a collection
-- of values that are all related to each other. Maybe we're keeping track of
-- a player's name, score, and remaining lives. We could use three variables.
local player_name, player_score, player_lives

-- But what happens when we have two or three players? That's a lot of
-- variables! Tables are Lua's way of organizing data.

-- ### Creating Tables

-- Creating tables is easy. You can make them empty:
local player_one = {}

-- Or give them a starting set of values
local player_two = {
	name = "unknown",
	lives = 3,
	score = 0,
}

-- In the above example, `name`, `lives`, and `score` are called "fields" or
-- "attributes". I like fields because it's shorter to say.

-- ### Adding fields to a table.

-- Let's add the fields we specified for `player_two` to our `player_one` table
player_one.name = "who knows"
player_one.lives = 3
player_one.score = 0

-- ### Accessing the values of fields

-- You can access the value of a field by prefixing the field name with a `.`
-- and adding it to the end of the table name.
if player_one.lives == 0 then
	consider( "It's probably Game Over" )
end

-- You can also access fields using square brackets. When you do this, the field
-- name should be in string form. This will let you store field *names* in a
-- variable.
local lives_field_name = "lives"
consider( player_one["lives"] == player_one[lives_field_name] )

-- ### List tables

-- Field access with brackets comes in handy if you want a list instead of a
-- table. Just use numbers as the field name.
local people = {}
people[0] = "Alice"
people[1] = "Bob"
people[2] = "Cindy"

-- In fact, this use of tables as lists is so common, that you can create lists
-- automatically by putting values inside a table without field names.
people = { "Alice", "Bob", "Cindy" }

-- One thing to watch out for, when you create a list table like that, Lua
-- treats the first person as number `1`. Most programming languages start
-- counting at 0, so Lua is a bit unique in this regard. For games, starting at
-- 0 can often be advantageous so we'll create our own lists that start at 0.

-- Lua tables are sometimes called objects because they can be used for
-- something called "object oriented programming". Since the Corona SDK uses
-- object oriented programming. We'll be seeing some of this.

-- ## Lua Conditionals

-- In programming, we often want to do different things depending on what is
-- happening in our program. The simplest way to do this, is make a decision
-- about what to do based on a yes or no question. In Lua, `true` is our yes and
-- `false` acts as no.
local has_patience = false
local winning_the_game = true

-- To make a decision, we use an *if-then* statement which is often called a
-- "conditional" because it does different things based on certain conditions.

-- Because has_patience is false, only the second consideration will occur. In
-- a conditional statement like this, exactly one branch will be run; never
-- both.
if has_patience then
	consider( "You will go far as long as you have patience and curiousity" )
else
	consider( "We know you're itching to make games.. Soon." ) 
end

-- Here, because you're winning the game, we make it harder. If you weren't
-- winning the game, nothing at all would happen since we didn't specify an
-- "else". Which is what we call the code to run if the condition is false.
if winning_the_game then
	consider( "We'll make it harder." )
end

-- If we have multiple conditions, then we smoosh the `else` together with the
-- next `if`.
--
-- Notice how even though we didn't explicitly check that the guess was equal
-- to the secret number, we know for sure that's true since if it isn't bigger
-- and isn't smaller, it must be the same.
local secret_number = 27
local guessed_number = 33
if secret_number > guessed_number then
	consider( "Our next guess should be bigger" )
elseif secret_number < guessed_number then
	consider( "Our next guess should be smaller" )
else
	consider( "If it's not bigger, and it's not smaller it must be the same")
end

-- ## Lua Loops

-- Without loops, things would only happen once. In a game, there are things
-- going on constantly. The average game updates thirty times in a single
-- second! Loops are like super conditionals. Not only do they check a true
-- or false statement but they keep checking it and running until it finally
-- becomes false. You can use loops to make your game run forever, or make it
-- run twice, or anything in between!

-- ### While loops

-- A while loop is just a super-if. There's no else because when the loop is
-- done it just keeps going with the next part of the code.
local food_on_my_plate = true
while food_on_my_plate do
	consider( "Eating your vegetables makes you healthy." )
	-- If you don't do this, your loop will run forever!
	food_on_my_plate = false
end

-- ### For loops

-- For loops are specially designed to help you make a loop where you do
-- the same thing but with different values each time. Let's say you wanted to
-- calculate 9 factorial. Which is 9 x 8 x 7 x 6 x 5 x 4 x 3 x 2 x 1
local sum = 1
for i = 1, 9 do
	sum = i * sum
end
consider( sum == 362880 )

-- There's also a special form of a for loop that repeatedly calls a function
-- until the value is nil. This is really useful for say, processing words in
-- a sentence. We'll see it later.

-- ## Lua Functions

-- Functions make the world go 'round. It's hard to have a programming language
-- without some way to take a series of simple operations and refer to them as
-- one more complex operation. In Lua, we do that using functions.

-- Functions in Lua are actually scalar data types, just like strings, numbers,
-- and booleans!  You store a function in a variable and recall it later when
-- you want to use it.
local add_two = function(x)
	return x + 2
end

-- The function has no name except the name of the variable that contains it.
-- It has one parameter, in this case, *x*. Inside the function, this acts like
-- a local variable. When you create or call the function it is referred to as a 
-- "parameter".
local add_three_numbers = function(x, y, z)
	return x + y + z
end
consider( add_three_numbers(3, 7, 10) )

-- ## Lua Methods

-- Some languages, including Lua have facilities for Object Oriented
-- Programming. Object Oriented Programming (or OOP) as it is commonly called
-- is a way of organizing code to make it easier to think about and use. It
-- comes from one of the original languages designed to be friendly to new
-- young programmers, but it has proved so useful that it's now a large pillar
-- of commercial and open source software as well!

-- In Lua, the primary facility for OOP that we'll be using is the "method".
-- Methods in Lua are functions where the first argument is always the table
-- that the function is stored in. This is why we sometimes refer to our tables
-- as objects.

-- Let's do an example. Suppose we have two people, Jim and Suzie.
local Jim = { name = "Jim", favorite_food = "ice cream" }
local Suzie = { name = "Suzie", favorite_food = "brocolli" }

-- Now let's create a function to use as an introduce method. Where one person
-- will introduce themselves to the other. The `..` here is called a string
-- concatenation. It just connects two strings and makes them one.
local introduce = function(self, other)
	print("Hi " .. other.name .. " my name is " .. self.name ..". I like " ..
		self.favorite_food .. ". What's your favorite?")
end

-- We could use this function just as it is, like a function. But if we want
-- to attach the function to Jim or Suzie so we can keep everything in one
-- package, we'll end up with lines of code like:
--     Jim.introduce(Jim, Suzie)
-- Which is cumbersome to write and even harder to read.

-- Instead we can attach the introduce function to both Jim and Suzie and
-- call it using the method syntax, which uses a `:` in place of a dot.
Jim.introduce = introduce
Suzie.introduce = introduce

Jim:introduce(Suzie)

-- Note that these two lines do exactly the same thing!
Suzie.introduce(Suzie, Jim)
Suzie:introduce(Jim)

-- And now you know enough Lua to have fun and make stuff!
