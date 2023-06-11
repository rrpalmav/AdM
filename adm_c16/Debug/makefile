################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/STM32F4xx<em>HAL<em>Driver/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S<em>DEPS)),)
-include $(S<em>DEPS)
endif
ifneq ($(strip $(S<em>UPPER<em>DEPS)),)
-include $(S<em>UPPER<em>DEPS)
endif
ifneq ($(strip $(C<em>DEPS)),)
-include $(C<em>DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL<em>TOOL<em>DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD<em>ARTIFACT<em>NAME := adm<em>c16
BUILD<em>ARTIFACT<em>EXTENSION := elf
BUILD<em>ARTIFACT<em>PREFIX :=
BUILD<em>ARTIFACT := $(BUILD<em>ARTIFACT<em>PREFIX)$(BUILD<em>ARTIFACT<em>NAME)$(if $(BUILD<em>ARTIFACT<em>EXTENSION),.$(BUILD<em>ARTIFACT<em>EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
adm<em>c16.elf \

MAP<em>FILES += \
adm<em>c16.map \

SIZE<em>OUTPUT += \
default.size.stdout \

OBJDUMP<em>LIST += \
adm<em>c16.list \

OBJCOPY<em>BIN += \
adm<em>c16.bin \


# All Target
all: main-build

# Main-build Target
main-build: adm<em>c16.elf secondary-outputs

# Tool invocations
adm<em>c16.elf adm<em>c16.map: $(OBJS) $(USER<em>OBJS) /home/palmaventura/Documents/Projectos<em>FreeRTOS/adm<em>c16/STM32F429ZITX<em>FLASH.ld makefile objects.list $(OPTIONAL<em>TOOL<em>DEPS)
	arm-none-eabi-gcc -o "adm<em>c16.elf" @"objects.list" $(USER<em>OBJS) $(LIBS) -mcpu=cortex-m4 -T"/home/palmaventura/Documents/Projectos<em>FreeRTOS/adm<em>c16/STM32F429ZITX<em>FLASH.ld" --specs=nosys.specs -Wl,-Map="adm<em>c16.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL<em>TOOL<em>DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

adm<em>c16.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL<em>TOOL<em>DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "adm<em>c16.list"
	@echo 'Finished building: $@'
	@echo ' '

adm<em>c16.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL<em>TOOL<em>DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "adm<em>c16.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) adm<em>c16.bin adm<em>c16.elf adm<em>c16.list adm<em>c16.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE<em>OUTPUT) $(OBJDUMP<em>LIST) $(OBJCOPY<em>BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
