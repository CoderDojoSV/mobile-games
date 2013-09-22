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

-- but what happens when we have two or three players? That's a lot of
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



