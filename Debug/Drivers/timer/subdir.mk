################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/rakhs/STM32CubeIDE/stm32-workspace/Drivers/timer/timer.c 

OBJS += \
./Drivers/timer/timer.o 

C_DEPS += \
./Drivers/timer/timer.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/timer/timer.o: C:/Users/rakhs/STM32CubeIDE/stm32-workspace/Drivers/timer/timer.c Drivers/timer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DSTM32G070RBTx -DSTM32 -DSTM32G0 -c -IC:/Users/rakhs/STM32CubeIDE/stm32-workspace/Drivers -IC:/Users/rakhs/STM32CubeIDE/stm32-workspace/Devices -I../Inc -IC:/STM32/Drivers/CMSIS/Include -IC:/STM32/Drivers/CMSIS/Device/ST/STM32G0xx/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-timer

clean-Drivers-2f-timer:
	-$(RM) ./Drivers/timer/timer.cyclo ./Drivers/timer/timer.d ./Drivers/timer/timer.o ./Drivers/timer/timer.su

.PHONY: clean-Drivers-2f-timer

