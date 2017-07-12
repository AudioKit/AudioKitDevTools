#!/usr/bin/env ruby

require 'erb'
require 'active_support/all'

nodes = [
"smoothDelay",
"variableDelay",
"bitcrush",
"clip",
"distort",
"autoWah",
"dcBlock",
"highPassButterworthFilter",
"highPassFilter",
"korgLowPassFilter",
"lowPassButterworthFilter",
"lowPassFilter",
"modalResonanceFilter",
"moogLadderFilter",
"resonantFilter",
"stringResonator",
"threePoleLowPassFilter",
"reverberateWithChowning",
"reverberateWithCombFilter",
"reverberateWithCostello",
"reverberateWithFlatFrequencyResponse"
]

node = ""

nodes.each do |n|
    node = n
    File.open("templates/AKEffectOperationTests.swift.erb") { |template|
        erb = ERB.new( template.read, nil, '-' )
        File.open("output/#{node}Tests.swift", 'w+') {|f| f.write(erb.result) }
        puts erb.result
    }
end
