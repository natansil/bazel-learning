package com.example;

import com.google.common.collect.HashMultiset;
import com.google.common.collect.Multiset;

public class Example {
    public int add(int num1, int num2) {

        Multiset<String> multiset = HashMultiset.create();

        multiset.add("a");
        return num1 + num2;
    }
}
