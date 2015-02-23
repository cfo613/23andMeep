require_relative './lib/connection'
require_relative './lib/heros'
require_relative './lib/options'
require_relative './lib/questions'
require_relative './lib/responses'
require_relative './lib/users'


#create survey questions
Question.create({
  question: "Which photo appeals to you the most?"
});
Question.create({
  question: "How do you like to give back to society?"
});
Question.create({
  question: "Which color appeals to you the most?"
});
Question.create({
  question: "Which attribute would you value most in a sidekick?"
});

#create question options
Option.create({
  optiona: "http://i.dailymail.co.uk/i/pix/2012/05/19/article-0-132A2515000005DC-170_634x444.jpg",
  optionb: "http://i.imgur.com/CWCVnP1.png",
  optionc: "http://3.bp.blogspot.com/-Pqlp0SvORhE/U3HR-tlChrI/AAAAAAAAHHQ/V_veUN0WJnE/s1600/Teacup-Pigs-geart.jpg",
  optiond: "http://img2-2.timeinc.net/people/i/2010/pets/migration/001965100.jpg",
  question_id: 1
});
Option.create({
  optiona: "Building homes via Habitat for Humanity",
  optionb: "Volunteering at the local soup kitchen",
  optionc: "Making people laugh",
  optiond: "Helping others navigate a tough situation",
  question_id: 2
});
Option.create({
  optiona: "blue",
  optionb: "red",
  optionc: "yellow",
  optiond: "black",
  question_id: 3
});
Option.create({
  optiona: "grit",
  optionb: "quirkiness",
  optionc: "strength",
  optiond: "looks",
  question_id: 4
});

#create super hero profiles
Hero.create({
  name: "Hipster Hero",
  gender: "female",
  description: "Not your typical Brooklyn hipster. While she upholds all hipster values (progressive political views, thrift store / vintage clothing, artisanal cheeses, etc.), she also has a secret - the power of telepathy! This Hipster Hero mostly uses her powers for good - anticipating anti-feminist behavior, racially-motivated police brutality, and people who aren't planning to recycle their water bottle - she occasionally uses the power to read people's thoughts and determine whether or not to secretly hate or admire them. What? She's a hero - not a saint!",
  costume: "Eco-friendly recycled cotton with alpaca fringe (vintage, of course).",
  energy_source: "Organic juices and locally grown produce"
});

Hero.create({
  name: "Hipster Hero",
  gender: "male",
  description: "Not your typical Brooklyn hipster. While he upholds all hipster values (progressive political views, thrift store / vintage clothing, artisanal cheeses, etc.), he also has a secret - the power of telepathy! This Hipster Hero mostly uses his powers for good - anticipating anti-feminist behavior, racially-motivated police brutality, and people who aren't planning to recycle their water bottle - he occasionally uses the power to read people's thoughts and determine whether or not to secretly hate or admire them. What? He's a hero - not a saint!",
  costume: "Eco-friendly recycled cotton with alpaca fringe (vintage, of course).",
  energy_source: "Organic juices and locally grown produce"
});

Hero.create({
  name: "Shutdown Savior",
  gender: "female",
  description: "This smart-a** is not only quick-witted, but also possesses the power of lightning speed. Both come in handy when you need to disarm the a-hole spewing nonsense on the subway / bus / some other crowded place. She has been known to render jerks speechless with only one line. While sometimes found in the stand-up joints using her power to make a quick buck, she mostly uses her powers to keep the citizens of NYC sane.",
  costume: "Jeans and t-shirt - what were you expecting her to dress up?",
  energy_source: "Black coffee...but sometimes something stronger..."
});

Hero.create({
  name: "Shutdown Savior",
  gender: "male",
  description: "This smart-a** is not only quick-witted, but also possesses the power of lightning speed. Both come in handy when you need to disarm the a-hole spewing nonsense on the subway / bus / some other crowded place. He has been known to render jerks speechless with only one line. While sometimes found in the stand-up joints using his power to make a quick buck, he mostly uses his powers to keep the citizens of NYC sane.",
  costume: "Jeans and t-shirt - what were you expecting him to dress up?",
  energy_source: "Black coffee...but sometimes something stronger..."
});

Hero.create({
  name: "Charitable Champion",
  gender: "female",
  description: "This saint-like hero is truly kind to the core. Always willing to offer a seat, help an old lady cross the street, or buy a homeless person a hot meal - her kindness knows no bounds. On top of that, she has super healing powers...Wha??!? We're not going to say these powers also come in handy when you have a wicked hangover, but they might. When her friends are not abusing her power to recover from the previous night, she can often be found helping those who actually deserve it.",
  costume: "White robe, rope belt, sandals",
  energy_source: "Making other people smile."
});

Hero.create({
  name: "Charitable Champion",
  gender: "male",
  description: "This saint-like hero is truly kind to the core. Always willing to offer a seat, help an old lady cross the street, or buy a homeless person a hot meal - his kindness knows no bounds. On top of that, he has super healing powers...Wha??!? We're not going to say these powers also come in handy when you have a wicked hangover, but...they might. When his friends are not abusing his power to recover from the previous night, he can often be found helping those who actually deserve it.",
  costume: "White robe, rope belt, sandals.",
  energy_source: "Making other people smile."
});


Hero.create({
  name: "Pioneer Paladin",
  gender: "female",
  description: "With her sense of direction, you may think she's half human / half homing pigeon. Not only that, but she has the super secret power of flight! With that power, you wouldn't think she knows the subway system like the back of her hand...but she does! Always a good pal to have around when you find yourself downtown, off the grid, without the slightest clue where you are...and your cellphone just died. Plus, she'll never charge you surge pricing - suck on that Uber.",
  costume: "She may wear tights under her clothes...although is not yet comfortable wearing them in public.",
  energy_source: "Like any good pigeon...really enjoys some nice wholesome grains. Maybe some berries to mix it up once in awhile."
});

Hero.create({
  name: "Pioneer Paladin",
  gender: "male",
  description: "With his sense of direction, you may think he's half human / half homing pigeon. Not only that, but he has the super secret power of flight! With that power, you wouldn't think he knows the subway system like the back of his hand...but he does! Always a good pal to have around when you find yourself downtown, off the grid, without the slightest clue where you are...and your cellphone just died. Plus, he'll never charge you surge pricing - suck on that Uber.",
  costume: "He may wear tights under his clothes...although is not yet comfortable wearing them in public.",
  energy_source: "Like any good pigeon...really enjoys some nice wholesome grains. Maybe some berries to mix it up once in awhile."
});
