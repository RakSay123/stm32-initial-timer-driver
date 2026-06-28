################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/rakhs/STM32CubeIDE/stm32-workspace/Devices/bno055/bno055.c \
C:/Users/rakhs/STM32CubeIDE/stm32-workspace/Devices/bno055/bno055_debug.c 

OBJS += \
./Devices/bno055/bno055.o \
./Devices/bno055/bno055_debug.o 

C_DEPS += \
./Devices/bno055/bno055.d \
./Devices/bno055/bno055_debug.d 


# Each subdirectory must supply rules for building sources it contributes
Devices/bno055/bno055.o: C:/Users/rakhs/STM32CubeIDE/stm32-workspace/Devices/bno055/bno055.c Devices/bno055/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DSTM32G070RBTx -DSTM32 -DSTM32G0 -c -IC:/Users/rakhs/STM32CubeIDE/stm32-workspace/Drivers -IC:/Users/rakhs/STM32CubeIDE/stm32-workspace/Devices -I../Inc -IC:/STM32/Drivers/CMSIS/Include -IC:/STM32/Drivers/CMSIS/Device/ST/STM32G0xx/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Devices/bno055/bno055_debug.o: C:/Users/rakhs/STM32CubeIDE/stm32-workspace/Devices/bno055/bno055_debug.c Devices/bno055/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DSTM32G070RBTx -DSTM32 -DSTM32G0 -c -IC:/Users/rakhs/STM32CubeIDE/stm32-workspace/Drivers -IC:/Users/rakhs/STM32CubeIDE/stm32-workspace/Devices -I../Inc -IC:/STM32/Drivers/CMSIS/Include -IC:/STM32/Drivers/CMSIS/Device/ST/STM32G0xx/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Devices-2f-bno055

clean-Devices-2f-bno055:
	-$(RM) ./Devices/bno055/bno055.cyclo ./Devices/bno055/bno055.d ./Devices/bno055/bno055.o ./Devices/bno055/bno055.su ./Devices/bno055/bno055_debug.cyclo ./Devices/bno055/bno055_debug.d ./Devices/bno055/bno055_debug.o ./Devices/bno055/bno055_debug.su

.PHONY: clean-Devices-2f-bno055

