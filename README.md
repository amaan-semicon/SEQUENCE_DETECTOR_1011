# Sequence Detector: Four Implementation Approaches

A comprehensive Verilog implementation of a sequence detector (1011) using both Mealy and Moore finite state machines, demonstrated through behavioral and structural modeling approaches.

## Overview

This repository contains four different implementations of a sequence detector that identifies the pattern "1011" in a serial input stream:

1. **Behavioral Mealy Machine** - State-based implementation with output dependent on current state and input
2. **Structural Mealy Machine** - Gate-level implementation using D flip-flops and combinational logic
3. **Behavioral Moore Machine** - State-based implementation with output dependent only on current state
4. **Structural Moore Machine** - Gate-level implementation using D flip-flops and combinational logic

## Key Features

- **Multiple Implementation Styles**: Compare behavioral vs structural modeling approaches
- **FSM Comparison**: Understand the differences between Mealy and Moore state machines
- **Comprehensive Testing**: Complete testbench with overlapping sequence detection
- **Educational Value**: Clear code structure with detailed state transitions
- **Synthesis Ready**: All modules are synthesizable for FPGA/ASIC implementation

## Implementation Details

### Mealy Machine Characteristics
- **4 States**: Uses fewer states due to output dependency on both state and input
- **Immediate Response**: Output changes immediately with input transitions
- **Edge Detection**: Detects sequence completion on the same clock cycle

### Moore Machine Characteristics  
- **5 States**: Requires additional state due to output dependency only on current state
- **Stable Output**: Output changes only on state transitions
- **Delayed Response**: Output appears one clock cycle after sequence completion

### Structural vs Behavioral
- **Behavioral**: High-level description using case statements and state encoding
- **Structural**: Low-level implementation using individual flip-flops and Boolean equations

## File Structure

```
├── mealy_machine.v              # Behavioral Mealy implementation
├── mealy_machine_structural.v   # Structural Mealy implementation  
├── moore_machine.v              # Behavioral Moore implementation
├── moore_machine_structural.v   # Structural Moore implementation
├── sequence_detector_tb.v       # Comprehensive testbench
├── state_diagrams/              # State transition diagrams
│   ├── mealy_state_diagram.png
│   └── moore_state_diagram.png
└── README.md                    # This file
```

## Testing

The testbench (`sequence_detector_tb.v`) provides comprehensive verification:

- **Reset Functionality**: Validates proper initialization
- **Sequence Detection**: Tests pattern "1011" detection
- **Overlapping Patterns**: Verifies detection of overlapping sequences
- **All Implementations**: Simultaneous testing of all four approaches
- **Edge Cases**: Comprehensive input stimulus covering various scenarios

### Test Sequence
Input: `1 0 1 1 0 1 1 0 1 0 1 1 0 1 1 1 0 1 1`
Expected detections at positions where "1011" pattern completes.

## Key Differences Summary

| Aspect             |  Mealy         | Moore               |

| States             | 4             | 5                    |
| Output Timing      | Immediate     | Delayed by 1 clock   |
| Output Dependency  | State + Input | State only           |
| Hardware Complexity | Less         | More                 |

## Applications

- **Serial Data Processing**: Pattern recognition in communication protocols
- **Digital Signal Processing**: Sequence detection in data streams  
- **Protocol Analysis**: Frame detection in networking applications
- **Educational Tool**: Understanding FSM design principles

## Getting Started

1. Clone the repository
2. Open in your preferred Verilog simulator (ModelSim, Vivado, etc.)
3. Compile all source files
4. Run the testbench to verify functionality
5. Analyze waveforms to understand timing differences

## Design Considerations

- **Reset Strategy**: Active-low asynchronous reset for reliable initialization
- **Clock Domain**: Single clock domain design for simplicity
- **State Encoding**: Binary encoding for optimal synthesis
- **Default Cases**: Robust error handling for undefined states

## Educational Value

This repository serves as an excellent resource for:
- Understanding FSM design principles
- Comparing Mealy vs Moore implementations
- Learning behavioral vs structural modeling
- Analyzing timing relationships in digital systems
- Studying overlapping pattern detection algorithms

## Contributing

Feel free to contribute improvements, additional test cases, or documentation enhancements through pull requests.

