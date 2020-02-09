require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(song_name)
      self.all.find{|song| song.name == song_name}
    end
    def find_or_create_by_name(song_name)
      song= self.find_by_name(song_name)
      if !song
        song= self.create(song_name)
      end
      song
    end
  end
end
require_relative '../lib/concerns/my_module.rb'
require_all 'lib'
