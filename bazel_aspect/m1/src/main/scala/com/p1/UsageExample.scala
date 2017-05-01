package com.p1

import com.example.Example
import com.example2.Example2

class UsageExample {
	def addAndMultiply(number1: Int, number2: Int) = {
		val example = new Example()
		val result = example.add(number1, number2)
		val example2 = new Example2()
		example2.multiply(number1, result)
	}
}
