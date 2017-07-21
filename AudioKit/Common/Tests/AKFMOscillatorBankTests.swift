//
//  AKFMOscillatorBankTests.swift
//  AudioKitTestSuiteTests
//
//  Created by Aurelius Prochazka on 7/21/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//

import AudioKit
import XCTest

class AKFMOscillatorBankTests: AKTestCase {
    
    var input: AKFMOscillatorBank!

    override func setUp() {
        super.setUp()
        // Need to have a longer test duration to allow for envelope to progress
        duration = 1.0

        afterStart = {
            self.input.play(noteNumber: 60, velocity: 120)
            self.input.play(noteNumber: 64, velocity: 110)
            self.input.play(noteNumber: 67, velocity: 100)
        }
    }

    func testDefault() {
        input = AKFMOscillatorBank()
        output = input
        AKTestMD5("c6512da384e4c6e5666b33508b7ac703")
    }

    func testParameters() {
        input = AKFMOscillatorBank(waveform: AKTable(.square),
                                   carrierMultiplier: 1.1,
                                   modulatingMultiplier: 1.2,
                                   modulationIndex:  1.3,
                                   attackDuration: 0.123,
                                   decayDuration: 0.234,
                                   sustainLevel: 0.345,
                                   detuningOffset: 1,
                                   detuningMultiplier: 1.1)
        output = input
        AKTestMD5("32f8bc76e7aed877dbca785aa299a4af")
    }

    func testWaveform() {
        input = AKFMOscillatorBank(waveform: AKTable(.square))
        output = input
        AKTestMD5("78ca214908b919242aec85df8a84c615")
    }

    func testCarrierMultiplier() {
        input = AKFMOscillatorBank(waveform: AKTable(.square), carrierMultiplier: 1.1)
        output = input
        AKTestMD5("51c7856d579d781a815397545bae4eef")
    }

    func testModulatingMultiplier() {
        input = AKFMOscillatorBank(waveform: AKTable(.square), modulatingMultiplier: 1.2)
        output = input
        AKTestMD5("2c177c989884f299440e57fd1fb15ddc")
    }

    func testModulationIndex() {
        input = AKFMOscillatorBank(waveform: AKTable(.square), modulationIndex:  1.3)
        output = input
        AKTestMD5("341fc9150e43200ff38c2e779776d57c")
    }

    func testAttackDuration() {
        input = AKFMOscillatorBank(waveform: AKTable(.square), attackDuration: 0.123)
        output = input
        AKTestMD5("0c7a25ba45d8d92252636ae0aadf9e34")
    }

    func testDecayDuration() {
        input = AKFMOscillatorBank(waveform: AKTable(.square), decayDuration: 0.234)
        output = input
        AKTestMD5("1ced7e6a3c241852d872774784688aa7")
    }

    func testSustainLevel() {
        input = AKFMOscillatorBank(waveform: AKTable(.square), sustainLevel: 0.345)
        output = input
        AKTestMD5("762395c5b02e2885b02b37171ebd0acf")
    }

    func testDetuningOffset() {
        input = AKFMOscillatorBank(waveform: AKTable(.square), detuningOffset: 1)
        output = input
        AKTestMD5("034579f3dcd2f1a523d66c12dc034637")
    }

    func testDetuningMultiplier() {
        input = AKFMOscillatorBank(waveform: AKTable(.square), detuningMultiplier: 1.1)
        output = input
        AKTestMD5("bb0b0f92c108de7b02581508aa735624")
    }
}
