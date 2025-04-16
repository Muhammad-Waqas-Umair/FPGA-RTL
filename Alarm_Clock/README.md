
# **Nexys 4 DDR FPGA - Alarm Clock System (DCF77-Compatible)**

## 🕰️ **Description**

This project implements an **alarm clock module** for a **radio-controlled clock system**, compatible with the **DCF77** time signal (used in Germany). The design targets the **Xilinx Zynq-7000 (XC7Z020)** FPGA and includes features for setting, activating, and snoozing alarms with visual feedback.

---

## 🛠️ **Features**

### **Set Alarm Time:**
- Use the **Mode** and **+/-** keys to modify the alarm time in minute increments.

### **Alarm Control:**
- **Toggle Alarm:** Press the **Action** key to activate/deactivate the alarm.

### **Snooze Functionality:**
- **Short Press (<2s):** Pauses the alarm for **1 minute** (LED blinks, display shows ‘Z’).

### **Reset Alarm:**
- **Long Press (>2s):** Resets the current alarm and restores the originally set alarm time.

### **Visual Feedback:**
- `led_alarm_ring`: Illuminated when the alarm is ringing.
- `led_alarm_act`: Indicates the alarm is active.
- Display shows `A*` (active alarm), `AZ` (snooze), or just `A` (inactive alarm).

### **Default Alarm Time:**
- Set to **00:16**, and deactivated at system reset.

---

## 📋 **Requirements**

- **Vivado** for synthesis and implementation.
- **Xilinx Zynq-7000 FPGA Board** for deployment.
