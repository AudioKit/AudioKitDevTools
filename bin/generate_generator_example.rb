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

def new_partial(name)
	ERB.new(File.new("templates/Partials/_#{name}.erb").read, nil, '-' ).result
end

def ak_pad(var)
	length = ($longest_ak_variable.length - var.length).abs
	length = length - 2 if var == "input"
	" " * length
end

def wrap(str, indent="")
	str.gsub("\n", "\n" + indent + "/// " )
end

def upper(str)
	return str[0].upcase + str[1..-1]
end

def firstLower(str)
    return str[0].downcase + str[1..-1]
end

################
# YAML Parsing #
################
opcode_yaml = ARGV[0]
o = YAML::load(File.open("#{opcode_yaml}"))

output_folder       = o["swift-directory"]
sp_module           = o["sp-module"]
node                = o["node"]
four_letter_code    = o["four-letter-code"]
one_word_desc       = o["one-word-description"]
description         = wrap(o["description"])
summary             = o["summary"]
inputs	            = o["inputs"].to_a
inputCount          = o["inputCount"]
tables              = o["tables"].to_a
tableArray = ""
c_functions         = o["c-functions"]
post_setup          = o["post-setup"]
parameters          = o["parameters"].to_a
constants           = o["constants"].to_a
constant_parameters = o["constant-parameters"].to_a
presets             = o["presets"].to_a
type                = o["type"]

############################
# Set Up Helpful Variables #
############################

four_letter_hex = four_letter_code.unpack('U'*four_letter_code.length).collect {|x| x.to_s 16}.join

input_count  = o["input-count"].to_i
input_count  = inputs.count 	if input_count == 0
output_count = [o["output-count"].to_i, 1].max
# puts "input count  = " + input_count.to_s
# puts "output count = " + output_count.to_s

$longest_ak_variable = ""
$longest_parameter = ""
(inputs+parameters+constants).each do |p|
	p.each do  |sp_var, data|
		if sp_var.length > $longest_parameter.length
			$longest_parameter = sp_var
		end
		if data["ak-variable"].length > $longest_ak_variable.length
			$longest_ak_variable = data["ak-variable"]
		end
	end
end

au_type = "Generator"
if input_count > 0 then
	au_type = "Effect"
end

###############
# File Output #
###############

# Set up the output folder relative to the current directory and create it if necessary
output_folder = "../AudioKitExample/Examples/Examples/Views/"

################
# OscillatorExample.swift #
################
audio_unit_setup_partial = new_partial("audio_unit_setup")
parameters_partial       = new_partial("parameters")
internal_au_partial      = new_partial("internal_au")

File.open("templates/Example.swift.erb") { |template|
	erb = ERB.new( template.read, nil, '-' )
	# File.open("#{output_folder}/#{node}.swift", 'w+') {|f| f.write(erb.result) }
}

################
# AKNodeDSP.mm #
################

# File.open("templates/AKNodeDSP.mm.erb") { |template|
# 	erb = ERB.new( template.read, nil, '-' )
# 	File.open("#{output_folder}/#{node}DSP.mm", 'w+') {|f| f.write(erb.result) }
# 	# puts erb.result
# }

