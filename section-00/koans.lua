local __ = -1
local ___
local whisperwhisper, penultimate, find_a_definition
local koans = {}
local consider = function(phrase, line, condition)
  if koans.stop_and_reflect then
    return
  end

  print(phrase)
  if condition then
    koans[phrase] = true
  else
    print("Stop and reflect on line " .. line)
    koans.stop_and_reflect = true
  end
  print()
end

local ponder_the_creation_of = function(phrase, line, fn, result)
  consider(phrase, line, fn() == result)
end

print("***************** Lua Koans ******************")

print("These are the Lua koans. Tiny puzzles that help you" ..
" get used to the new language.")
print("If you find them cryptic and confusing, don't lose heart.")
print()
print("They are cryptic and confusing")
print()
print("Designed to make you think about the language.")
print()
print("If ever you feel stuck, there will be someone to help.")
print("Good luck. Have fun.")

print()
print()
print("################# Numeric Koans ##################")

consider(
"Two may do the work of one, and in less time.",
               debug.getinfo(1).currentline + 1,
  5 + __ == 12
)

consider(
"In order to reduce in size, another operator is needed.",
                         debug.getinfo(1).currentline + 1,
  19 == 23 - __
)

if not koans.stop_and_reflect then
  print()
  print()
  print("################# Stringy Koans ##################")
end

consider(
"When the computer doesn't know what you're saying. Wrap it in quotes.",
                                       debug.getinfo(1).currentline + 1,
  whisperwhisper
)

consider(
"When you don't know what you're saying, consult a dictionary.",
                                       debug.getinfo(1).currentline + 1,
  penultimate ~= find_a_definition
)


if not koans.stop_and_reflect then
  print()
  print()
  print("################# Boolean Koans ##################")
end

consider(
"It's reasonably true that truth is truthy",
           debug.getinfo(1).currentline + 1,
  true
)

consider(
"When two come together, the result is agreement",
           debug.getinfo(1).currentline + 1,
  true and true == ___
)

consider(
"Where one fails, help can rally",
           debug.getinfo(1).currentline + 1,
  false or true == ___
)

