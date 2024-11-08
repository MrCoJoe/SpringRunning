package com.pray.cache;

import java.util.Arrays;
import java.util.Scanner;

/**
 * A
 *
 * @author Cotton Eye Joe
 * @since 2024/10/8 19:38
 */
public class MultiStatusJavaCode {
    static class C {
        private final String fatherField = "time";

        public C() {
        }

        public C(int fatherCField) {
        }
    }

    static class D extends C {
        public D() {
        }

        public D(int fatherCField) {
            super(fatherCField);
        }
    }
    interface K {
        public static void interfaceStatic() {

        }

        public abstract void que();

        default void defaultMethod() {

        }
    }

    static class E extends D implements K {
        public E() {
        }

        public E(int fatherCField) {
            super(fatherCField);
        }

        @Override
        public void que() {
            System.out.println("子类实现父接口的抽象方法");
        }

        @Override
        public void defaultMethod() {
            K.interfaceStatic();
            K.super.defaultMethod();
        }

    }
    public static void main(String[] args) {
        C c = new D();
        c = new E();
        System.out.println(c.fatherField);

        E e = new E();
        e.defaultMethod();
        e.que();
    }
}
