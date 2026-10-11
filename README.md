# PID Motor Speed Controller

An experimental closed-loop speed controller for a DC motor with an encoder. The goal is to maintain motor speed as the load changes, using MATLAB modeling and LTspice circuit simulations to support the hardware design.

## Control approach

The original design describes three circuit stages:

1. **Frequency-to-voltage conversion:** converts the encoder signal into a voltage representing speed.
2. **Error calculation:** a differential amplifier compares the feedback voltage with a reference.
3. **Motor drive:** an output amplifier drives a 12 V DC motor through a transistor.

Although the project title refers to PID control, the saved MATLAB results document a **PI controller**, with `Kp = 8.86` and `Ki = 221`.

## Repository guide

| Location | Contents |
| --- | --- |
| [MATLAB-Source](MATLAB-Source/) | Motor measurement script, saved identification session, and transfer-function results |
| [Schematics-LTSPICE](Schematics-LTSPICE/) | Frequency-to-voltage, subtractor, and controller schematics; PDF schematic and plot exports |
| [Results](Results/) | Saved simulation data, plot settings, and logs |

## Explore the MATLAB model

Use MATLAB with Control System Toolbox for the following example, reconstructed from [TF_Data.txt](MATLAB-Source/TF_Data.txt):

```matlab
motor = tf([5.709 0.4738], [1 13.12 2]);
controller = pid(8.86, 221); % PI controller: derivative gain is zero
step(motor);
grid on;
```

The saved identification session, [DC_Motor_Transfer_Fcn.sid](MATLAB-Source/DC_Motor_Transfer_Fcn.sid), is for the System Identification app and requires System Identification Toolbox.

[DC_Motor_Output.m](MATLAB-Source/DC_Motor_Output.m) plots the recorded `Vin` and `Vout` values, but its final `step(tf1)` call references an undefined variable. The script also begins with `clear all`, so defining `tf1` before running it will not fix that call. To explore the saved model without editing the script, use the example above separately; to run the entire script, define `tf1` after its clearing statements and before `step(tf1)`.

## Explore the circuit simulations

Open these schematics in LTspice:

- [F2V_Gain_Amp.asc](Schematics-LTSPICE/F2V_Gain_Amp.asc): frequency-to-voltage gain stage.
- [Op_AMP_Substractor.asc](Schematics-LTSPICE/Op_AMP_Substractor.asc): error amplifier.
- [PID-Cotroller.asc](Schematics-LTSPICE/PID-Cotroller.asc): controller circuit; the filename retains its original spelling.

Review the sources and simulation directives before running. The checked-in schematics contain commented `;tran 100` text, so configure an active analysis command for the experiment you want to reproduce. The PDF exports in the same folder provide a quick way to inspect the original circuits and plots.

## Project scope

The repository provides modeling and circuit-design artifacts. It does not include a complete assembly guide, firmware, or an automated validation suite. The saved controller gains describe the recorded model; the repository does not establish their performance for other motors or loads.

## Contributing

For simulation changes, include the model, stimulus, tool version, and before/after plots. For hardware results, describe the motor, encoder, supply, and load used.

## License

GNU General Public License v3.0. See [LICENSE.txt](LICENSE.txt) for the license text.
