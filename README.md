# Elevator-Control-Design
A fully functional 3 floor elevator control logic with door and motor control functions.


This project implements a finite state machine (FSM) based **Elevator Control System** in **Verilog HDL**. The system is designed to manage an elevator servicing multiple floors efficiently, handling requests, direction control, and door operations, with an emphasis on **hardware optimization and simulation accuracy**.

---

##  Features

- Supports customizable number of floors
- FSM-based control logic with inputs and outputs as:
  - Floor selection from both inside and outside elevator.
  - Movement direction (up/down) using motor control.
  - Door opening/closing using door control.
  - Going to **Idle** when no request.
- Verilog testbench for validation.
- Simulated results and detailed waveform analysis for verification.

---

##  FSM Design

The elevator FSM includes states such as:

- **Idle**: Waiting for a request
- **Moving Up / Moving Down**: Elevator in motion
- **Door Open / Close**: Handles entry/exit
- **Stop at Floor**: Temporarily stops to serve a request
- **Wait**: Waits for the timer to go high to ensure a finite amount of time for door open
- **Check**: Further checks if any other floor is been requested

### FSM State Diagram

<img width="552" height="710" alt="Image" src="https://github.com/user-attachments/assets/20d7890c-5c6e-4d2c-88da-e7e59f3153fe" />
<img width="480" height="693" alt="Image" src="https://github.com/user-attachments/assets/bd7c5033-3e7c-4760-8e83-9b808b825e35" />

## Waveforms
<img width="1457" height="316" alt="Image" src="https://github.com/user-attachments/assets/8c90cad3-a45a-49e1-a346-ddb6958d6d24" />
<img width="1459" height="233" alt="Image" src="https://github.com/user-attachments/assets/37a242b8-dcc2-4135-80c4-fd4d1db70b5f" />
<img width="1460" height="239" alt="Image" src="https://github.com/user-attachments/assets/3cc5fc35-c475-4030-93e0-32b0a1f8a56d" />


## Acknowledgement
This project was a learning initiative on Digital System Design, FSM-based hardware, and Verilog HDL simulations.
