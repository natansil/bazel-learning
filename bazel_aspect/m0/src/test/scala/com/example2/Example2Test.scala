package com.example2

import org.specs2.mutable.SpecificationWithJUnit

class Example2Test extends SpecificationWithJUnit {

	"Example2" should {
		"return 9 -> 3*3" in {
			val example = new Example2()
			example.multiply(3,3) mustEqual 9
		}
	}
}