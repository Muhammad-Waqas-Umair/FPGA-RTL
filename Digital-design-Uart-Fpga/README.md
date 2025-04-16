## Project Description

This project enables serial communication between the **Nexys 4 DDR FPGA** and **Arduino Uno** using the **UART protocol**.

## Workflow

1. Design and implement a UART transmitter on the Nexys 4 DDR FPGA.
2. Use the onboard switches to input 4-bit data and transmit it to an Arduino Uno via UART.
3. Display the received data on the Arduino Serial Monitor.
4. Use the onboard LEDs to visually indicate the transmitted data.

## File Structure

- `uart_transmitter.v`: Verilog UART TX module
- `Constraints.xdc`: XDC file for pin assignments
- `arduino_receiver.ino`: Arduino sketch to display received data