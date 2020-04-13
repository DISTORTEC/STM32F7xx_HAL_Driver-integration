#
# file: CMakeLists.txt
#
# This is the main CMakeLists.txt for STM32F7xx_HAL_Driver integration with distortos
#
# author: Copyright (C) 2019-2020 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

cmake_minimum_required(VERSION 3.8)
project(STM32F7xx_HAL_Driver-integration)

if(NOT DEFINED STM32F7XX_HAL_DRIVER_DIRECTORY)
	message(SEND_ERROR "Variable with path to STM32F7xx_HAL_Driver directory - STM32F7XX_HAL_DRIVER_DIRECTORY - is not "
			"defined")
endif()
if(NOT IS_DIRECTORY "${STM32F7XX_HAL_DRIVER_DIRECTORY}")
	message(SEND_ERROR "Path to STM32F7xx_HAL_Driver directory - "
			"STM32F7XX_HAL_DRIVER_DIRECTORY = ${STM32F7XX_HAL_DRIVER_DIRECTORY} - is not valid")
endif()
if(NOT EXISTS "${STM32F7XX_HAL_DRIVER_DIRECTORY}/CMakeLists.txt")
	message(SEND_ERROR "Path to STM32F7xx_HAL_Driver directory - "
			"STM32F7XX_HAL_DRIVER_DIRECTORY = ${STM32F7XX_HAL_DRIVER_DIRECTORY} - does not contain CMakeLists.txt")
endif()

add_subdirectory("${STM32F7XX_HAL_DRIVER_DIRECTORY}" STM32F7xx_HAL_Driver)

add_library(STM32F7xx_HAL_Driver-object-library OBJECT
		HAL_Delay.cpp
		HAL_GetTick.cpp
		SystemCoreClock.cpp)
target_include_directories(STM32F7xx_HAL_Driver-object-library PRIVATE
		$<TARGET_PROPERTY:STM32F7xx_HAL_Driver,INTERFACE_INCLUDE_DIRECTORIES>)

target_sources(STM32F7xx_HAL_Driver INTERFACE
		$<TARGET_OBJECTS:STM32F7xx_HAL_Driver-object-library>)
