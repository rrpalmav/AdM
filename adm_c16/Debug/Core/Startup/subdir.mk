################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S<em>SRCS += \
../Core/Startup/startup<em>stm32f429zitx.s 

OBJS += \
./Core/Startup/startup<em>stm32f429zitx.o 

S<em>DEPS += \
./Core/Startup/startup<em>stm32f429zitx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/%.o: ../Core/Startup/%.s Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-Startup

clean-Core-2f-Startup:
	-$(RM) ./Core/Startup/startup<em>stm32f429zitx.d ./Core/Startup/startup<em>stm32f429zitx.o

.PHONY: clean-Core-2f-Startup

