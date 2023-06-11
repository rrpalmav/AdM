/<b>
  <b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>
  * @file      startup<em>stm32f429xx.s
  * @author    MCD Application Team
  * @brief     STM32F429xx Devices vector table for GCC based toolchains. 
  *            This module performs:
  *                - Set the initial SP
  *                - Set the initial PC == Reset<em>Handler,
  *                - Set the vector table entries with the exceptions ISR address
  *                - Branches to main in the C library (which eventually
  *                  calls main()).
  *            After Reset the Cortex-M4 processor is in Thread mode,
  *            priority is Privileged, and the Stack is set to Main.
  <b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>
  * @attention
  *
  * Copyright (c) 2017 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  <b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>
  */
    
  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb

.global  g<em>pfnVectors
.global  Default<em>Handler

/* start address for the initialization values of the .data section. 
defined in linker script */
.word  <em>sidata
/* start address for the .data section. defined in linker script */  
.word  <em>sdata
/* end address for the .data section. defined in linker script */
.word  <em>edata
/* start address for the .bss section. defined in linker script */
.word  <em>sbss
/* end address for the .bss section. defined in linker script */
.word  <em>ebss
/* stack used for SystemInit<em>ExtMemCtl; always internal RAM used */

/<b>
 * @brief  This is the code that gets called when the processor first
 *          starts execution following a reset event. Only the absolutely
 *          necessary set is performed, after which the application
 *          supplied main() routine is called. 
 * @param  None
 * @retval : None
*/

    .section  .text.Reset<em>Handler
  .weak  Reset<em>Handler
  .type  Reset<em>Handler, %function
Reset<em>Handler: 
  nop
  nop
  ldr   sp, =<em>estack       /* set stack pointer */
 
/* Copy the data segment initializers from flash to SRAM */  
  ldr r0, =<em>sdata
  ldr r1, =<em>edata
  ldr r2, =<em>sidata
  movs r3, #0
  b LoopCopyDataInit

CopyDataInit:
  ldr r4, [r2, r3]
  str r4, [r0, r3]
  adds r3, r3, #4

LoopCopyDataInit:
  adds r4, r0, r3
  cmp r4, r1
  bcc CopyDataInit
  
/* Zero fill the bss segment. */
  ldr r2, =<em>sbss
  ldr r4, =<em>ebss
  movs r3, #0
  b LoopFillZerobss

FillZerobss:
  str  r3, [r2]
  adds r2, r2, #4

LoopFillZerobss:
  cmp r2, r4
  bcc FillZerobss

/* Call the clock system initialization function.*/
  bl  SystemInit   
/* Call static constructors */
    bl <em><em>libc<em>init<em>array
/* Call the application's entry point.*/
  bl  main
  bx  lr    
.size  Reset<em>Handler, .-Reset<em>Handler

/<b>
 * @brief  This is the code that gets called when the processor receives an 
 *         unexpected interrupt.  This simply enters an infinite loop, preserving
 *         the system state for examination by a debugger.
 * @param  None     
 * @retval None       
*/
    .section  .text.Default<em>Handler,"ax",%progbits
Default<em>Handler:
Infinite<em>Loop:
  b  Infinite<em>Loop
  .size  Default<em>Handler, .-Default<em>Handler
/<b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>
*
* The minimal vector table for a Cortex M3. Note that the proper constructs
* must be placed on this to ensure that it ends up at physical address
* 0x0000.0000.
* 
<b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>*/
   .section  .isr<em>vector,"a",%progbits
  .type  g<em>pfnVectors, %object
  .size  g<em>pfnVectors, .-g<em>pfnVectors
   
g<em>pfnVectors:
  .word  <em>estack
  .word  Reset<em>Handler

  .word  NMI<em>Handler
  .word  HardFault<em>Handler
  .word  MemManage<em>Handler
  .word  BusFault<em>Handler
  .word  UsageFault<em>Handler
  .word  0
  .word  0
  .word  0
  .word  0
  .word  SVC<em>Handler
  .word  DebugMon<em>Handler
  .word  0
  .word  PendSV<em>Handler
  .word  SysTick<em>Handler
  
  /* External Interrupts */
  .word     WWDG<em>IRQHandler                   /* Window WatchDog              */                                        
  .word     PVD<em>IRQHandler                    /* PVD through EXTI Line detection */                        
  .word     TAMP<em>STAMP<em>IRQHandler             /* Tamper and TimeStamps through the EXTI line */            
  .word     RTC<em>WKUP<em>IRQHandler               /* RTC Wakeup through the EXTI line */                      
  .word     FLASH<em>IRQHandler                  /* FLASH                        */                                          
  .word     RCC<em>IRQHandler                    /* RCC                          */                                            
  .word     EXTI0<em>IRQHandler                  /* EXTI Line0                   */                        
  .word     EXTI1<em>IRQHandler                  /* EXTI Line1                   */                          
  .word     EXTI2<em>IRQHandler                  /* EXTI Line2                   */                          
  .word     EXTI3<em>IRQHandler                  /* EXTI Line3                   */                          
  .word     EXTI4<em>IRQHandler                  /* EXTI Line4                   */                          
  .word     DMA1<em>Stream0<em>IRQHandler           /* DMA1 Stream 0                */                  
  .word     DMA1<em>Stream1<em>IRQHandler           /* DMA1 Stream 1                */                   
  .word     DMA1<em>Stream2<em>IRQHandler           /* DMA1 Stream 2                */                   
  .word     DMA1<em>Stream3<em>IRQHandler           /* DMA1 Stream 3                */                   
  .word     DMA1<em>Stream4<em>IRQHandler           /* DMA1 Stream 4                */                   
  .word     DMA1<em>Stream5<em>IRQHandler           /* DMA1 Stream 5                */                   
  .word     DMA1<em>Stream6<em>IRQHandler           /* DMA1 Stream 6                */                   
  .word     ADC<em>IRQHandler                    /* ADC1, ADC2 and ADC3s         */                   
  .word     CAN1<em>TX<em>IRQHandler                /* CAN1 TX                      */                         
  .word     CAN1<em>RX0<em>IRQHandler               /* CAN1 RX0                     */                          
  .word     CAN1<em>RX1<em>IRQHandler               /* CAN1 RX1                     */                          
  .word     CAN1<em>SCE<em>IRQHandler               /* CAN1 SCE                     */                          
  .word     EXTI9<em>5<em>IRQHandler                /* External Line[9:5]s          */                          
  .word     TIM1<em>BRK<em>TIM9<em>IRQHandler          /* TIM1 Break and TIM9          */         
  .word     TIM1<em>UP<em>TIM10<em>IRQHandler          /* TIM1 Update and TIM10        */         
  .word     TIM1<em>TRG<em>COM<em>TIM11<em>IRQHandler     /* TIM1 Trigger and Commutation and TIM11 */
  .word     TIM1<em>CC<em>IRQHandler                /* TIM1 Capture Compare         */                          
  .word     TIM2<em>IRQHandler                   /* TIM2                         */                   
  .word     TIM3<em>IRQHandler                   /* TIM3                         */                   
  .word     TIM4<em>IRQHandler                   /* TIM4                         */                   
  .word     I2C1<em>EV<em>IRQHandler                /* I2C1 Event                   */                          
  .word     I2C1<em>ER<em>IRQHandler                /* I2C1 Error                   */                          
  .word     I2C2<em>EV<em>IRQHandler                /* I2C2 Event                   */                          
  .word     I2C2<em>ER<em>IRQHandler                /* I2C2 Error                   */                            
  .word     SPI1<em>IRQHandler                   /* SPI1                         */                   
  .word     SPI2<em>IRQHandler                   /* SPI2                         */                   
  .word     USART1<em>IRQHandler                 /* USART1                       */                   
  .word     USART2<em>IRQHandler                 /* USART2                       */                   
  .word     USART3<em>IRQHandler                 /* USART3                       */                   
  .word     EXTI15<em>10<em>IRQHandler              /* External Line[15:10]s        */                          
  .word     RTC<em>Alarm<em>IRQHandler              /* RTC Alarm (A and B) through EXTI Line */                 
  .word     OTG<em>FS<em>WKUP<em>IRQHandler            /* USB OTG FS Wakeup through EXTI line */                       
  .word     TIM8<em>BRK<em>TIM12<em>IRQHandler         /* TIM8 Break and TIM12         */         
  .word     TIM8<em>UP<em>TIM13<em>IRQHandler          /* TIM8 Update and TIM13        */         
  .word     TIM8<em>TRG<em>COM<em>TIM14<em>IRQHandler     /* TIM8 Trigger and Commutation and TIM14 */
  .word     TIM8<em>CC<em>IRQHandler                /* TIM8 Capture Compare         */                          
  .word     DMA1<em>Stream7<em>IRQHandler           /* DMA1 Stream7                 */                          
  .word     FMC<em>IRQHandler                    /* FMC                         */                   
  .word     SDIO<em>IRQHandler                   /* SDIO                         */                   
  .word     TIM5<em>IRQHandler                   /* TIM5                         */                   
  .word     SPI3<em>IRQHandler                   /* SPI3                         */                   
  .word     UART4<em>IRQHandler                  /* UART4                        */                   
  .word     UART5<em>IRQHandler                  /* UART5                        */                   
  .word     TIM6<em>DAC<em>IRQHandler               /* TIM6 and DAC1&2 underrun errors */                   
  .word     TIM7<em>IRQHandler                   /* TIM7                         */
  .word     DMA2<em>Stream0<em>IRQHandler           /* DMA2 Stream 0                */                   
  .word     DMA2<em>Stream1<em>IRQHandler           /* DMA2 Stream 1                */                   
  .word     DMA2<em>Stream2<em>IRQHandler           /* DMA2 Stream 2                */                   
  .word     DMA2<em>Stream3<em>IRQHandler           /* DMA2 Stream 3                */                   
  .word     DMA2<em>Stream4<em>IRQHandler           /* DMA2 Stream 4                */                   
  .word     ETH<em>IRQHandler                    /* Ethernet                     */                   
  .word     ETH<em>WKUP<em>IRQHandler               /* Ethernet Wakeup through EXTI line */                     
  .word     CAN2<em>TX<em>IRQHandler                /* CAN2 TX                      */                          
  .word     CAN2<em>RX0<em>IRQHandler               /* CAN2 RX0                     */                          
  .word     CAN2<em>RX1<em>IRQHandler               /* CAN2 RX1                     */                          
  .word     CAN2<em>SCE<em>IRQHandler               /* CAN2 SCE                     */                          
  .word     OTG<em>FS<em>IRQHandler                 /* USB OTG FS                   */                   
  .word     DMA2<em>Stream5<em>IRQHandler           /* DMA2 Stream 5                */                   
  .word     DMA2<em>Stream6<em>IRQHandler           /* DMA2 Stream 6                */                   
  .word     DMA2<em>Stream7<em>IRQHandler           /* DMA2 Stream 7                */                   
  .word     USART6<em>IRQHandler                 /* USART6                       */                    
  .word     I2C3<em>EV<em>IRQHandler                /* I2C3 event                   */                          
  .word     I2C3<em>ER<em>IRQHandler                /* I2C3 error                   */                          
  .word     OTG<em>HS<em>EP1<em>OUT<em>IRQHandler         /* USB OTG HS End Point 1 Out   */                   
  .word     OTG<em>HS<em>EP1<em>IN<em>IRQHandler          /* USB OTG HS End Point 1 In    */                   
  .word     OTG<em>HS<em>WKUP<em>IRQHandler            /* USB OTG HS Wakeup through EXTI */                         
  .word     OTG<em>HS<em>IRQHandler                 /* USB OTG HS                   */                   
  .word     DCMI<em>IRQHandler                   /* DCMI                         */                   
  .word     0                                 /* Reserved                     */                   
  .word     HASH<em>RNG<em>IRQHandler               /* Hash and Rng                 */
  .word     FPU<em>IRQHandler                    /* FPU                          */
  .word     UART7<em>IRQHandler                  /* UART7                        */      
  .word     UART8<em>IRQHandler                  /* UART8                        */
  .word     SPI4<em>IRQHandler                   /* SPI4                         */
  .word     SPI5<em>IRQHandler                   /* SPI5 						  */
  .word     SPI6<em>IRQHandler                   /* SPI6						  */
  .word     SAI1<em>IRQHandler                   /* SAI1						  */
  .word     LTDC<em>IRQHandler                   /* LTDC<em>IRQHandler			  */
  .word     LTDC<em>ER<em>IRQHandler                /* LTDC<em>ER<em>IRQHandler			  */
  .word     DMA2D<em>IRQHandler                  /* DMA2D                        */
  
/<b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>*
*
* Provide weak aliases for each Exception handler to the Default<em>Handler. 
* As they are weak aliases, any function with the same name will override 
* this definition.
* 
<b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b><b>*/
   .weak      NMI<em>Handler
   .thumb<em>set NMI<em>Handler,Default<em>Handler
  
   .weak      HardFault<em>Handler
   .thumb<em>set HardFault<em>Handler,Default<em>Handler
  
   .weak      MemManage<em>Handler
   .thumb<em>set MemManage<em>Handler,Default<em>Handler
  
   .weak      BusFault<em>Handler
   .thumb<em>set BusFault<em>Handler,Default<em>Handler

   .weak      UsageFault<em>Handler
   .thumb<em>set UsageFault<em>Handler,Default<em>Handler

   .weak      SVC<em>Handler
   .thumb<em>set SVC<em>Handler,Default<em>Handler

   .weak      DebugMon<em>Handler
   .thumb<em>set DebugMon<em>Handler,Default<em>Handler

   .weak      PendSV<em>Handler
   .thumb<em>set PendSV<em>Handler,Default<em>Handler

   .weak      SysTick<em>Handler
   .thumb<em>set SysTick<em>Handler,Default<em>Handler              
  
   .weak      WWDG<em>IRQHandler                   
   .thumb<em>set WWDG<em>IRQHandler,Default<em>Handler      
                  
   .weak      PVD<em>IRQHandler      
   .thumb<em>set PVD<em>IRQHandler,Default<em>Handler
               
   .weak      TAMP<em>STAMP<em>IRQHandler            
   .thumb<em>set TAMP<em>STAMP<em>IRQHandler,Default<em>Handler
            
   .weak      RTC<em>WKUP<em>IRQHandler                  
   .thumb<em>set RTC<em>WKUP<em>IRQHandler,Default<em>Handler
            
   .weak      FLASH<em>IRQHandler         
   .thumb<em>set FLASH<em>IRQHandler,Default<em>Handler
                  
   .weak      RCC<em>IRQHandler      
   .thumb<em>set RCC<em>IRQHandler,Default<em>Handler
                  
   .weak      EXTI0<em>IRQHandler         
   .thumb<em>set EXTI0<em>IRQHandler,Default<em>Handler
                  
   .weak      EXTI1<em>IRQHandler         
   .thumb<em>set EXTI1<em>IRQHandler,Default<em>Handler
                     
   .weak      EXTI2<em>IRQHandler         
   .thumb<em>set EXTI2<em>IRQHandler,Default<em>Handler 
                 
   .weak      EXTI3<em>IRQHandler         
   .thumb<em>set EXTI3<em>IRQHandler,Default<em>Handler
                        
   .weak      EXTI4<em>IRQHandler         
   .thumb<em>set EXTI4<em>IRQHandler,Default<em>Handler
                  
   .weak      DMA1<em>Stream0<em>IRQHandler               
   .thumb<em>set DMA1<em>Stream0<em>IRQHandler,Default<em>Handler
         
   .weak      DMA1<em>Stream1<em>IRQHandler               
   .thumb<em>set DMA1<em>Stream1<em>IRQHandler,Default<em>Handler
                  
   .weak      DMA1<em>Stream2<em>IRQHandler               
   .thumb<em>set DMA1<em>Stream2<em>IRQHandler,Default<em>Handler
                  
   .weak      DMA1<em>Stream3<em>IRQHandler               
   .thumb<em>set DMA1<em>Stream3<em>IRQHandler,Default<em>Handler 
                 
   .weak      DMA1<em>Stream4<em>IRQHandler              
   .thumb<em>set DMA1<em>Stream4<em>IRQHandler,Default<em>Handler
                  
   .weak      DMA1<em>Stream5<em>IRQHandler               
   .thumb<em>set DMA1<em>Stream5<em>IRQHandler,Default<em>Handler
                  
   .weak      DMA1<em>Stream6<em>IRQHandler               
   .thumb<em>set DMA1<em>Stream6<em>IRQHandler,Default<em>Handler
                  
   .weak      ADC<em>IRQHandler      
   .thumb<em>set ADC<em>IRQHandler,Default<em>Handler
               
   .weak      CAN1<em>TX<em>IRQHandler   
   .thumb<em>set CAN1<em>TX<em>IRQHandler,Default<em>Handler
            
   .weak      CAN1<em>RX0<em>IRQHandler                  
   .thumb<em>set CAN1<em>RX0<em>IRQHandler,Default<em>Handler
                           
   .weak      CAN1<em>RX1<em>IRQHandler                  
   .thumb<em>set CAN1<em>RX1<em>IRQHandler,Default<em>Handler
            
   .weak      CAN1<em>SCE<em>IRQHandler                  
   .thumb<em>set CAN1<em>SCE<em>IRQHandler,Default<em>Handler
            
   .weak      EXTI9<em>5<em>IRQHandler   
   .thumb<em>set EXTI9<em>5<em>IRQHandler,Default<em>Handler
            
   .weak      TIM1<em>BRK<em>TIM9<em>IRQHandler            
   .thumb<em>set TIM1<em>BRK<em>TIM9<em>IRQHandler,Default<em>Handler
            
   .weak      TIM1<em>UP<em>TIM10<em>IRQHandler            
   .thumb<em>set TIM1<em>UP<em>TIM10<em>IRQHandler,Default<em>Handler

   .weak      TIM1<em>TRG<em>COM<em>TIM11<em>IRQHandler      
   .thumb<em>set TIM1<em>TRG<em>COM<em>TIM11<em>IRQHandler,Default<em>Handler
      
   .weak      TIM1<em>CC<em>IRQHandler   
   .thumb<em>set TIM1<em>CC<em>IRQHandler,Default<em>Handler
                  
   .weak      TIM2<em>IRQHandler            
   .thumb<em>set TIM2<em>IRQHandler,Default<em>Handler
                  
   .weak      TIM3<em>IRQHandler            
   .thumb<em>set TIM3<em>IRQHandler,Default<em>Handler
                  
   .weak      TIM4<em>IRQHandler            
   .thumb<em>set TIM4<em>IRQHandler,Default<em>Handler
                  
   .weak      I2C1<em>EV<em>IRQHandler   
   .thumb<em>set I2C1<em>EV<em>IRQHandler,Default<em>Handler
                     
   .weak      I2C1<em>ER<em>IRQHandler   
   .thumb<em>set I2C1<em>ER<em>IRQHandler,Default<em>Handler
                     
   .weak      I2C2<em>EV<em>IRQHandler   
   .thumb<em>set I2C2<em>EV<em>IRQHandler,Default<em>Handler
                  
   .weak      I2C2<em>ER<em>IRQHandler   
   .thumb<em>set I2C2<em>ER<em>IRQHandler,Default<em>Handler
                           
   .weak      SPI1<em>IRQHandler            
   .thumb<em>set SPI1<em>IRQHandler,Default<em>Handler
                        
   .weak      SPI2<em>IRQHandler            
   .thumb<em>set SPI2<em>IRQHandler,Default<em>Handler
                  
   .weak      USART1<em>IRQHandler      
   .thumb<em>set USART1<em>IRQHandler,Default<em>Handler
                     
   .weak      USART2<em>IRQHandler      
   .thumb<em>set USART2<em>IRQHandler,Default<em>Handler
                     
   .weak      USART3<em>IRQHandler      
   .thumb<em>set USART3<em>IRQHandler,Default<em>Handler
                  
   .weak      EXTI15<em>10<em>IRQHandler               
   .thumb<em>set EXTI15<em>10<em>IRQHandler,Default<em>Handler
               
   .weak      RTC<em>Alarm<em>IRQHandler               
   .thumb<em>set RTC<em>Alarm<em>IRQHandler,Default<em>Handler
            
   .weak      OTG<em>FS<em>WKUP<em>IRQHandler         
   .thumb<em>set OTG<em>FS<em>WKUP<em>IRQHandler,Default<em>Handler
            
   .weak      TIM8<em>BRK<em>TIM12<em>IRQHandler         
   .thumb<em>set TIM8<em>BRK<em>TIM12<em>IRQHandler,Default<em>Handler
         
   .weak      TIM8<em>UP<em>TIM13<em>IRQHandler            
   .thumb<em>set TIM8<em>UP<em>TIM13<em>IRQHandler,Default<em>Handler
         
   .weak      TIM8<em>TRG<em>COM<em>TIM14<em>IRQHandler      
   .thumb<em>set TIM8<em>TRG<em>COM<em>TIM14<em>IRQHandler,Default<em>Handler
      
   .weak      TIM8<em>CC<em>IRQHandler   
   .thumb<em>set TIM8<em>CC<em>IRQHandler,Default<em>Handler
                  
   .weak      DMA1<em>Stream7<em>IRQHandler               
   .thumb<em>set DMA1<em>Stream7<em>IRQHandler,Default<em>Handler
                     
   .weak      FMC<em>IRQHandler            
   .thumb<em>set FMC<em>IRQHandler,Default<em>Handler
                     
   .weak      SDIO<em>IRQHandler            
   .thumb<em>set SDIO<em>IRQHandler,Default<em>Handler
                     
   .weak      TIM5<em>IRQHandler            
   .thumb<em>set TIM5<em>IRQHandler,Default<em>Handler
                     
   .weak      SPI3<em>IRQHandler            
   .thumb<em>set SPI3<em>IRQHandler,Default<em>Handler
                     
   .weak      UART4<em>IRQHandler         
   .thumb<em>set UART4<em>IRQHandler,Default<em>Handler
                  
   .weak      UART5<em>IRQHandler         
   .thumb<em>set UART5<em>IRQHandler,Default<em>Handler
                  
   .weak      TIM6<em>DAC<em>IRQHandler                  
   .thumb<em>set TIM6<em>DAC<em>IRQHandler,Default<em>Handler
               
   .weak      TIM7<em>IRQHandler            
   .thumb<em>set TIM7<em>IRQHandler,Default<em>Handler
         
   .weak      DMA2<em>Stream0<em>IRQHandler               
   .thumb<em>set DMA2<em>Stream0<em>IRQHandler,Default<em>Handler
               
   .weak      DMA2<em>Stream1<em>IRQHandler               
   .thumb<em>set DMA2<em>Stream1<em>IRQHandler,Default<em>Handler
                  
   .weak      DMA2<em>Stream2<em>IRQHandler               
   .thumb<em>set DMA2<em>Stream2<em>IRQHandler,Default<em>Handler
            
   .weak      DMA2<em>Stream3<em>IRQHandler               
   .thumb<em>set DMA2<em>Stream3<em>IRQHandler,Default<em>Handler
            
   .weak      DMA2<em>Stream4<em>IRQHandler               
   .thumb<em>set DMA2<em>Stream4<em>IRQHandler,Default<em>Handler
   
   .weak      ETH<em>IRQHandler               
   .thumb<em>set ETH<em>IRQHandler,Default<em>Handler

   .weak      ETH<em>WKUP<em>IRQHandler               
   .thumb<em>set ETH<em>WKUP<em>IRQHandler,Default<em>Handler

   .weak      CAN2<em>TX<em>IRQHandler   
   .thumb<em>set CAN2<em>TX<em>IRQHandler,Default<em>Handler
                           
   .weak      CAN2<em>RX0<em>IRQHandler                  
   .thumb<em>set CAN2<em>RX0<em>IRQHandler,Default<em>Handler
                           
   .weak      CAN2<em>RX1<em>IRQHandler                  
   .thumb<em>set CAN2<em>RX1<em>IRQHandler,Default_Handler
                           
   .weak      CAN2_SCE_IRQHandler                  
   .thumb_set CAN2_SCE_IRQHandler,Default_Handler
                           
   .weak      OTG_FS_IRQHandler      
   .thumb_set OTG_FS_IRQHandler,Default_Handler
                     
   .weak      DMA2_Stream5_IRQHandler               
   .thumb_set DMA2_Stream5_IRQHandler,Default_Handler
                  
   .weak      DMA2_Stream6_IRQHandler               
   .thumb_set DMA2_Stream6_IRQHandler,Default_Handler
                  
   .weak      DMA2_Stream7_IRQHandler               
   .thumb_set DMA2_Stream7_IRQHandler,Default_Handler
                  
   .weak      USART6_IRQHandler      
   .thumb_set USART6_IRQHandler,Default_Handler
                        
   .weak      I2C3_EV_IRQHandler   
   .thumb_set I2C3_EV_IRQHandler,Default_Handler
                        
   .weak      I2C3_ER_IRQHandler   
   .thumb_set I2C3_ER_IRQHandler,Default_Handler
                        
   .weak      OTG_HS_EP1_OUT_IRQHandler         
   .thumb_set OTG_HS_EP1_OUT_IRQHandler,Default_Handler
               
   .weak      OTG_HS_EP1_IN_IRQHandler            
   .thumb_set OTG_HS_EP1_IN_IRQHandler,Default_Handler
               
   .weak      OTG_HS_WKUP_IRQHandler         
   .thumb_set OTG_HS_WKUP_IRQHandler,Default_Handler
            
   .weak      OTG_HS_IRQHandler      
   .thumb_set OTG_HS_IRQHandler,Default_Handler
                  
   .weak      DCMI_IRQHandler            
   .thumb_set DCMI_IRQHandler,Default_Handler
                                   
   .weak      HASH_RNG_IRQHandler                  
   .thumb_set HASH_RNG_IRQHandler,Default_Handler   

   .weak      FPU_IRQHandler                  
   .thumb_set FPU_IRQHandler,Default_Handler  

   .weak      UART7_IRQHandler            
   .thumb_set UART7_IRQHandler,Default_Handler

   .weak      UART8_IRQHandler            
   .thumb_set UART8_IRQHandler,Default_Handler

   .weak      SPI4_IRQHandler            
   .thumb_set SPI4_IRQHandler,Default_Handler

   .weak      SPI5_IRQHandler            
   .thumb_set SPI5_IRQHandler,Default_Handler

   .weak      SPI6_IRQHandler            
   .thumb_set SPI6_IRQHandler,Default_Handler

   .weak      SAI1_IRQHandler            
   .thumb_set SAI1_IRQHandler,Default_Handler

   .weak      LTDC_IRQHandler            
   .thumb_set LTDC_IRQHandler,Default_Handler

   .weak      LTDC_ER_IRQHandler            
   .thumb_set LTDC_ER_IRQHandler,Default_Handler

   .weak      DMA2D_IRQHandler            
   .thumb_set DMA2D_IRQHandler,Default_Handler
