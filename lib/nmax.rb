require "nmax/version"
require 'set'

module Nmax

  def self.perform(numbers, stream = $stdin) 
    raise "You can't run this from tty" if stream.tty?
    nmax_array = []

    while line = stream.gets
      ints = line.scrub!.scan(/\d+/i).map(&:to_i)
      nmax_array << ints unless ints.empty?
    end
    nmax_array.flatten.max(numbers)
  end
end
