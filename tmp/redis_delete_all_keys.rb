#!/usr/bin/env ruby

$: << File.dirname(__FILE__) + '/../lib' unless $:.include?(File.dirname(__FILE__) + '/../lib/')

require 'redis'

@persistence = Redis.new(:db => 0)
keys = @persistence.keys '*'
@persistence.del(*keys)
