$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])

SimpleCov.start do
  SimpleCov.add_filter 'test'
  SimpleCov.add_filter 'bin'
  SimpleCov.add_filter 'config'
end

require 'passr'
require 'passr/encryptor'
require 'passr/generator'
require 'minitest/autorun'
