// Parameters for the AUDistortion unit

// Global, Hertz, 0.5 -> 8000, 100, 3
public var kDistortionParam_RingModFreq1: AudioUnitParameterID { get }
// Global, Hertz, 0.5 -> 8000, 100, 4
public var kDistortionParam_RingModFreq2: AudioUnitParameterID { get }
// Global, Percent, 0 -> 100, 50, 5
public var kDistortionParam_RingModBalance: AudioUnitParameterID { get }
// Global, Percent, 0 -> 100, 50, 15
public var kDistortionParam_FinalMix: AudioUnitParameterID { get }
