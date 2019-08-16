#
# file: STM32F7xx_HAL_Driver-sources.cmake
#
# author: Copyright (C) 2019 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

add_library(STM32F7xx_HAL_Driver-integration OBJECT
		${CMAKE_CURRENT_LIST_DIR}/HAL_Delay.cpp
		${CMAKE_CURRENT_LIST_DIR}/HAL_GetTick.cpp
		${CMAKE_CURRENT_LIST_DIR}/SystemCoreClock.cpp)
target_include_directories(STM32F7xx_HAL_Driver-integration PUBLIC
		$<TARGET_PROPERTY:STM32F7xx_HAL_Driver,INTERFACE_INCLUDE_DIRECTORIES>)

target_sources(STM32F7xx_HAL_Driver PRIVATE
		$<TARGET_OBJECTS:STM32F7xx_HAL_Driver-integration>)

add_library(STM32F7xx_HAL_Driver::STM32F7xx_HAL_Driver ALIAS STM32F7xx_HAL_Driver)
