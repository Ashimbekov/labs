package org.nurdaulet;

abstract class Person {
    private String name;
    private int age;
    private String contactInfo;

    public Person(String name, int age, String contactInfo) {
        this.name = name;
        this.age = age;
        this.contactInfo = contactInfo;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public abstract void showDetails();
}
