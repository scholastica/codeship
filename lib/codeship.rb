require "codeship/version"
require "codeship/config"
require "codeship/token"

module Codeship
  class Error < StandardError; end

  def self.token
    Token.get
  end

end
