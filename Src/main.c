#include <stdint.h>
#include "stm32g070xx.h"
#include "gpio/gpio.h"
#include "timer/timer.h"

#if !defined(__SOFT_FP__) && defined(__ARM_FP)
  #warning "FPU is not initialized, but the project is compiling for an FPU. Please initialize the FPU before use."
#endif

#define f_clk 16000000

GPIO_Config_t LED_PIN = {
	.port = GPIOA,
	.pin = 5,
	.mode = GPIO_MODE_OUTPUT,
	.otype = GPIO_PUSH_PULL,
	.speed = GPIO_SPEED_HIGH,
	.pull = GPIO_NO_PULL,
	.alternate = GPIO_AF0
};

TIM_Config_t TIM3_CFG = {
	.TIMx = TIM3,
	.psc = 16000 - 1,
	.arr = 10 - 1,
	.cnt = 0,
	.interrupt_status = TIM_INTERRUPTS_ENABLED
};

volatile uint32_t tick_count = 0;

void TIM3_IRQHandler()
{
	if (timer_get_update_flag(TIM3) == TIM_OK)
	{
		timer_clear_update_flag(TIM3);
		tick_count += 10;
	}
}

void init()
{
	__enable_irq();

	gpio_init(&LED_PIN);
	timer_init(&TIM3_CFG);
}

int main(void)
{
	init();

	while (1)
	{
//		uint32_t val = TIM3->CNT;
//
//		if (timer_get_update_flag(TIM3) == TIM_OK)
//		{
//			gpio_toggle_pin(&LED_PIN);
//			timer_clear_update_flag(TIM3);
//		}

		if (tick_count >= 1000)
		{
			tick_count = 0;
			gpio_toggle_pin(&LED_PIN);
		}
	}
}
