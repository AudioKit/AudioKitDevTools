#!/bin/bash
# ./bin/generate_au_swift.rb interfaces/Filters/AUBandPassFilter.swift     > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/AKBandPassFilter.swift
# ./bin/generate_au_swift.rb interfaces/Filters/AUHighPassFilter.swift     > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/AKHighPassFilter.swift
# ./bin/generate_au_swift.rb interfaces/Filters/AUHighShelfFilter.swift    > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/AKHighShelfFilter.swift
# ./bin/generate_au_swift.rb interfaces/Filters/AULowPassFilter.swift      > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/AKLowPassFilter.swift
# ./bin/generate_au_swift.rb interfaces/Filters/AULowShelfFilter.swift     > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/AKLowShelfFilter.swift
# ./bin/generate_au_swift.rb interfaces/Filters/AUParametricEQ.swift       > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/AKParametricEQ.swift
# ./bin/generate_au_swift.rb interfaces/Dynamics/AUDynamicsProcessor.swift > ../AudioKit/Sources/AudioKit/Nodes/Effects/Dynamics/AKDynamicsProcessor.swift
# ./bin/generate_au_swift.rb interfaces/Dynamics/AUPeakLimiter.swift       > ../AudioKit/Sources/AudioKit/Nodes/Effects/Dynamics/AKPeakLimiter.swift

./bin/generate_au_swift.rb interfaces/Distortion/AUDecimator.swift       > ../AudioKit/Sources/AudioKit/Nodes/Effects/Distortion/AKDecimator.swift
./bin/generate_au_swift.rb interfaces/Distortion/AURingModulator.swift   > ../AudioKit/Sources/AudioKit/Nodes/Effects/Distortion/AKRingModulator.swift
./bin/generate_au_swift.rb interfaces/Distortion/AUDistortion.swift      > ../AudioKit/Sources/AudioKit/Nodes/Effects/Distortion/AKDistortion.swift