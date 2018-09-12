class WordValidator
  def initialize(word)
    @word = word
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/entries/en/#{@word}") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find_word 
    headers = {'app_id' => ENV['OED_APP_ID'], 'api_key' => ENV['OED_API_KEY']}
    response = @conn.get do |request|
      request.headers = headers
    end
    JSON.parse(response.body, headers: true)
    
    binding.pry
    
  end


end