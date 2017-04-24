package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class ExampleTest {

    @Test
    public void testAdd() {
        Example example = new Example();

        int result = example.add(1, 1);

        assertEquals(2, result);

    }
}