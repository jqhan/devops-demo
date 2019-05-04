package org.gradle.fairy.tale.bears;


import org.gradle.fairy.tale.Tale;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * The classic tale of "Goldilocks and the Three Bears"
 */
public class BearTest {

    @Test
    public void bearTest() {
        int x = 5;
        assertEquals(1,1);
        var y = 7;
        int z = y + x;
        assertEquals(x, 5);
        assertEquals(y, 7);
        assertEquals(z, 12);
    }

    @Test
    public void bearTest2() {
        Tale tale = new GoldilocksAndTheThreeBears();
        tale.tell();
    }
}
