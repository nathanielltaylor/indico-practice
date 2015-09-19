require 'indico'
require_relative 'secrets'
Indico.api_key = $API_KEY

def desc_sort
  sort_by{|key, value| value}.reverse
end

puts Indico.sentiment_hq("today is a good day")

sentiments = [
    "today is a great day",
    "today is a good day",
    "today is an ok day",
    "today is a mediocre day",
    "today is a bad day"
]

sentiments.each do |s|
  puts Indico.sentiment(s)
end

pope = "Days after the election of Pope Francis, word reached the Vatican press office that the new pontiff was unexpectedly celebrating morning Mass. Other popes had presided over morning services, too, but as the world (and the Vatican press office) would soon realize, Francis did things his own way.
This Mass was offered in the small chapel of the Vatican guesthouse where Francis had chosen to live — not, as in years past, at the ornate Apostolic Palace. His audience was not the cardinals of the Roman Curia, but gardeners, janitors and Vatican office workers. And Francis was not merely presiding, as had Pope John Paul II. He was preaching, without notes, as if he were a simple parish priest.
If one with a big message.
The church asks all of us to change certain things, Francis said during one of his morning homilies, as he invoked a Scripture reading from St. Paul. “She asks us to let go of decadent structures — they are useless."
puts Indico.text_tags(pope, {top_n: 5, relative: true}).instance_eval { desc_sort }


str = "Según estudios realizados, todos los días, cerca de 5.000 niños entre las edades de 13 y 17 años comienzan a fumar"
puts Indico.language(str).instance_eval { desc_sort }

trump = "We need to get serious about prosecuting violent criminals.
The Obama administration’s record on that is abysmal.
Violent crime in cities like Baltimore, Chicago and many others is out of control.
Drug dealers and gang members are given a slap on the wrist and turned loose on the street.
This needs to stop."
sanders = "Today, we live in the richest country in the history of the world, but that reality means little because much of that wealth is controlled by a tiny handful of individuals.
The issue of wealth and income inequality is the great moral issue of our time, it is the great economic issue of our time, and it is the great political issue of our time."
race = "We must pursue policies that transform this country into a nation that affirms the value of its people of color.
That starts with addressing the four central types of violence waged against black and brown Americans: physical, political, legal and economic."

puts Indico.keywords(pope)
puts Indico.political(pope)
puts Indico.keywords(trump)
puts Indico.political(trump)
puts Indico.keywords(sanders)
puts Indico.political(sanders)
puts Indico.political(race)
puts Indico.named_entities(trump)

puts Indico.twitter_engagement(["hello everyone",
"10 easy tricks to save your family right now!!!",
"violence",
"RT if you are a good person",
"RT if you believe in god",
"you won't BELIEVE what happened next"])
