# Elevator-Control-Design
A fully functional 3 floor elevator control logic with door and motor control functions.


This project implements a finite state machine (FSM) based **Elevator Control System** in **Verilog HDL**. The system is designed to manage an elevator servicing multiple floors efficiently, handling requests, direction control, and door operations, with an emphasis on **hardware optimization and simulation accuracy**.

---

##  Features

- Supports customizable number of floors
- FSM-based control logic for:
  - Floor selection
  - Movement direction (up/down)
  - Door opening/closing
  - Idle state when no requests
- Priority handling for current direction requests
- Verilog testbench for validation
- Simulated and verified with waveform analysis

---

##  FSM Design

The elevator FSM includes states such as:

- **Idle**: Waiting for a request
- **Moving Up / Moving Down**: Elevator in motion
- **Door Open / Close**: Handles entry/exit
- **Stop at Floor**: Temporarily stops to serve a request
- **Check**: Further checks if any other floor is been requested

### FSM State Diagram

<img width="552" height="710" alt="Image" src="https://github.com/user-attachments/assets/20d7890c-5c6e-4d2c-88da-e7e59f3153fe" />
<img width="480" height="693" alt="Image" src="https://github.com/user-attachments/assets/bd7c5033-3e7c-4760-8e83-9b808b825e35" />


