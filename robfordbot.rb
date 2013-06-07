require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "RobFordBot"
channel = "#bitmaker"
greeting_prefix = "PRIVMSG #bitmaker :"
greetings = ["who the hell are you?"]
bike_lanes = ["bike", "bikes", "lane", "lanes"]
bike_prefix = "PRIVMSG #bitmaker :"

crack_e = ["crack", "drugs", "drug"]
crack_prefix = "PRIVMSG #bitmaker :"

asian_e = ["asians", "asian", "oriental", "Oriental", "Chinese", "chinese", "dogs", "work", "racist", "racism"]
asian_prefix = "PRIVMSG #bitmaker :"

weasel_e = ["weasel", "animal", "shut up", "hodor", "snake", "zoo", "spite", "asshole", "stfu", "fuck you", "you suck"]
weasel_prefix = "PRIVMSG #bitmaker :"

random_e = ["what's up?", "how are you?", "bot", "hey", "advice", "rob ford", "ford", "rob", "fatass", "lynching", "toronto", "Toronto"]
random_prefix = "PRIVMSG #bitmaker :"


# opens a new socket with the correct port and server
s = TCPSocket.open(server, port)

# print("addr: ", s.addr.join(":"), "\n")
# print("peer: ", s.peeraddr.join(":"), "\n")

s.puts "USER robfordbot 0 * HelloRobFordBot"
s.puts "NICK #{nick}"
s.puts "JOIN #{channel}"
s.puts "PRIVMSG #{channel} : What would you like to ask Rob Ford?"

until s.eof? do
  msg = s.gets
  puts msg

  wasGreeted = false
  greetings.each do |greeting|
    if msg.include? greeting
      wasGreeted = true
      puts "The greeting was recognized."
    end
  end

  if msg.include? greeting_prefix and wasGreeted
    puts "About to send out a message!"
    response = "What would you like to ask your mayor?"
    s.puts "PRIVMSG #{channel} :#{response}"
  end



  wasAskedAboutBikes = false
  bike_lanes.each do |bikes|
    if msg.include? bikes
      wasAskedAboutBikes = true
      puts "The question was recognized."
    end
  end

  if msg.include? bike_prefix and wasAskedAboutBikes
    puts "About to send out a message!"
    bike = "I can't support bikes. Roads are built for buses, cars, and trucks. Not for people on bikes. And my heart bleeds for them when I hear someone gets killed, but it's their own fault."
    s.puts "PRIVMSG #{channel} :#{bike}"
  end



  wasCracked = false
  crack_e.each do |crack|
    if msg.include? crack
      wasCracked = true
      puts "The crack was recognized."
    end
  end

  if msg.include? crack_prefix and wasCracked
    puts "About to send out a message!"
    cracks = "Rob Ford does not do drugs! Rob Ford ANGRY! Rob Ford smash!"
    s.puts "PRIVMSG #{channel} :#{cracks}"
  end

  wasAsian = false
  asian_e.each do |asian|
    if msg.include? asian
      wasAsian = true
      puts "The asian was recognized."
    end
  end

  if msg.include? asian_prefix and wasAsian
    puts "About to send out a message!"
    asians = "Those Oriental people work like dogs. They're slowly taking over."
    s.puts "PRIVMSG #{channel} :#{asians}"
  end

  wasWeaseled = false
  weasel_e.each do |weasel|
    if msg.include? weasel
      wasWeaseled = true
      puts "The Weasel was recognized."
    end
  end

  if msg.include? weasel_prefix and wasWeaseled
    puts "About to send out a message!"
    weasels = "Youre a weasel and weasels belong in the zoo! You did this out of spite."
    s.puts "PRIVMSG #{channel} :#{weasels}"
  end

  wasRandomed = false
  random_e.each do |random|
    if msg.include? random
      wasRandomed = true
      puts "The random was recognized."
    end
  end

  if msg.include? random_prefix and wasRandomed
    puts "About to random out a message!"
    randoms = ["Ill try buddy, Ill try... I dont know this shit, but Ill fucking try to find it .", "What does OxyCotin go for on the street, so I have no idea?", "Giving the mayor more power is like giving criminals free guns.", "This is an insult to my constituents to even think about having a shelter in my ward!"]
    s.puts "PRIVMSG #{channel} :#{randoms.sample}"
  end


end
