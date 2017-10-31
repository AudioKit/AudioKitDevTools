#!/usr/bin/env ruby

require 'erb'
require 'yaml'
require 'pp'
require 'active_support/all'
require 'action_view'
require 'fileutils'

####################
# Helper Functions #
####################

def upper(str)
    return str[0].upcase + str[1..-1]
end

################
# YAML Parsing #
################
opcode_yaml = ARGV[0]
o = YAML::load(File.open("#{opcode_yaml}"))

output_folder       = o["installation-directory"]
sp_module           = o["sp-module"]
node                = o["node"]
four_letter_code    = o["four-letter-code"]
one_word_desc       = o["one-word-description"]
summary             = o["summary"]
inputs              = o["inputs"].to_a
tables              = o["tables"].to_a
parameters          = o["parameters"].to_a
constants           = o["constants"].to_a
constant_parameters = o["constant-parameters"].to_a
presets             = o["presets"].to_a
type                = o["type"]


File.open("templates/AKTests.swift.erb") { |template|
    erb = ERB.new( template.read, nil, '-' )
    puts erb.result
}

