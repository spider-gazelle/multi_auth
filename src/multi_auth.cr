require "./multi_auth/*"

module MultiAuth
  {% begin %}
    VERSION = {{ `shards version "#{__DIR__}"`.chomp.stringify.downcase }}
  {% end %}

  @@configuration = Hash(String, Tuple(String, String)).new

  def self.make(provider : String, redirect_uri : String)
    MultiAuth::Engine.new(provider, redirect_uri)
  end

  def self.configuration
    @@configuration
  end

  def self.config(provider : String, key : String, secret : String)
    @@configuration[provider] = {key, secret}
  end
end
