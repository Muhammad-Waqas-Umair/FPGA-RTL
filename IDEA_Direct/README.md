
# IDEA (International Data Encryption Algorithm) in VHDL

This repository contains the **VHDL implementation** of the **International Data Encryption Algorithm (IDEA)** — a widely recognized symmetric key encryption algorithm developed in 1990. It is implemented and designed for testing on the **Spartan3E FPGA**.

---

## **Overview**

The **IDEA algorithm** encrypts four 16-bit wide blocks of plaintext simultaneously, processing them through **8 rounds of encryption** followed by a **final output transformation**. A 128-bit input key is used to generate 52 16-bit partial keys, which are essential for the encryption process.

### Key Operations in Each Round:

1. **Bit-wise XOR**: Applied to 16-bit blocks.
2. **Modular Addition**: Adding 16-bit numbers modulo 2^16.
3. **Modular Multiplication**: Multiplying 16-bit numbers modulo 2^16 + 1, with special handling for input 0 (substituted by 2^16).

The encryption process uses the 52 partial keys in each round, ensuring secure data encryption. **Decryption** is simply the reverse process, using inverse keys.

---

## **Features**

- **8 Rounds of Encryption**: Secure encryption performed in 8 rounds, each involving XOR, modular addition, and multiplication.
- **Key Generation**: A 128-bit input key generates 52 16-bit partial keys for use across all encryption rounds.
- **FPGA Implementation**: This design is fully implemented in **VHDL** and ready to be synthesized on the **Xilinx Spartan3E FPGA**.

---

## **VHDL Modules**

The IDEA algorithm is structured into several **VHDL modules** that handle different operations:

1. **XOR Module**: Bit-wise XOR of 16-bit data.
2. **Addition Module**: Adds 16-bit numbers modulo 2^16.
3. **Multiplication Module**: Multiplies 16-bit numbers modulo 2^16 + 1.
4. **Key Generator**: Generates 52 partial keys from the 128-bit input key.
5. **Round Function**: Handles the encryption round combining all operations.
6. **Output Transformation**: Final transformation after all rounds of encryption.

---

## **FPGA Testing**

Once the VHDL design is implemented, it will be **synthesized and tested** on the Spartan3E FPGA. The test will involve encrypting input data sets to verify the correctness and functionality of the implementation.

---

