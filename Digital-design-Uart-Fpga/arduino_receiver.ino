/**
 * UART Receiver (Arduino Side)
 * ----------------------------
 * - Receives 8-bit serial data via UART
 * - Displays received value via Serial Monitor
 * - Baud Rate: 9600 (must match FPGA)
 */

int incomingSerialByte = 0;  // Stores incoming byte from FPGA UART

void setup() {
    // Initialize UART communication
    Serial.begin(9600);
}

void loop() {
    // Check if data is available on serial input
    if (Serial.available() > 0) {
        // Read incoming byte (0–255 range)
        incomingSerialByte = Serial.read();

        // Display received byte
        Serial.print("Received: ");

        // Check for error (Serial.read() returns -1 if error, though unlikely here)
        if (incomingSerialByte == -1) {
            Serial.println("Error reading");
        } else {
            Serial.println(incomingSerialByte);  // Display numeric value
        }
    }
}
