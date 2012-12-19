class Quote < Struct.new(:text, :author)
  @@quote_file = "./crackquotes"

  def self.all
    quotes = []
    File.open(@@quote_file) do |file|
      file.read.split("\n%\n").each do |fortune|
        q = Quote.new
        q.text, q.author = fortune.split("  -- ")
        quotes.push q
      end
    end

    return quotes
  end

  def self.random
    return self.all.sample
  end
end
