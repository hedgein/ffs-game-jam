//Array
//[0 - text, 1 - option1, 2 - option2, 3 - option3][passage #]
// 5: 1 = even triple, 2 = hard (1-4, 5-6), 3 = hard flip (1-2, 3-6), 4 = even duo (1-3, 4-6)

//Start
global.battle_snail[0, 0] = "SNAIL hid in its shell!";
global.battle_snail[0, 1] = "*knock knock*";
global.battle_snail[0, 2] = "Grab the hammer!";
global.battle_snail[0, 3] = "NONE";
global.battle_snail[0, 4] = 2; //Option count, not including zero
global.battle_snail[0, 5] = "HARD"


//2nd level:
//Knock knock
global.battle_snail[1, 0] = "Uh...Hi! How come you don't have a shell?";
global.battle_snail[1, 1] = "Because I'm brave!"; //shell not cracked 1
global.battle_snail[1, 2] = "I've just never had one!"; // shell not cracked 2
global.battle_snail[1, 3] = "The question is how come you have one... *grabs hammer*"; //grab the hammer
global.battle_snail[1, 4] = 3; //Option count, not including zero
global.battle_snail[1, 5] = "EVEN"; //even triple

//Grab the hammer
global.battle_snail[2, 0] = "No! Stop! Please don't crack my shell! It's the only place I feel safe!";
global.battle_snail[2, 1] = "The right thing isn't always the easy thing."; //shell cracked 2
global.battle_snail[2, 2] = "This'll hurt me more than it'll hurt you."; //shell cracked 
global.battle_snail[2, 3] = "Would you like to talk?"; //knock nock
global.battle_snail[2, 4] = 3; //Option count, not including zero
global.battle_snail[2 ,5] = "EVEN";//even triple

//3rd level
//Shell not cracked
global.battle_snail[3, 0] = "I don't know... I don't think I could ever be as brave as you.";
global.battle_snail[3, 1] = "Then I'll be brave for the both of us!"; // snail lets you crack it
global.battle_snail[3, 2] = "You can still be brave even if you're afraid";  // middle point 2
global.battle_snail[3, 3] = "NONE";
global.battle_snail[3, 4] = 2; //Option count, not including zero
global.battle_snail[3 ,5] = "HARD";//hard 

//Shell not cracked 2
global.battle_snail[4, 0] = "I couldn't imagine life without my shell, it's my entire world!";
global.battle_snail[4, 1] = "Isn't that kind of a small world? You're missing out!"; //middle point
global.battle_snail[4, 2] = "Then there's a whole new world waiting for you out there!"; //snail lets you crack it
global.battle_snail[4, 3] = "NONE";
global.battle_snail[4, 4] = 2; //Option count, not including zero
global.battle_snail[4 ,5] = "HARD FLIP";//hard flip

//Shell cracked
global.battle_snail[5, 0] = "*wiggles uncontrollably* What did I ever do to you?";
global.battle_snail[5, 1] = "The real question is... what did you ever do to yourself?"; //middle point 2
global.battle_snail[5, 2] = "Just trust me, I've done this before."; //you crack it
global.battle_snail[5, 3] = "NONE";
global.battle_snail[5, 4] = 2; //Option count, not including zero
global.battle_snail[5 ,5] = "HARD";//hard 

//Shell cracked 2
global.battle_snail[6, 0] = "What does that even mean?!";
global.battle_snail[6, 1] = "It means that hiding in your shell can't be the only answer"; //middle point
global.battle_snail[6, 2] = "I don't know but brace yourself!"; //you crack it
global.battle_snail[6, 3] = "NONE";
global.battle_snail[6, 4] = 2; //Option count, not including zero
global.battle_snail[6 ,5] = "HARD FLIP";//hard flip

//Loop dead ends portion
//Snail lets you crack it
global.battle_snail[7, 0] = "Well maybe I wouldn't mind a cracked shell then...";
global.battle_snail[7, 1] = "May I do the honors?"; //prelude snail lets you crack it end 1 2
global.battle_snail[7, 2] = "Just do it!"; //shell not crack 2
global.battle_snail[7, 3] = "NONE";
global.battle_snail[7, 4] = 2; //Option count, not including zero
global.battle_snail[7 ,5] = "EVEN DUO";//even duo

//Prelude snail lets you crack it 1 2
global.battle_snail[8, 0] = "Are you sure?!";
global.battle_snail[8, 1] = "It'll change your life!"; //shell not cracked 2
global.battle_snail[8, 2] = "Just do it!"; //you crack it
global.battle_snail[8, 3] = "NONE";
global.battle_snail[8, 4] = 2; //Option count, not including zero
global.battle_snail[8 ,5] = "HARD";//hard (1-4, ,5-6)

//Middle level section
//Middle point 2
global.battle_snail[9, 0] = "I-I never thought of it that way...!";
global.battle_snail[9, 1] = "...is everything okay?"; //prelude middle end
global.battle_snail[9, 2] = "Let me crack your shell!"; //prelude snail lets you crack it 1 2
global.battle_snail[9, 3] = "NONE";
global.battle_snail[9, 4] = 2; //Option count, not including zero
global.battle_snail[9 ,5] = "HARD FLIP";//hard flip (1-2, ,4-6)

//Middle point
global.battle_snail[10, 0] = "Well...sometimes I don't like being this way...";
global.battle_snail[10, 1] = "*start to dance to cheer up Snail!*"; //prelude you crack it
global.battle_snail[10, 2] = "It's okay to be where you are. Sometimes that's enough!"; //prelude middle end
global.battle_snail[10, 3] = "NONE";
global.battle_snail[10, 4] = 2; //Option count, not including zero
global.battle_snail[10 ,5] = "HARD";//hard (1-4, ,5-6)

//you crack it
global.battle_snail[11, 0] = "What?! Shouldn't I have a say in this?";
global.battle_snail[11, 1] = "Hmmm... just dance it out!"; //Prelude you crack it
global.battle_snail[11, 2] = "Just...hold still...!"; //prelude you crack it 2
global.battle_snail[11, 3] = "NONE";
global.battle_snail[11, 4] = 2; //Option count, not including zero
global.battle_snail[11 ,5] = "EVEN DUO";//even duo (1-4, ,5-6)

//Prelude level
//prelude middle end
global.battle_snail[12, 0] = "YOU KNOW WHAT, GIVE ME THAT HAMMER! I WANT TO BE FREE!";
global.battle_snail[12, 1] = "Yes! That's the energy this world needs!"; //middle end
global.battle_snail[12, 2] = "Woah, where did this change from?"; //shell not cracked 1 ---REVISE LATER??---
global.battle_snail[12, 3] = "FREEDOM!";
global.battle_snail[12, 4] = 3; //Option count, not including zero
global.battle_snail[12 ,5] = "EVEN";//even (1-2, 4-6 ,5-6)

//prelude you crack it
global.battle_snail[13, 0] = "*A hardcore dance party begins between you and snail begins!*";
global.battle_snail[13, 1] = "*The hammer accidentally flies from your hand!*"; //you crack it end 1
global.battle_snail[13, 2] = "*You whack Snail while they aren't looking!*"; //you crack it end 2
global.battle_snail[13, 3] = "NONE";
global.battle_snail[13, 4] = 2; //Option count, not including zero
global.battle_snail[13 ,5] = "EVEN";//even (1-2, 4-6 ,5-6)

//prelude you crack it 2
global.battle_snail[14, 0] = "B-b-but!";
global.battle_snail[14, 1] = "*whack the shell like you're a baseball player*"; // you crack it end 2
global.battle_snail[14, 2] = "You're fine! *cracks Snail's shell*"; // you crack it end 1
global.battle_snail[14, 3] = "NONE";
global.battle_snail[14, 4] = 2; //Option count, not including zero
global.battle_snail[14 ,5] = "EVEN DUO";//even duo(1-3, 4-6)

//Ending Level
//middle end 
global.battle_snail[15, 0] = "I FEEL CRACKED NOW!";
global.battle_snail[15, 1] = "NONE"; // you crack it end 2
global.battle_snail[15, 2] = "NONE"; // you crack it end 1
global.battle_snail[15, 3] = "NONE";
global.battle_snail[15, 4] = 0; //Option count, not including zero
global.battle_snail[15 ,5] = 5;//no options- end
//you crack it end 1
global.battle_snail[16, 0] = "OW!";
global.battle_snail[16, 1] = "NONE"; // you crack it end 2
global.battle_snail[16, 2] = "NONE"; // you crack it end 1
global.battle_snail[16, 3] = "NONE";
global.battle_snail[16, 4] = 0; //Option count, not including zero
global.battle_snail[16 ,5] = 5//no options- end

//you crack it end 2
global.battle_snail[17, 0] = "I WASN'T READY!";
global.battle_snail[17, 1] = "NONE"; // you crack it end 2
global.battle_snail[17, 2] = "NONE"; // you crack it end 1
global.battle_snail[17, 3] = "NONE";
global.battle_snail[17, 4] = 0; //Option count, not including zero
global.battle_snail[17 ,5] = 5;//no options- end