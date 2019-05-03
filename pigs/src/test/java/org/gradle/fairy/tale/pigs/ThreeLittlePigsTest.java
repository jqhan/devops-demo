package org.gradle.fairy.tale.pigs;

import org.junit.Test;

import static org.junit.Assert.*;

public class ThreeLittlePigsTest {

    @Test
    public void add() {

        ThreeLittlePigs pigs = new org.gradle.fairy.tale.pigs.ThreeLittlePigs();
        assertEquals(2, pigs.add(1,1));

    }
}