require "digest"

class Quote < Struct.new(:text, :author)
  @@quote_file = "./crackquotes"

  def id
    Digest::SHA256.hexdigest text
  end

  def self.max
    Quote.all.count
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

    quotes
  end

  def self.get(id)
    all[id]
  end

  def self.random
    all.keys.sample
  end
end
