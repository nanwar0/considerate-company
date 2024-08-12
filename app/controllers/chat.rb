require "openai"

pp "howdy"

client = OpenAI::Client.new(:api_key => ENV.fetch("OPENAI_API_KEY"))

response = client.completions.create(
   model: "gpt-3.5-turbo-instruct", 
   messages: [
     {:role => "system", :content => "You are a helpful assistant."},
     {:role => "user", :content => "Recommend four restaurants in Chicago."},
   ]
 
)

next_message = raw_response.fetch("choices").at(0).fetch("message").fetch("content")
pp next_message
