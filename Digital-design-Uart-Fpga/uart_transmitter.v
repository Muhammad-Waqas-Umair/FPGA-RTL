`timescale 1ns / 1ps

/**
 * UART Transmitter Module
 * ------------------------
 * Features:
 * - Configurable baud rate, clock frequency, and data width
 * - 8-bit data transmission (LSB first)
 * - Clean FSM using enum types
 * - Synchronous reset
 */
module uart_transmitter #(
    parameter CLK_FREQ   = 100_000_000, // 100 MHz default clock
    parameter BAUD_RATE  = 9600,        // Default 9600 baud
    parameter DATA_WIDTH = 4            // Input data width
)(
    // System Signals
    input  wire                      clk,
    input  wire                      reset,

    // User Interface
    input  wire [DATA_WIDTH-1:0]    data_in,
    input  wire                     transmit_en,
    output reg  [DATA_WIDTH-1:0]    status_leds,

    // UART Line Output
    output wire                     tx_out
);

    // ------------------------------------------------------------
    // Local Parameters and State Definitions
    // ------------------------------------------------------------
    localparam BAUD_PERIOD = CLK_FREQ / BAUD_RATE;

    typedef enum logic [2:0] {
        IDLE,
        START_BIT,
        DATA_BITS,
        STOP_BIT,
        DONE
    } uart_state_t;

    // ------------------------------------------------------------
    // Internal Signals
    // ------------------------------------------------------------
    uart_state_t current_state;
    reg [7:0]    tx_data;        // 8-bit padded data
    reg [2:0]    bit_counter;    // Counts up to 8 data bits
    reg [15:0]   baud_counter;
    reg          tx_reg;         // Output register

    assign tx_out = tx_reg;

    // ------------------------------------------------------------
    // UART FSM Logic
    // ------------------------------------------------------------
    always @(posedge clk) begin
        if (reset) begin
            current_state <= IDLE;
            tx_data       <= 8'b0;
            bit_counter   <= 3'b0;
            baud_counter  <= 16'b0;
            tx_reg        <= 1'b1; // Idle state is HIGH
            status_leds   <= {DATA_WIDTH{1'b0}};
        end else begin
            case (current_state)
                IDLE: begin
                    tx_reg <= 1'b1; // Idle line

                    if (transmit_en) begin
                        tx_data       <= { {(8-DATA_WIDTH){1'b0}}, data_in }; // Zero-pad MSBs
                        status_leds   <= data_in;
                        baud_counter  <= 0;
                        current_state <= START_BIT;
                    end
                end

                START_BIT: begin
                    if (baud_counter == BAUD_PERIOD - 1) begin
                        tx_reg        <= 1'b0; // Start bit
                        baud_counter  <= 0;
                        bit_counter   <= 0;
                        current_state <= DATA_BITS;
                    end else begin
                        baud_counter <= baud_counter + 1;
                    end
                end

                DATA_BITS: begin
                    if (baud_counter == BAUD_PERIOD - 1) begin
                        tx_reg       <= tx_data[bit_counter];
                        baud_counter <= 0;

                        if (bit_counter == 3'd7)
                            current_state <= STOP_BIT;
                        else
                            bit_counter <= bit_counter + 1;
                    end else begin
                        baud_counter <= baud_counter + 1;
                    end
                end

                STOP_BIT: begin
                    if (baud_counter == BAUD_PERIOD - 1) begin
                        tx_reg        <= 1'b1; // Stop bit
                        baud_counter  <= 0;
                        current_state <= DONE;
                    end else begin
                        baud_counter <= baud_counter + 1;
                    end
                end

                DONE: begin
                    current_state <= IDLE;
                end
            endcase
        end
    end

endmodule
