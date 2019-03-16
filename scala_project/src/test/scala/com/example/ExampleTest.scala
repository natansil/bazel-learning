package com.example

import org.scalatest._

class ExampleTest extends FlatSpec {
  "Example" should "give correct answer" in {
	val example = new Example()
    assert(example.add(1,1).equals(2))
  }
}