require "digest"

class Quote < Struct.new(:text, :author)
  @@quote_file = "./crackquotes"

  def id
    Digest::SHA256.hexdigest self.text
  end

  def self.max
    return Quote.all.count
  end

  def self.all
    quotes = {}
    File.open(@@quote_file) do |file|
      file.read.split("\n%\n").each do |fortune|
        q = Quote.new
        q.text, q.author = fortune.split("  -- ")
        quotes[q.id] = q
      end
    end

    return quotes
  end

  def self.get id
    return self.all[id]
  end

  def self.random
    self.all.keys.sample
  end
end
