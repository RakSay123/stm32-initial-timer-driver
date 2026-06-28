# STM32 Timer Driver (Bare-Metal)

## Overview

This project implements a **bare-metal timer driver** for the STM32G070 microcontroller using direct register access (CMSIS). The goal was to move beyond blocking delays (e.g., SysTick) and build a reusable timer abstraction capable of **interrupt-driven timing and scheduling**.

The project demonstrates how hardware timers can be used to create precise time-based behavior, such as blinking an LED at fixed intervals without blocking the CPU.

---

## Features

* Custom timer driver (`timer.c`, `timer.h`)
* Direct register-level programming (no HAL)
* Configurable:

  * Prescaler (PSC)
  * Auto-reload register (ARR)
  * Initial counter value (CNT)
* Optional interrupt support via NVIC
* Interrupt-based LED blinking
* Modular driver structure (GPIO + Timer separation)

---

## Hardware

* STM32G070 Nucleo Board
* On-board LED (PA5)

---

## How It Works

### Timer Fundamentals

Timers in STM32 are essentially **hardware counters** driven by the system clock.

The timer operates in two main stages:

1. **Prescaler (PSC)**
   Divides the system clock:

   ```
   Timer Frequency = f_clk / (PSC + 1)
   ```
2. **Auto-Reload Register (ARR)**
   Defines when the timer resets and triggers an update event:

   ```
   Update Event Frequency = Timer Frequency / (ARR + 1)
   ```

---

### Example Configuration

```c
psc = 16000 - 1;
arr = 1000 - 1;
```

With a 16 MHz clock:

* Timer tick = 16,000,000 / 16,000 = **1000 Hz (1 ms per tick)**
* Interrupt fires every 1000 ticks → **1 second**

---

### Interrupt Flow

1. Timer reaches ARR
2. Update flag (UIF) is set
3. NVIC triggers interrupt
4. ISR executes:

   * Clears flag
   * Updates software state (`tick_count++`)

---

## Project Structure

```
Project/
├── Src/
│   └── main.c
├── Drivers/
│   ├── gpio/
│   └── timer/
├── Devices/
│   └── bno055/   (optional, from previous work)
├── Inc/
```

---

## Example Usage

### Timer Configuration

```c
TIM_Config_t TIM3_CFG = {
    .TIMx = TIM3,
    .psc = 16000 - 1,
    .arr = 1000 - 1,
    .cnt = 0,
    .interrupt_status = TIM_INTERRUPTS_ENABLED
};
```

### Interrupt Handler

```c
void TIM3_IRQHandler()
{
    if (timer_get_update_flag(TIM3))
    {
        timer_clear_update_flag(TIM3);
        tick_count++;
    }
}
```

### Main Loop

```c
while (1)
{
    if (tick_count >= 1000)
    {
        tick_count = 0;
        gpio_toggle_pin(&LED_PIN);
    }
}
```

---

## Key Concepts Learned

* Hardware timers vs software delays
* Prescaler and auto-reload interaction
* Interrupt-driven design
* NVIC (Nested Vector Interrupt Controller)
* Importance of keeping ISRs lightweight
* Transition from blocking → non-blocking systems

---

## Future Improvements

* Callback-based timer system (function pointers)
* PWM generation using timer channels (CCR registers)
* Support for multiple timers simultaneously
* Generalized driver for basic / general / advanced timers
* Event scheduling (RTOS-lite system)

---

## Why This Matters

Timers are one of the most powerful peripherals in embedded systems. They enable:

* Precise timing control
* Non-blocking execution
* PWM (motor control, LEDs)
* Periodic scheduling (RTOS foundations)

This project marks the transition from simple microcontroller programming to **real embedded system design**.

---

## Author

Rakhshan Sayed
Electrical & Computer Engineering @ Rutgers University
