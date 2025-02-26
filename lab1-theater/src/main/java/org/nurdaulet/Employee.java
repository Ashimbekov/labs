package org.nurdaulet;

abstract class Employee extends Person implements IWorkable {
    private double salary;

    public Employee(String name, int age, String contactInfo, double salary) {
        super(name, age, contactInfo);
        this.salary = salary;
    }

    public double getSalary() {
        return salary;
    }
}
