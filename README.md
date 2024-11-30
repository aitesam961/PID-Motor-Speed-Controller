# PID-Motor-Speed-Controller
This Project Covers the Development of Closed Loop Feedback System based on PID Controller.
The objective is to Control the Motor and Keep the speed constant despite changes in Load.

## ------
The system is designed using MATLAB's control system toolbox and later the results were used for hardware implementation. The system uses a DC motor with Encoder.
MATLAB source files can be imported in simulink.

There are three main parts:

1- Frequency to Voltage Converter: Encoder frequency to voltage (V)
2- Differential amplifier: Subtract input from a preset reference to find error.
3- Output Amplifier: To drive a 12VDC motor through transistor

### File Tree

```
.
├── MATLAB-Source
│   ├── DC_Motor_Output.m
│   ├── DC_Motor_Transfer_Fcn.sid
│   └── TF_Data.txt
├── README.md
├── Results
│   ├── F2V_Gain_Amp.txt
│   ├── Op_AMP_Substractor.log
│   ├── Op_AMP_Substractor.plt
│   └── Op_AMP_Substractor.raw
└── Schematics-LTSPICE
    ├── F2V_Gain_Amp.asc
    ├── F2V_Gain_Amp.pdf
    ├── F2V_Gain_Amp_Plot.pdf
    ├── Op_AMP_Substractor.asc
    ├── Op_AMP_Substractor.net
    ├── Op_AMP_Substractor_Plot.pdf
    ├── Op_AMP_Substractor_SCH.pdf
    └── PID-Cotroller.asc

4 directories, 16 files

```

