package com.example2

import org.scalatest._

class ExampleTest extends FlatSpec {
  "Example" should "give correct multiplication answer" in {
	val example = new Example2()
    assert(example.multiply(3,3).equals(9))
  }
}