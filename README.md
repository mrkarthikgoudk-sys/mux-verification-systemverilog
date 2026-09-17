# 2:1 Multiplexer Verification Using SystemVerilog

## Project Description

This project demonstrates the design and verification of a 2:1 Multiplexer using SystemVerilog.

The multiplexer is implemented as the Design Under Test (DUT), and a self-checking SystemVerilog testbench is used to generate input stimulus, monitor the DUT output, compare the actual output with the expected output, and report PASS or FAIL for each test case.

The design and verification were simulated using EDA Playground.

## DUT Functionality

The 2:1 Multiplexer has three inputs and one output:

- `a` - Input A
- `b` - Input B
- `sel` - Select signal
- `y` - Output

The multiplexer operates as follows:

- When `sel = 0`, output `y = a`
- When `sel = 1`, output `y = b`

The functionality can also be represented as:

```systemverilog
if (sel == 1'b0)
    y = a;
else
    y = b;
```

## Project Structure

```text
mux-verification-systemverilog/
├── mux.sv
├── mux_tb.sv
└── README.md
```

- `mux.sv` contains the 2:1 Multiplexer DUT.
- `mux_tb.sv` contains the SystemVerilog self-checking testbench.
- `README.md` contains the project documentation.

## Verification Approach

The SystemVerilog testbench performs the following steps:

1. Instantiates the 2:1 Multiplexer DUT.
2. Generates stimulus for inputs `a`, `b`, and `sel`.
3. Applies each test case to the DUT.
4. Waits for the DUT output to update.
5. Compares the actual output `y` with `expected_y`.
6. Displays PASS if the output matches the expected value.
7. Displays FAIL if the output does not match the expected value.
8. Generates a VCD waveform file for waveform analysis in EPWave.

Since the multiplexer is a combinational circuit, no clock or reset is required.

## Test Scenarios

| Test Case | Input A | Input B | Select | Expected Output |
|-----------|---------|---------|--------|-----------------|
| 1 | 0 | 0 | 0 | 0 |
| 2 | 1 | 0 | 0 | 1 |
| 3 | 0 | 1 | 1 | 1 |
| 4 | 1 | 1 | 1 | 1 |

## Simulation Results

The simulation produced the following verification results:

```text
Time: 10000 a=0 b=0 sel=0 y=0 expected=0 PASS
Time: 20000 a=1 b=0 sel=0 y=1 expected=1 PASS
Time: 30000 a=0 b=1 sel=1 y=1 expected=1 PASS
Time: 40000 a=1 b=1 sel=1 y=1 expected=1 PASS
```

All four required test cases passed successfully.

## Waveform Verification

The waveform was generated using a VCD file and viewed using EPWave.

The waveform contains:

- `a`
- `b`
- `sel`
- `y`
- `expected_y`

The waveform verifies that:

- When `sel = 0`, `y` follows input `a`.
- When `sel = 1`, `y` follows input `b`.

## EDA Playground

Simulation:

https://www.edaplayground.com/x/83F_

EPWave waveform:

https://www.edaplayground.com/w/x/A3r

## Tools Used

- SystemVerilog
- EDA Playground
- EPWave
- GitHub

## Learning Outcomes

Through this project, I learned:

- How a DUT is instantiated in a SystemVerilog testbench.
- How stimulus is generated and applied to a DUT.
- How DUT outputs are monitored.
- How actual and expected outputs are compared.
- How PASS/FAIL results are generated automatically.
- How simulation waveforms are analyzed.
- How SystemVerilog project files are maintained in a GitHub repository.
