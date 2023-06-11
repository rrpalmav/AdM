/* USER CODE BEGIN Header */
/<b>
  <b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>
  * @file    stm32f4xx<em>it.h
  * @brief   This file contains the headers of the interrupt handlers.
  <b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
 <b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef <em><em>STM32F4xx<em>IT<em>H
#define <em><em>STM32F4xx<em>IT<em>H

#ifdef <em><em>cplusplus
 extern "C" {
#endif

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void NMI<em>Handler(void);
void HardFault<em>Handler(void);
void MemManage<em>Handler(void);
void BusFault<em>Handler(void);
void UsageFault<em>Handler(void);
void SVC<em>Handler(void);
void DebugMon<em>Handler(void);
void PendSV<em>Handler(void);
void SysTick<em>Handler(void);
/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

#ifdef <em><em>cplusplus
}
#endif

#endif /* <em><em>STM32F4xx<em>IT<em>H */
