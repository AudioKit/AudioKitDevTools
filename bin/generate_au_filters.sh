#!/bin/bash
./bin/generate_au_swift.rb interfaces/Filters/AUBandPassFilter.swift     > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/BandPassFilter.swift
./bin/generate_au_swift.rb interfaces/Filters/AUHighPassFilter.swift     > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/HighPassFilter.swift
./bin/generate_au_swift.rb interfaces/Filters/AUHighShelfFilter.swift    > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/HighShelfFilter.swift
./bin/generate_au_swift.rb interfaces/Filters/AULowPassFilter.swift      > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/LowPassFilter.swift
./bin/generate_au_swift.rb interfaces/Filters/AULowShelfFilter.swift     > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/LowShelfFilter.swift
./bin/generate_au_swift.rb interfaces/Filters/AUParametricEQ.swift       > ../AudioKit/Sources/AudioKit/Nodes/Effects/Filters/ParametricEQ.swift
./bin/generate_au_swift.rb interfaces/Dynamics/AUDynamicsProcessor.swift > ../AudioKit/Sources/AudioKit/Nodes/Effects/Dynamics/DynamicsProcessor.swift
./bin/generate_au_swift.rb interfaces/Dynamics/AUPeakLimiter.swift       > ../AudioKit/Sources/AudioKit/Nodes/Effects/Dynamics/PeakLimiter.swift
./bin/generate_au_swift.rb interfaces/Distortion/AUDecimator.swift       > ../AudioKit/Sources/AudioKit/Nodes/Effects/Distortion/Decimator.swift
./bin/generate_au_swift.rb interfaces/Distortion/AURingModulator.swift   > ../AudioKit/Sources/AudioKit/Nodes/Effects/Distortion/RingModulator.swift
./bin/generate_au_swift.rb interfaces/Distortion/AUDistortion.swift      > ../AudioKit/Sources/AudioKit/Nodes/Effects/Distortion/Distortion.swift